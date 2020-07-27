# Github Fuzzy Trader Project


This API allows to create an investment portfolio and also obtain a list with all investments made in the api showing its total value by the amount of investments.
It uses Ruby 2.7.1, Rails 6 and it is needed Postgres 12.

# What do you need to run the project

Clone this project and run those commands in sequence:

* bundle install
* rails db:create
* rails db:migrate
* rails s

# API documentation

[API mind map](http://www.xmind.net/m/DasHiM)

# How it works

* Put the get path (**'(your url)/api/v1/investment'**) and pass in body a value.
* see all the investments you can make with the amount informed.
* Put the post path (**'(your url)/api/v1/wallet'**) and pass in body a paper and quantity.
* Put the get path (**'(your url)/api/v1/wallet'**) to see all investiments and values in wallet.

# How to get investments
## To get a investments for an informed value: 
### You need to access 'GET: api/v1/investment' route passing a value in USD. 

# How to Post Wallet
## To post a investment on wallet:
### You need to access 'POST: api/v1/wallet' route passing a paper and quantity. 

# How to Get Wallet
## To get all investment on wallet:
### You need to access 'Get: api/v1/wallet'. 

# Requests examples and given returns

1. When user gives the correct parameters for see all investments:
![](https://github.com/Odoia/fuzzy-trader-api/blob/development/images/get-investments.png)
2. When user gives the correct parameters for create a wallet:
![](https://github.com/Odoia/fuzzy-trader-api/blob/development/images/post-wallet.png)
3. When user see all investments in wallet:
![](https://github.com/Odoia/fuzzy-trader-api/blob/development/images/post-wallet.png)

# TODO list (improvements for the future):

* Add a mock tests.
* Add a register user.
* Add a money in account user.
* Add a autenticate to user.
