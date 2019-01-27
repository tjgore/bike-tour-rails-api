require 'test_helper'

class RidersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rider = riders(:one)
  end

  test "should get index" do #test_should_get_index
    get api_v1_riders_url, as: :json
    assert_response :success
  end

  test "should create rider" do
    assert_difference('Rider.count') do
      post api_v1_riders_url, params: { rider: { city: @rider.city, first_name: @rider.first_name, image: @rider.image, last_name: @rider.last_name, latitude: @rider.latitude, longitude: @rider.longitude, state: @rider.state } }, as: :json
    end

    assert_response 201
  end

  test "should show rider" do
    get api_v1_rider_url(@rider), as: :json
    assert_response :success
  end

  test "should update rider" do
    patch api_v1_rider_url(@rider), params: { rider: { city: @rider.city, first_name: @rider.first_name, image: @rider.image, last_name: @rider.last_name, latitude: @rider.latitude, longitude: @rider.longitude, state: @rider.state } }, as: :json
    assert_response 200
  end

  test "should destroy rider" do
    assert_difference('Rider.count', -1) do
      delete api_v1_rider_url(@rider), as: :json
    end

    assert_response 204
  end

end
