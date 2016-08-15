require 'mysql2'

# Find video url
class SqlUrl
  def self.call(course_id:, chapter_id:)
    db = Mysql2::Client.new(host: ENV['HOSTNAME'], username: ENV['USERNAME'],
                            password: ENV['PASSWORD'], database: ENV['DATABASE'])
    sql = "SELECT chapter_order, content_order, vid, name, urls FROM #{ENV['URL']} WHERE cid = #{course_id} AND chid = #{chapter_id}"
    result = db.query(sql)
    urlInfo = []
    result.each do |urlid|
      urlInfo.push(urlid)
    end
    urlInfo
  end
end
