//
//  File.swift
//  CardView
//
//  Created by ali on 11/3/20.
//

import Foundation


class BankHelper {
     private static var bankNames = [
        "ansarbank",
        "Asset-2",
        "ayandeh",
        "Bank-Day-logo-LimooGraphic",
        "bank-meli",
        "bankmarkazi",
        "banksepah",
        "cina",
        "enbank",
        "Gardeshgari-logo-LimooGraphic",
        "ghavamin",
        "hekmat",
        "Iranzamin-logo-LimooGraphic",
        "karafarin",
        "keshavarzi",
        "khavarmiane",
        "Kosar-logo-LimooGraphic",
        "maskan",
        "mehreghteshad",
        "mehriranian",
        "mellat",
        "noor",
        "parsian",
        "pasargad",
        "postbank",
        "refah",
        "resalat",
        "Saderat",
        "saman",
        "sanatvamadan",
        "sarmaye",
        "shahr",
        "Shaparak",
        "tejarat",
        "tosee",
        "toseesaderat",
        "toseetavon"
     ]
    private static var index = 0
    
    public class func getNextBankImagesGroup() -> [String]{
        var response = [String]()
        var count = 0
        for i in self.index ..< self.bankNames.count {
            count += 1
            response.append(bankNames[i])

            if count == 4{
                self.index = i % 36
                return response
            }
        }
        return ["","","",""]
    }
}
