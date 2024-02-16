//
//  HierarchicalCodableData.swift
//  PreProject8
//
//  Created by Bruno Oliveira on 16/02/24.
//

import SwiftUI

struct User: Codable {
    var name: String
    var address: Address
}

struct Address: Codable {
    var street: String
    var city: String
}

//Decoding array inside another array, using different data types
//If you want to decode this kind of hierarchical data, the key is to create separate types for each level you have. As long as the data matches the hierarchy you’ve asked for, Codable is capable of decoding everything with no further work from us

struct HierarchicalCodableData: View {
    
    @State var userData: User
    
    var body: some View {
        Button("Decode JSON") {
            //JSON input:
            let input = """
            {
                "name": "Bruno Oliveira",
                "address": {
                    "street": "555, Av Imbiara",
                    "city": "Nashville"
                }
            }
            """
            
            //Decoding information from JSON input to the Data type (which is what Codable works with), thhen decdoe that into a User instance:
            
            let data = Data(input.utf8)
            let decoder = JSONDecoder()
            
            if let user = try? decoder.decode(User.self, from: data) {
                print(user.address.street)
                userData.address.street = user.address.street
                print(user.name)
                userData.name = user.name
                print(user.address.city)
                userData.address.city = user.address.city
            }
            
        //As you can see, There’s no limit to the number of levels Codable will go through – all that matters is that the structs you define match your JSON string
            
        }
        
        .padding()
        
        VStack (spacing: 20){
            Text(userData.name)
            Text(userData.address.street)
            Text(userData.address.city)
        }
        
    }
}

#Preview {
    HierarchicalCodableData(userData: User(name: "", address: Address(street: "", city: "")))
}
