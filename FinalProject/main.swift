//
//  main.swift
//  FinalProject
//
//  Created by Shubham Behal on 01/10/21.
//

import Foundation



//Populate an array with 10 instances of StockHolding. Display all the stocks sorted by company name in alphabetical order.


var stocks = [StockHolding]()
/* = [
 StockHolding(purchaseSharePrice : 2.30 , currentSharePrice :  4.50 , numberOfShares : 40 , companyName : "Apple"),
 StockHolding(purchaseSharePrice : 12.19 , currentSharePrice :  10.56 , numberOfShares : 90 , companyName : "Microsoft"),
 StockHolding(purchaseSharePrice : 45.10 , currentSharePrice :  49.51 , numberOfShares : 210 , companyName : "Amazon"),
 StockHolding(purchaseSharePrice : 5.10 , currentSharePrice :  9.51 , numberOfShares : 123 , companyName : "Tesla"),
 StockHolding(purchaseSharePrice : 23.31 , currentSharePrice :  19.15 , numberOfShares : 23 , companyName : "Walmart"),
 StockHolding(purchaseSharePrice : 12.21 , currentSharePrice :  19.20 , numberOfShares : 75 , companyName : "Disney"),
 StockHolding(purchaseSharePrice : 80.0 , currentSharePrice :  79.1 , numberOfShares : 43 , companyName : "PayPal"),
 StockHolding(purchaseSharePrice : 45.2 , currentSharePrice :  49.0 , numberOfShares : 72 , companyName : "Netflix"),
 StockHolding(purchaseSharePrice : 5.5 , currentSharePrice :  2.5 , numberOfShares : 168 , companyName : "Pfizer"),
 StockHolding(purchaseSharePrice : 19.34 , currentSharePrice :  29.34 , numberOfShares : 34 , companyName : "Intel")
 ]*/

/*stocks = stocks.sorted { $0.companyName.lowercased() < $1.companyName.lowercased() }
 
 stocks.forEach{ stock in
 print("Company Name: \(stock.companyName), No. of Shares: \(stock.numberOfShares), Purchase price: \(stock.purchaseSharePrice), Current price: \(stock.currentSharePrice)")
 }*/


//Add at least two instances of ForeignStockHolding to the existing array from part one.
//Display all the stocks sorted by company name in reverse alphabetical order.

/*stocks.append( ForeignStockHolding(purchaseSharePrice : 9.3 , currentSharePrice :  9.4 , numberOfShares : 12 , companyName : "Alibaba",conversionRate : 0.94))
 stocks.append( ForeignStockHolding(purchaseSharePrice : 23.2 , currentSharePrice :  29.34 , numberOfShares : 25 , companyName : "Paytm",conversionRate : 0.5))
 stocks.append( ForeignStockHolding(purchaseSharePrice : 31.0 , currentSharePrice :  29.02 , numberOfShares : 9 , companyName : "Qualcomm",conversionRate : 0.63))
 
 stocks = stocks.sorted { $0.companyName.lowercased() > $1.companyName.lowercased() }
 
 stocks.forEach{ stock in
 print("Company Name: \(stock.companyName), No. of Shares: \(stock.numberOfShares), Purchase price: \(stock.purchaseSharePrice), Current price: \(stock.currentSharePrice)")
 }*/

//Let user enter stocks
getDataFromUser()
displayMenu()



func getDataFromUser(){
    var addMore = true
    
    while(addMore){
        print("Please select type of stock you want to choose :\n1 for Local Stocks\nAnything else for Foreign Stocks")
        let stockType = String(readLine()!)
        print("Please enter Company Name")
        let companyName = String(readLine()!)
        print("Please enter purchase price of stock")
        let purchasePrice = Float(readLine()!)!
        print("Please enter Current price of stock")
        let currentPrice =  Float(readLine()!)!
        print("Please enter number of shares")
        let numberOfShares = Int(readLine()!)!
        
        if(stockType == "1"){
            stocks.append(StockHolding(purchaseSharePrice: purchasePrice, currentSharePrice: currentPrice, numberOfShares: numberOfShares, companyName: companyName))
        }else{
            print("Please enter conversion rate")
            let convRate = Float(readLine()!)!
            stocks.append(ForeignStockHolding(purchaseSharePrice : purchasePrice , currentSharePrice :  currentPrice , numberOfShares : numberOfShares , companyName : companyName,conversionRate : convRate))
        }
        
        print("Want to add more stocks ? press 'y' if yes otherwise press anthing else")
        if(String(readLine()!).lowercased() != "y"){
            addMore = false
        }
    }
}

func displayMenu(){
    print("\nChose option from (1-7) below :")
    print("1 : Display stock with the lowest value")
    print("2 : Display stock with the highest value")
    print("3 : Display most profitable Stock")
    print("4 : Display least profitable Stock")
    print("5 : Display stocks from A-Z")
    print("6 : Display stocks lowest to highest Value")
    print("7 : Exit")
    
    handleMenuSelection()
}

func displayLowestValueStock(){
    stocks = stocks.sorted { $0.getPurchasePrice() < $1.getPurchasePrice()}
    print("Stock with lowest value is ->")
    dispSpecificIndexStock(index : 0)
}

func displayHighestValueStock(){
    stocks = stocks.sorted { $0.getPurchasePrice() > $1.getPurchasePrice()}
    print("Stock with highest value is ->")
    dispSpecificIndexStock(index : 0)
}

func displayMostProfitableStock(){
    var temp :Int = 0
    var maxProfit : Float = calculateProfit(index : 0)
    for i in 0...stocks.count-1
    {
        let profit = calculateProfit(index : i)
        if (maxProfit < profit){
            maxProfit = profit
            temp = i
        }
    }
    print("Most profitable Stock with profit % \(maxProfit) is ->")
    dispSpecificIndexStock( index : temp)
}

func displayLeastProfitableStock(){
    var temp :Int = 0
    var minProfit : Float = calculateProfit(index : 0)
    for i in 0...stocks.count-1
    {
        let profit = calculateProfit(index : i)
        if (minProfit > profit){
            minProfit = profit
            temp = i
        }
    }
    print("Least profitable Stock with profit % \(minProfit) is ->")
    dispSpecificIndexStock( index : temp)
}

func displayStocksAlphabatically(){
    stocks = stocks.sorted { $0.getCompanyName().lowercased() < $1.getCompanyName().lowercased()}
    displayStocks()
}

func displayStocksLowHigh(){
    stocks = stocks.sorted { $0.getPurchasePrice() < $1.getPurchasePrice()}
    displayStocks()
}

func displayStocks(){
    if(stocks.isEmpty){
        print("No stocks available...Please enter some records first!!!")
    }else{
        stocks.forEach{ stock in
            print("Company Name: \(stock.getCompanyName()), No. of Shares: \(stock.getNoOfShares()), Purchase price: \(stock.getPurchasePrice()), Current price: \(stock.getCurrentPrice())")
        }
    }
}

func dispSpecificIndexStock(index : Int){
    if(stocks.isEmpty){
        print("No stocks available...Please enter some records first!!!")
    }else{
        let stock = stocks[index]
        print("Company Name: \(stock.getCompanyName()), No. of Shares: \(stock.getNoOfShares()), Purchase price: \(stock.getPurchasePrice()), Current price: \(stock.getCurrentPrice())")
    }
}

func calculateProfit(index : Int)-> Float
{
    return ((stocks[index].getCurrentPrice() - stocks[index].getPurchasePrice() ) * 100
            / stocks[index].getPurchasePrice())
}

func handleMenuSelection(){
    var isExit = false
    switch String(readLine()!){
    case "1":
        displayLowestValueStock()
    case "2":
        displayHighestValueStock()
    case "3":
        displayMostProfitableStock()
    case "4":
        displayLeastProfitableStock()
    case "5":
        displayStocksAlphabatically()
    case "6":
        displayStocksLowHigh()
    case "7":
        isExit = true
        break
    default:
        print("Unvalid option")
    }
    
    if(!isExit){
        print("Return to main menu ? Press 'y' if yes otherwise press any key")
        if(String(readLine()!).lowercased()=="y"){
            displayMenu()
        }
    }
}







