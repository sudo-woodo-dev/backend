require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @subject = User.new(name: 'Test User',
                        username: 'test101',
                        email: 'TestUser@test.com',
                        password: 'Foobared1',
                        password_confirmation: 'Foobared1')
  end

  test 'should be valid' do
    assert @subject.valid?
  end

  test 'name should be present' do
    @subject.name = '     '
    assert_not @subject.valid?
  end

  test 'username should be present' do
    @subject.username = '     '
    assert_not @subject.valid?
  end

  test 'email should be present' do
    @subject.email = '     '
    assert_not @subject.valid?
  end

  test 'password should be present' do
    @subject.password = '     '
    assert_not @subject.valid?
  end

  test 'password_confirmation should be present' do
    @subject.password_confirmation = '     '
    assert_not @subject.valid?
  end

  test 'name should have a maximum length' do
    @subject.name = 'a' * 26
    assert_not @subject.valid?
  end

  test 'username should have a minimum length' do
    @subject.username = 'a' * 5
    assert_not @subject.valid?
  end

  test 'username should have a maximum length' do
    @subject.username = 'a' * 21
    assert_not @subject.valid?
  end

  test 'password should have a minimum length' do
    @subject.password = 'a' * 5
    assert_not @subject.valid?
  end

  test 'password_confirmation should have a maximum length' do
    @subject.password_confirmation = 'a' * 21
    assert_not @subject.valid?
  end

  test 'name should contain letters and whitespace' do
    @subject.name = 'Test1 User1'
    assert_not @subject.valid?
  end

  test 'username should be alphanumeric' do
    @subject.username = 'Testuser1!'
    assert_not @subject.valid?
  end

  test 'email should be valid' do
    @subject.email = 'test.com'
    assert_not @subject.valid?
  end

  test 'password should contain at least one capital letter' do
    @subject.password = @subject.password_confirmation = 'password1'
    assert_not @subject.valid?
  end

  test 'password should contain at least one digit' do
    @subject.password = @subject.password_confirmation = 'Password'
    assert_not @subject.valid?
  end
end
