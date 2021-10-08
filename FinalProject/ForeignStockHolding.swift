//
//  ForeignStockHolding.swift
//  ForeignStockHolding
//
//  Created by Shubham Behal on 08/10/21.
//

import Foundation

public class ForeignStockHolding: StockHolding
{
    private  var conversionRate: Float = 0.0
    
    init(purchaseSharePrice: Float, currentSharePrice: Float, numberOfShares: Int, companyName: String, conversionRate: Float)
    {
        self.conversionRate = conversionRate
        super.init(purchaseSharePrice: purchaseSharePrice , currentSharePrice: currentSharePrice, numberOfShares: numberOfShares, companyName: companyName)
    }
    
    override public func costInDollars ()-> Float
    {
        return getCurrentPrice() * Float(getNoOfShares()) * conversionRate
    }
    
    override public func valueInDollars ()-> Float
    {
        return getCurrentPrice() * Float(getNoOfShares()) * conversionRate
    }
    
    public func getConversionRate()-> Float{
        return conversionRate
    }
}
