require 'test_helper'

class SubmissionTest < ActiveSupport::TestCase
  
  test "is invalid without first name" do
    submission = Submission.new(first_name: "", last_name: "Wills", email: "jerry@email.com", slogan: "cool race!")
    refute submission.valid? # fails if true is returned
    assert_not_nil submission.errors[:first_name]
  end

  test "is invalid without last name" do
    submission = Submission.new(first_name: "Mary", last_name: "", email: "jerry@email.com", slogan: "cool race!")
    refute submission.valid?
    assert_not_nil submission.errors[:last_name]
  end

  test "is invalid without an email" do
    submission = Submission.new(first_name: "Mary", last_name: "", email: "", slogan: "cool race!")
    refute submission.valid?
    assert_not_nil submission.errors[:email]
  end

  test "is invalid if email is not valid" do
    submission = Submission.new(first_name: "Jeerry", last_name: "Wills", email: "jerryemail.com", slogan: "Cool Race!")
    refute submission.valid?
    assert_not_nil submission.errors[:email]
  end

  test "is invalid without slogan" do
    submission = Submission.new(first_name: "Mary", last_name: "Peterson", email: "jerry@email.com", slogan: "")
    refute submission.valid?
    assert_not_nil submission.errors[:slogan]
  end

  test "is invalid if slogan is too long" do
    submission = Submission.new(first_name: "Jeerry", last_name: "Wills", email: "jerry@email.com", slogan: "kJHBX a c c a casc ac ascacASCACC A CA C A C A C ACACASCASCC CA C Cv sdv sdvv sv asd va v as v av asdvas v sv sdv svsv s vs dv")
    refute submission.valid?
    assert_not_nil submission.errors[:slogan]
  end

end
