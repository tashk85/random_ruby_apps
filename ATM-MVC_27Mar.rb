# ** ATM **
# dispense money --> Model
# respond to user choice --> Controller
# display balance --> View
# retrieve balance --> Controller
# prompt for user input --> View
# respond to invalid pin --> Controller


class AtmModel

    def initialize(balance: 0.00, user_pin: 1234)
        @user_pin = user_pin
        @balance = balance
    end
    
    def withdraw(amount)
        if @balance >= amount
            @balance -= amount
            return @balance
        else
            return nil
        end
    end

    def deposit(amount)
        @balance += amount
    end

    def pinNum
        @user_pin
    end

end

class AtmView
    def greeting
        puts "Welcome to the ATM!"
    end
    
    def enterPin
        puts "Please enter PIN code"
        gets.chomp.to_i
    end

    def wrongPin
        puts "The PIN is incorrect."
    end

    def menu
        choice = nil
        while choice != 1 && choice != 2 && choice != 3 && choice != 4
            puts "Enter (1) to deposit, (2) to withdraw, (3) to check balance, or (4) to exit"
            choice = gets.chomp.to_i
        end
            
        choice
    end
    
    def withdrawMoney
        puts "How much would you like to withdraw?"
        gets.chomp.to_f
    end

    def emptyBalance
        puts "You don't have that amount available."
    end

    def depositMoney
        puts "How much would you like to deposit?"
        gets.chomp.to_f
    end

    def balanceCheck(count)
        puts "Your balance is $#{'%.2f' % count}."
    end

    def exit
        puts "Thank you for using the ATM."
    end
end

class AtmController

    def initialize
        @AtmModel = AtmModel.new
        @AtmView = AtmView.new
      end
    
      def run
        @AtmView.greeting
        pinNum = @AtmModel.pinNum
        enteredPin = @AtmView.enterPin

        if enteredPin == pinNum
            choice = @AtmView.menu

            while choice != 4
                if choice == 1
                    user_desposit = @AtmView.depositMoney
                    balance2 = @AtmModel.deposit(user_desposit)
                    @AtmView.balanceCheck(balance2) 
                end
                if choice == 2
                    user_withdraw = @AtmView.withdrawMoney
                    balance2 = @AtmModel.withdraw(user_withdraw)
                    
                    if balance2.nil?
                        @AtmView.emptyBalance
                    else
                        @AtmView.balanceCheck(balance2)
                    end
                end
                if choice == 3
                    balance = @AtmModel.deposit(0.00)
                    @AtmView.balanceCheck(balance) 
                end
              choice = @AtmView.menu
            end
            @AtmView.exit
        else
            @AtmView.wrongPin
        end

        # choice = @AtmView.menu 
        
        # while choice != "3"
        #     if choice == "1"
        #         moneyBalance = @AtmModel.deposit(6)
        #         @AtmView.deposit(moneyBalance)
        #     end
        #     if choice == "1"
        #     money = @AtmModel.withdraw
        #     if money.nil?
        #       @AtmView.emptyBalance
        #     else
        #       @AtmView.withdrawMoney
        #     end
        #   end
        #   choice = @AtmView.menu
        # end
        # @AtmView.exit
      end

end

AtmTransaction = AtmController.new
AtmTransaction.run