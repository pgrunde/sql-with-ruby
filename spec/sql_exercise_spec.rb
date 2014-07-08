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

  describe "#id_and_name_for_customers" do
    it "returns only the id and name for each customer" do
      skip
      customers = sql_exercise.id_and_name_for_customers

      expect(customers.length).to eq(10)

      first_customer = customers.first

      expect(first_customer).to eq({"id" => "1", "name" => "Donato Rempel"})
    end
  end

  describe "#all_items" do
    it "returns all items" do
      skip
      items = sql_exercise.all_items

      expect(items.length).to eq(9)

      first_item = items.first

      expect(first_item["name"]).to eq("ski01")
      expect(first_item["description"]).to eq("downhill ski")
    end
  end

  describe "#find_item_by_name" do
    it "returns the item with the given name" do
      skip
      expect(sql_exercise.find_item_by_name("boot01")).to eq({"id" => "7", "name" => "boot01", "description" => "hiking boots"})
    end

    it "returns nil if no item is found" do
      skip
      expect(sql_exercise.find_item_by_name("nonehere")).to eq(nil)
    end
  end

  describe "#count_customers" do
    it "returns the number of customers" do
      skip
      expect(sql_exercise.count_customers).to eq(10)
    end
  end
end
