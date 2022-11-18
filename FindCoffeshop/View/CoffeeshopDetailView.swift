//
//  CoffeeshopDetailView.swift
//  FindCoffeshop
//
//  Created by Ahmad Syarifuddin Randiko on 19/11/22.
//

import SwiftUI

struct CoffeeshopDetailView: View {
    let coffeshop: CoffeeshopModel
    
    var body: some View {
        ZStack{
            LinearGradient(colors: [.clear,.gray], startPoint: .topLeading, endPoint: .bottomTrailing)
                            .ignoresSafeArea()
            VStack(spacing: 0) {
                ZStack{
                    Image(coffeshop.image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 300, height: 300)
                        .clipShape(Circle())
                        .overlay{
                            ZStack{
                                Circle().opacity(0.75)
                                VStack{
                                    Image(systemName: "person.crop.circle.fill.badge.plus")
                                        .renderingMode(.original)
                                        .font(.system(size: 60))
                                        .foregroundColor(.blue)
                                    
                                    Text(coffeshop.name).foregroundColor(.white)
                                        .font(.system(.largeTitle, design: .rounded))
                                        .fontWeight(.bold)
                                }
                            }
                        }
                }
                Text(coffeshop.review)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.blue)
                    .font(.title2)
                    .padding(.vertical, 24)
                
                HStack{
                    Image(systemName: "pin")
                        .foregroundColor(.red)
                        .frame(width: 32, height: 32, alignment: .center)
                        .overlay{
                            Circle()
                                .opacity(0.1)
                                .foregroundColor(.pink)
                            
                        }
                    Text(coffeshop.location)
                        .font(.body)
                        .foregroundColor(.red)
                }
                Spacer()
            } //: VStack
            .padding()
            
        }
        
    }
}

struct CoffeeshopDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeshopDetailView(coffeshop: CoffeeshopModel(image: "brewery", name: "Lanevo Cafe", location: "Jl. Jawa No. 46, Kota Bandung", review: "Unity heritage and modern concept and live music performance every weekend"))
    }
}
