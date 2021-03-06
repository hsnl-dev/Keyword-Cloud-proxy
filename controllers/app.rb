require 'json'

class ProxyServer < Sinatra::Base
  get '/api/v1/app/account/:account' do
    # protected!
    content_type 'application/json'
    begin
      account = params[:account]
      result = SqlAccount.call(
        account: account)
      JSON.pretty_generate(id: result['id'], password: result['password'])
    rescue => e
      logger.info "User ID could not be authenticated: #{e}"
      halt 404
    end
  end

  get '/api/v1/app/course/:uid' do
    # protected!
    content_type 'application/json'
    begin
      uid = params[:uid]
      result = SqlCourse.call(
        uid: uid)
      JSON.pretty_generate(data: result)
    rescue => e
      logger.info "FAILED to find authorized courses for account: #{e}"
      halt 404
    end
  end

  get '/api/v1/app/chapter/:course_id' do
    # protected!
    content_type 'application/json'
    begin
      course_id = params[:course_id]
      result = SqlChapter.call(
        course_id: course_id)
      JSON.pretty_generate(data: result)
    rescue => e
      logger.info "FAILED to find chapters for courses: #{e}"
      halt 404
    end
  end

  get '/api/v1/app/url/:course_id/:chapter_id' do
    # protected!
    content_type 'application/json'
    begin
      course_id = params[:course_id]
      chapter_id = params[:chapter_id]
      result = SqlUrl.call(
        course_id: course_id, chapter_id: chapter_id)
      JSON.pretty_generate(data: result)
    rescue => e
      logger.info "FAILED to find video urls for course: #{e}"
      halt 404
    end
  end

  get '/api/v1/app/chapvideo/:course_id' do
    # protected!
    content_type 'application/json'
    begin
      course_id = params[:course_id]
      result = SqlChapvideo.call(course_id: course_id)
      JSON.pretty_generate(data: result)
    rescue => e
      logger.info "FAILED to find video urls for course: #{e}"
      halt 404
    end
  end
end
