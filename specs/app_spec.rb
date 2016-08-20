require 'base64'
require_relative './spec_helper'

describe 'Testing App resource routes' do

  describe 'Finding existing users' do
    before do
      @account = 'bjE5OTMyMTJAeWFob28uY29tLnR3'

      @result = SqlAccount.call(
        account: @account)
    end

    it 'HAPPY: should find an existing user' do
      get "/api/v1/app/account/#{@account}", nil

      _(last_response.status).must_equal 200

      results = JSON.parse(last_response.body)

      _(results['id']).must_equal 4400
    end

    it 'SAD: should not return user without authorization' do
      get "/api/v1/app/account/#{@account}"
      _(last_response.status).must_equal 404
    end
  end

  describe 'Finding existing courses' do
    before do
      @uid = 4400

      @result = SqlCourse.call(
        uid: gi@uid)
    end

    it 'HAPPY: should find an existing user' do
      get "/api/v1/app/course/#{@account}", nil

      _(last_response.status).must_equal 200

      results = JSON.parse(last_response.body)

      _(results['id']).must_equal 4400
    end

    it 'SAD: should not return user without authorization' do
      get "/api/v1/app/course/#{@account}"
      _(last_response.status).must_equal 404
    end
  end

end
