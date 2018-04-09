require 'test_helper'

class AreasControllerTest < ActionDispatch::IntegrationTest
    def setup
      @subject = areas(:test)
    end

    test 'show user with given id' do
      get "/areas/#{@subject.id}"
      assert_response 201
      parsed_response = JSON.parse(response.body)
      assert_equal parsed_response['neighborhood'], 'Little Italy'
    end

end
