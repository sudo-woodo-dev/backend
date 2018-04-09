require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @subject = users(:test)
  end

  test 'show user with given id' do
    get "/users/#{@subject.id}"
    assert_response 201
    parsed_response = JSON.parse(response.body)
    assert_equal parsed_response['username'], 'testuser123'
  end

  test 'creates user when valid user_params' do
    user_params = {
      user: {
        name: 'Test Test',
        username: 'test123',
        email: 'test123@test.com',
        password: 'Password1',
        password_confirmation: 'Password1'
      }
    }

    post '/users', params: user_params
    assert_response 201
    new_user = User.last
    assert_equal new_user.name, 'Test Test'
  end

  test 'does not create user when invalid user_params' do
    user_params = {
      user: {
        name: 'Test Test',
        username: 'test123',
        email: 'test123@test.com',
        password: 'Password1',
        password_confirmation: 'DoesNotMatch'
      }
    }

    post '/users', params: user_params
    assert_response 422
  end
end
