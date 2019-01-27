require 'test_helper'

class SubmissionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @submission = submissions(:one)
  end

  test "should get index" do
    get api_v1_submissions_url, as: :json
    assert_response :success
  end

# 2 assertions
  test "should create submission" do
    assert_difference('Submission.count') do
      post api_v1_submissions_url, params: { submission: { email: @submission.email, first_name: @submission.first_name, last_name: @submission.last_name, slogan: @submission.slogan } }, as: :json
    end

    assert_response 201
  end

# 4 assertions
  test "should not create submission without required fields" do
    assert_no_difference('Submission.count') do
       post api_v1_submissions_url, params: { submission: { email: "", first_name: "tommy", last_name: "billy", slogan: "This awesome race!" } }, as: :json
    end
    assert_no_difference('Submission.count') do
       post api_v1_submissions_url, params: { submission: { email: "test@email.com", first_name: "", last_name: "billy", slogan: "This awesome race!" } }, as: :json
    end
     assert_no_difference('Submission.count') do
       post api_v1_submissions_url, params: { submission: { email: "test@email.com", first_name: "tommy", last_name: "", slogan: "This awesome race!" } }, as: :json
    end
     assert_no_difference('Submission.count') do
       post api_v1_submissions_url, params: { submission: { email: "test@email.com", first_name: "tommy", last_name: "billy", slogan: "" } }, as: :json
    end
  end

  test "should not create submission if slogan too long" do
   assert_no_difference('Submission.count') do
       post api_v1_submissions_url, params: { submission: { email: "test@email.com", first_name: "tommy", last_name: "billy", slogan: "twgshjahcjavcjhasvcjhvajhvcajghvjhvlchcjchjhcvcvgavcaycvkasjcvhjakvcjhvhajcvacvkavcjasvckjhvakchv chvajkcvjhAVCKJ ACJHVAKCJHVAHCVKAVC AJHCVJCHVJAVChvbdfkljvb  vvjsjdavbjvsdhjvasdgvjhasdvjhbasdvbsdv" } }, as: :json
    end
  end

  test "should not create submission if email is not valid" do
    assert_no_difference('Submission.count') do
       post api_v1_submissions_url, params: { submission: { email: "testemail.com", first_name: "tommy", last_name: "billy", slogan: "Cool race" } }, as: :json
    end
  end


=begin
  test "should show submission" do
    get api_v1_submission_url(@submission), as: :json
    assert_response :success
  end

  test "should update submission" do
    patch api_v1_submission_url(@submission), params: { submission: { email: @submission.email, first_name: @submission.first_name, last_name: @submission.last_name, slogan: @submission.slogan } }, as: :json
    assert_response 200
  end

  test "should destroy submission" do
    assert_difference('Submission.count', -1) do
      delete api_v1_submission_url(@submission), as: :json
    end

    assert_response 204
  end
=end
end
