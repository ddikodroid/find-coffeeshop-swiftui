//
//  CoffeshopListView.swift
//  FindCoffeshop
//
//  Created by Ahmad Syarifuddin Randiko on 18/11/22.
//

import SwiftUI

struct CoffeshopListView: View {
    
    //MARK: - Properties
    @State private var query: String = ""
    
    private var coffeeshopSearchResult : [CoffeeshopModel] {
        let allCoffeshops = CoffeeshopProvider.all()
        if query.isEmpty{
            return allCoffeshops
        }else{
            return allCoffeshops.filter{ cs in
                cs.name.lowercased().contains(query.lowercased())
            }
        }
    }
    
    private var suggestions: [CoffeeshopModel]{
        if query.isEmpty{
            return []
        } else {
            return coffeeshopSearchResult
        }
    }
    
    //MARK: - Body
    var body: some View {
        NavigationStack{
            List(coffeeshopSearchResult) { result in
                NavigationLink(destination: CoffeeshopDetailView(coffeshop: result)){
                    HStack{
                        Image(result.image)
                            .resizable().scaledToFill()
                            .frame(width: 120, height: 120)
                            .cornerRadius(24)
                        
                        VStack(alignment: .leading, spacing: 0){
                            Text(result.name)
                                .font(.system(size: 24, design: .rounded))
                                .fontWeight(.bold)
                            
                            Text(result.location)
                                .font(.system(size: 18, design: .rounded))
                                .fontWeight(.medium)
                                .foregroundColor(.gray)
                                .padding(.top, 10)
                            
                            Text("Rating: 4/5")
                                .font(.system(size: 14))
                                .foregroundColor(.gray)
                                .padding(.top, 8)
                        }.padding(.leading, 8) //: VStack
                    } //: HStack
                }
                } //: List
                .navigationTitle("Coffeeshop")
                .searchable(text: $query, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search coffeeshop..."){
                    ForEach(suggestions) { suggestion in
                        Text("Looking for \(suggestion.name)?")
                            .searchCompletion(suggestion.name)
                    }
                }
                
        }
    }
}

//MARK: - Properties
struct CoffeshopListView_Previews: PreviewProvider {
    static var previews: some View {
        CoffeshopListView()
    }
}
