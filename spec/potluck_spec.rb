require './lib/dish'
require './lib/potluck'

RSpec.describe Potluck do
    before do
        @potluck = Potluck.new("7-13-18")
        @couscous_salad = Dish.new("Couscous Salad", :appetizer)
        @cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
        @summer_pizza = Dish.new("Summer Pizza", :appetizer)
        @roast_pork = Dish.new("Roast Pork", :entre)
        @candy_salad = Dish.new("Candy Salad", :dessert)
        @bean_dip = Dish.new("Bean Dip", :appetizer)
    end

    it "exists" do
        expect(@potluck).to be_a(Potluck)
    end

    it "has readable attributes" do
        expect(@potluck.date).to eq("7-13-18")
        expect(@potluck.dishes).to eq([])
    end

    it "can add a dish" do
        @potluck.add_dish(@couscous_salad)
        @potluck.add_dish(@cocktail_meatballs)
        
        expect(@potluck.dishes).to eq([@couscous_salad, @cocktail_meatballs])
        expect(@potluck.dishes.length).to eq(2)
    end

    it "can return all dishes with the given category" do
        @potluck.add_dish(@couscous_salad)
        @potluck.add_dish(@summer_pizza)
        @potluck.add_dish(@roast_pork)
        @potluck.add_dish(@cocktail_meatballs)
        @potluck.add_dish(@candy_salad)
        
        expect(@potluck.get_all_from_category(:appetizer)).to eq([@couscous_salad, @summer_pizza])
        expect(@potluck.get_all_from_category(:appetizer).first).to eq(@couscous_salad)
        expect(@potluck.get_all_from_category(:appetizer).first.name).to eq("Couscous Salad")
    end
    
    it "can return a menu of dishes" do
        @potluck.add_dish(@couscous_salad)
        @potluck.add_dish(@summer_pizza)
        @potluck.add_dish(@roast_pork)
        @potluck.add_dish(@cocktail_meatballs)
        @potluck.add_dish(@candy_salad)
        @potluck.add_dish(@bean_dip)

        expected_hash = {:appetizers=>["Bean Dip", "Couscous Salad", "Summer Pizza"],
                         :entres=>["Cocktail Meatballs", "Roast Pork"],
                         :desserts=>["Candy Salad"]}

        expect(@potluck.menu).to eq(expected_hash)
        
    end

    it "returns the ratio of a category" do
        @potluck.add_dish(@couscous_salad)
        @potluck.add_dish(@summer_pizza)
        @potluck.add_dish(@roast_pork)
        @potluck.add_dish(@cocktail_meatballs)
        @potluck.add_dish(@candy_salad)
        @potluck.add_dish(@bean_dip)

        expect(@potluck.ratio(:appetizer)).to eq(50.0)
    end
end