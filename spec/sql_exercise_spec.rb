require "spec_helper"

describe SqlExercise do

  let(:sql_exercise) { SqlExercise.new }

  describe "#all_customers" do
    it "returns a hash of all the customer data" do
      customers = sql_exercise.all_customers

      expect(customers.length).to eq(10)

      first_customer = customers.first

      expect(first_customer["name"]).to eq("Donato Rempel")
      expect(first_customer["email"]).to eq("ladarius@waelchi.org")
    end
  end

  describe "#limit_customers" do
    it "can return one customer" do
      expected_customers = [
        {
          "id" => "1",
          "name" => "Donato Rempel",
          "email" => "ladarius@waelchi.org",
          "address" => "890 Ullrich Plains",
          "city" => "Janachester",
          "state" => "Virginia",
          "zipcode" => "77714"
        }
      ]

      expect(sql_exercise.limit_customers(1)).to eq(expected_customers)
    end

    it "can return three customers" do
      skip

      expected_customers = [
        {
          "id" => "1",
          "name" => "Donato Rempel",
          "email" => "ladarius@waelchi.org",
          "address" => "890 Ullrich Plains",
          "city" => "Janachester",
          "state" => "Virginia",
          "zipcode" => "77714"
        },
        {
          "id" => "2",
          "name" => "Tyrell Von DDS",
          "email" => "cleo_frami@bartondenesik.name",
          "address" => "63337 Abdullah Camp",
          "city" => "Verdieborough",
          "state" => "Colorado",
          "zipcode" => "69882-7027"
        },
        {
          "id" => "3",
          "name" => "Ms. Sofia Rowe",
          "email" => "jacky_funk@bayerprosacco.name",
          "address" => "1991 Kyler Village",
          "city" => "Opheliaborough",
          "state" => "Ohio",
          "zipcode" => "15599-5395"
        }
      ]

      expect(sql_exercise.limit_customers(3)).to eq(expected_customers)
    end
  end

  describe "#order_customers" do
    it "can orders the customers in alphabetical order" do
      skip
      alphabetical_customers = sql_exercise.order_customers("ASC")

      expect(alphabetical_customers.first["name"]).to eq("Coleman Prohaska Jr.")
      expect(alphabetical_customers.last["name"]).to eq("Zelma Davis")
    end

    it "can orders the customers in reverse alphabetical order" do
      skip
      alphabetical_customers = sql_exercise.order_customers("DESC")

      expect(alphabetical_customers.first["name"]).to eq("Zelma Davis")
      expect(alphabetical_customers.last["name"]).to eq("Coleman Prohaska Jr.")
    end
  end
end
