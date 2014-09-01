require 'uri'
require 'net/https'

class ChatworkApi
  attr_accessor :token

  @@fqdn = "https://api.chatwork.com"


  def initialize(token)
    @token = token
  end

  def send_message(room_id, title, message)
    uri = @@fqdn + "/v1/rooms/#{room_id}/messages"
    body = build_body(title, message)

    uri_parsed = URI.parse(uri)
    https = Net::HTTP.new(uri_parsed.host, 443)
    https.use_ssl = true
    https.verify_mode = OpenSSL::SSL::VERIFY_NONE

    query = build_http_request_params({:body => body})
    header = {
      "X-ChatWorkToken" => @token
    }
    return https.post(uri_parsed.path, query, header)
  end


  private

  #== 引数のハッシュをGetパラメータ文字列に直す
  def build_http_request_params(hash)
    raise StandardError, "パラメータ不正: " + hash.inspect unless hash.is_a? Hash

    result = ""
    hash.each do |key,value|
      raise StandardError, "パラメータ不正: " + hash.inspect if value.is_a? Hash

      result += "&" unless result == ""
      val = (value.is_a? Array) ? value.join(',') : value
      result += key.to_s + "=" + val.to_s
    end

    result
  end

  #== テキストをChatWorkへ投稿する形式にパースする
  def build_body(title, message)
    "[info][title]#{title}[/title]#{message}[/info]"
  end


end
