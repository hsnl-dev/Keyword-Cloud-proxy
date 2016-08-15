require 'mysql2'
require 'base64'

# Find account and check password
class SqlAccount
  def self.call(account:)
    account = Base64.strict_decode64(account)
    db = Mysql2::Client.new(host: ENV['HOSTNAME'], username: ENV['USERNAME'],
                            password: ENV['PASSWORD'], database: ENV['DATABASE'])
    sql = "SELECT id, password FROM #{ENV['ACCOUNT']} WHERE email = '#{account}' AND deleted = 0"
    result = db.query(sql)
    result.first
  end
end
