//
//  StockHolding.swift
//  StockHolding
//
//  Created by Shubham Behal on 08/10/21.
//

import Foundation

public class StockHolding :NSObject
{
    var purchaseSharePrice : Float = 0.0
    var currentSharePrice : Float  = 0.0
    var numberOfShares : Int       = 0
    var companyName : String       = ""
    
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
}
