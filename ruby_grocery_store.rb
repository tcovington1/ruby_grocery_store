# √ Display a menu in the console for the user to interact with.
# √ Create a default array of hashes that represent items at a grocery store.
# √ Create a menu option to add items to a user's grocery cart.
# √ Create a menu option to display all the items in the cart.
# √ Create a menu option to remove an item from the users cart.
# √ Create a menu option to show the total cost of all the items in the user's cart.
# √ Add new items to the grocery store.
# TODO Zip it up and turn it in!

# * Bonus

#TODO Allow a user to remove multiple items at once from the cart.
#TODO Assign the user an amount of money to start.
#TODO Give the user the option to "Check out".
#TODO If they have enough money, their cart gets cleared and money is subtracted.
#TODO If they don't have enough money, they have to delete items.
#TODO Apply some sort of coupon system.
#TODO For example, a 20% off coupon that takes the price of all items down by 20%.
#TODO Apply taxes to transaction.
#TODO A menu option that shows a history of all the items purchased. (While the script runs)
#TODO Grocery store items have a quantity. (They can be out of stock)

# ! 8/17 need to figure out how to count how many things are in cart and add them all up

@cart = []
@checkout = []
# @checkout.sum
@products = [
  { name: "bannana", price: 2 },
  { name: "bread", price: 3 },
  { name: "milk", price: 2 },
  { name: "nutella", price: 5 },
]

@cash_amount = 15.00

def menu
  puts " "
  puts "--Welcome to the TK Store--"
  puts " "
  puts "Please make a selection:"
  puts "1) View our products"
  puts "2) View your cart"
  puts "3) Add items to cart"
  puts "4) Remove items from cart"
  puts "5) Show your total"
  puts "6) Add an item to our store"
  puts "7) Exit"
  print "> "
  @user_selection = gets.chomp
  menu_options
end

def menu_options
  if @user_selection == "1"
    view_products
  elsif @user_selection == "2"
    user_cart
  elsif @user_selection == "3"
    view_products
  elsif @user_selection == "4"
    remove_from_cart
  elsif @user_selection == "5"
    puts " "
    puts "You haven't added any items to the cart yet."
  elsif @user_selection == "6"
    add_new_items
  elsif @user_selection == "7"
    exit
  else 
    puts "Sorry that wasn't an option..."
    menu
  end
end

def view_products
  puts " "
  puts "--Our Products--"
  puts " "
  puts "Wallet: $#{@cash_amount}"
  puts " "
  @products.size.times do |i|
    # puts "#{i}"
    puts "#{i+1}) Item: #{@products[i][:name]}"
    puts "  Price: $#{@products[i][:price]}"
  end
  add_to_cart
end
  

def add_to_cart
  puts " "
  # view_products
  puts "Would you like to add an item to the cart? y/n"
  add_item = gets.chomp
  if add_item == "y"
    add_item_to_cart
  elsif add_item == "n"
    small_menu
  else
    puts "Invalid Option"  
    small_menu
  end
end

def add_item_to_cart
  puts " "
  puts "Choose an item number:"
  item_add = gets.to_i
  if item_add == 1
    @cart << @products[0]
    # @checkout << @products[0][:price]
    add_another
  elsif item_add == 2
    @cart << @products[1]
    add_another
  elsif item_add == 3
    @cart << @products[2]
    add_another
  elsif item_add == 4
    @cart << @products[3]
    add_another
  else
    puts "That was not an option.."
  end
end

def add_another
  puts "Would you like to add another item? y/n"
  another = gets.chomp
  if another == 'y'
    add_item_to_cart
  elsif another == 'n'
    user_cart
    small_menu
  end
end


#todo need to create a better menu to end
def user_cart
  puts " "
  puts "--Your Cart--"
  @cart.size.times do |i|
    # puts "#{i}"
    if @cart == [' ']
      puts "Your cart is empyty.."
      view_products
    else  
    puts " "
    puts "#{i+1}) Item: #{@cart[i][:name]}"
    puts "Price: $ #{@cart[i][:price]}"
    end
  end
  puts " "
    # puts "Your total is currently $#{@cart[0][:price] + @cart[1][:price]}"
  # cart_total
  small_menu
end

# def cart_total
#   @cart.size.times do |i|
#     total = 0
#     @products.size.times do |i|
#     total += @grocery_cart[i][:price]
#   end
#   puts "Yout total is #{total}, have a nice day"
#   # puts “your total is $ #{total}, have an nice day”
#   end
#   small_menu
# end

def small_menu
  puts " "
  puts "What would you like to do next?"
  puts "1) Vew Products"
  puts "2) View Cart"
  puts "3) Remove item"
  puts "4) Add Item to Store"
  puts "5) Checkout"
  puts "6) Exit"
  answer = gets.chomp.to_i
  if answer == 1
    view_products
  elsif answer == 2
    user_cart
  elsif answer == 3
    remove_from_cart
  elsif answer == 4
    add_new_items
  elsif answer == 5
    checkout 
  elsif answer == 6
    exit
  else
    puts "Sorry that's not an option.."
  end
end


def remove_from_cart
  # user_cart
  puts " "
  puts "Which item number would you like to remove?"
  remove_item = gets.chomp.to_i
  if remove_item == 1
    @cart.delete_at(0)
    user_cart
  elsif remove_item == 2
    @cart.delete_at(1)
    user_cart
  elsif remove_item == 3
    @cart.delete_at(2)
    user_cart
  elsif remove_item == 4
    @cart.delete_at(3)
    user_cart
  else
    puts "Sorry that item wasn't in your basket"
  end
  menu
end

def checkout
  puts " "
  puts "--Checkout--"
  puts " "
  @total = @cart[0][:price] + @cart[1][:price]
  @calc_end = @cash_amount - @total
  puts "Your total is $ #{@total}"
  puts "Your wallet amount is #{@cash_amount}"
  puts " "
  puts "Please pay : $#{@cash_amount} - $#{@total} = $#{@calc_end}"
  puts "Thank you for shopping at the TK store!"
  puts " "
  exit
end

def add_new_items
  puts " "
  puts "--Add an Item to Our Store--"
  puts "What is the name of the item you wish to add?"
  new_item_name = gets.chomp
  # @products[:name] = @new_item_name
  puts "What would you like the price to be?"
  new_item_price = gets.chomp.to_f
  new_hash = {
    name: new_item_name,
    price: new_item_price
  }
  @products << new_hash
  view_products
  # puts "#{@products}"
  small_menu
end

def cash_calc
#  get the amount of cash we have
#  what is in the cart, and what is the total price
#     if total_price is < cash_amount do subtract and calculate new cash_amount, 
        # clear the cart
  puts "you have #{@cash_amount} to spend."
  puts "your cart total is"      
end

menu



# arr = [
#   {name: taylor, age: 28}
# ]

