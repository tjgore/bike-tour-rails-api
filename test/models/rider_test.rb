require 'test_helper'

class RiderTest < ActiveSupport::TestCase

  test "is valid with required fields" do
    rider = Rider.new(first_name: "tim", last_name: "gore", city: "New York", state:"New York", latitude:"34.09", longitude:"20.34")
    assert rider.valid?
  end

end
