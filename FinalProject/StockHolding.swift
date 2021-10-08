//
//  StockHolding.swift
//  StockHolding
//
//  Created by Shubham Behal on 08/10/21.
//

import Foundation

public class StockHolding :NSObject
{
    private  var purchaseSharePrice : Float = 0.0
    private var currentSharePrice : Float  = 0.0
    private  var numberOfShares : Int       = 0
    private  var companyName : String       = ""
    
    public init(purchaseSharePrice: Float, currentSharePrice: Float, numberOfShares: Int, companyName: String)
    {
        self.purchaseSharePrice = purchaseSharePrice
        self.currentSharePrice  = currentSharePrice
        self.numberOfShares     = numberOfShares
        self.companyName        = companyName
    }
    
    public func costInDollars ()-> Float
    {
        return purchaseSharePrice * Float(numberOfShares)
    }
    
    public func valueInDollars ()-> Float
    {
        return currentSharePrice * Float(numberOfShares)
    }
    
    public func getPurchasePrice()-> Float{
        return purchaseSharePrice
    }
    
    public func getCurrentPrice()-> Float{
        return currentSharePrice
    }
    
    public func getNoOfShares()-> Int{
        return numberOfShares
    }
    
    public func getCompanyName()-> String{
        return companyName
    }
}
