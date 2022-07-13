class Potluck
    attr_reader :date,
                :dishes
    def initialize(date)
        @date = date
        @dishes = []
    end

    def add_dish(dish)
        @dishes << dish
    end

    def get_all_from_category(category)  

        ## single line syntax, this as the same functionality as a before each block --->
        dishes.find_all { |dish| dish.category == category }

        ##Using each --->
        # category_dishes = []
        # @dishes.each do |dish|
        #     if dish.category == category 
        #         category_dishes << dish 
        #     end 
        # end
        # category_dishes

        ##Using select (for our purposes this is essentially the same as find_all, but you can learn about the suble difference here https://stackoverflow.com/questions/20999192/is-find-all-and-select-the-same-thing) --->
        # dishes.select do |dish|
        #     dish.category == category
        #   end
    end

    def menu

        ##This may not seem like the prettiest or most efficient way to solve this, but this is completely valid and what is all they expect of you at this point in mod1 in an IC!
        menu_hash = {
            appetizers: [],
            entres: [],
            desserts: []
        }
        @dishes.each do |dish|
            if dish.category == :appetizer
                menu_hash[:appetizers] << dish.name
                menu_hash[:appetizers].sort!
            elsif dish.category == :entre
                menu_hash[:entres] << dish.name
                menu_hash[:entres].sort!
            elsif dish.category == :dessert
                menu_hash[:desserts] << dish.name
                menu_hash[:desserts].sort!
            end
        end
        menu_hash 
    
        ##Khoa's super handy way of solving this using our previously made method - the .map(&:name) is a fun shorthand for .map{ |dish| dish.name} --->
        # {
        #     appetizers: get_all_from_category(:appetizer).map{ |dish| dish.name}.sort,
        #     entres: get_all_from_category(:entre).map(&:name).sort,
        #     desserts: get_all_from_category(:dessert).map(&:name).sort
        # }

        ## My not quite as handy way of solving this, but knowing how to check if a key/value pair exists similarly to how I do on line 64 will be handy in future ICs --->
        # menu_hash = {}
        # @dishes.each do |dish|
        #     dish_category = dish.category.to_s + "s"
        #     if menu_hash[dish_category.to_sym].nil?
        #         menu_hash[dish_category.to_sym] = [dish.name]
        #     else
        #         menu_hash[dish_category.to_sym] << dish.name
        #         menu_hash[dish_category.to_sym].sort!
        #     end
        # end
        # menu_hash
    end 

    def ratio(category)
        (get_all_from_category(category).count.to_f / @dishes.count.to_f) * 100
    end
end