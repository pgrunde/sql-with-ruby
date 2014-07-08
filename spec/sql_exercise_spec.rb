require "spec_helper"

describe SqlExercise do

  let(:sql_exercise) { SqlExercise.new }

  describe "#display_customers" do
    it "returns a hash of all the customer data" do
      customers = sql_exercise.all_customers

      expect(customers.length).to eq(10)

      first_customer = customers.first

      expect(first_customer["name"]).to eq("Donato Rempel")
      expect(first_customer["email"]).to eq("ladarius@waelchi.org")
    end
  end
end
