require 'mysql2'

# Find chapter information
class SqlChapter
  def self.call(course_id:)
    db = Mysql2::Client.new(host: ENV['HOSTNAME'], username: ENV['USERNAME'],
                            password: ENV['PASSWORD'], database: ENV['DATABASE'])
    sql = "SELECT id, name, chapter_order FROM #{ENV['CHAPTER']} WHERE cid = #{course_id} AND deleted = 0"
    result = db.query(sql)
    chapterInfo = []
    result.each do |chid|
      chapterInfo.push(chid)
    end
    chapterInfo
  end
end
