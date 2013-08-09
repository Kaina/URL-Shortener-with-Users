class UrlValidator < ActiveModel::EachValidator
  attr_accessor :url

  def validate_each(record, attribute, value)
    self.url = record.long_url
    unless starts_properly && valid_uri
      record.errors[attribute] << (options[:message] || "is not a url")
    end
  end

  def starts_properly
    url =~ /http:\/\// || url =~ /https:\/\//
  end

  def valid_uri
    url =~ /^#{URI::regexp}$/
  end
end