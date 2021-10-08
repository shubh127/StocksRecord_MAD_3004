//
//  ForeignStockHolding.swift
//  ForeignStockHolding
//
//  Created by Shubham Behal on 08/10/21.
//

import Foundation

public class ForeignStockHolding: StockHolding
{
    var conversionRate: Float = 0.0
    
    init(purchaseSharePrice: Float, currentSharePrice: Float, numberOfShares: Int, companyName: String, conversionRate: Float)
    {
        self.conversionRate = conversionRate
        super.init(purchaseSharePrice: purchaseSharePrice , currentSharePrice: currentSharePrice, numberOfShares: numberOfShares, companyName: companyName)
    }
    
    override public func costInDollars ()-> Float
    {
        return purchaseSharePrice * Float(numberOfShares) * conversionRate
    }
    
    override public func valueInDollars ()-> Float
    {
        return currentSharePrice * Float(numberOfShares) * conversionRate
    }
}
