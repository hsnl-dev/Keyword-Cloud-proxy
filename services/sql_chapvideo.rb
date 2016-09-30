require 'mysql2'

# Find video url
class SqlChapvideo
  def self.call(course_id:)
    db = Mysql2::Client.new(host: ENV['HOSTNAME'], username: ENV['USERNAME'],
                            password: ENV['PASSWORD'], database: ENV['DATABASE'])
    sql = "SELECT * FROM #{ENV['URL']} WHERE cid = #{course_id}"
    result = db.query(sql)
    chapvideoInfo = []
    result.each do |urlid|
      chapvideoInfo.push(urlid)
    end
    chapvideoInfo
  end
end
