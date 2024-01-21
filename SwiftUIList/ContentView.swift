//
//  ContentView.swift
//  SwiftUIList
//
//  Created by Angelos Staboulis on 22/1/24.
//

import SwiftUI

struct ContentView: View {
    @State var menu = [1,2,3,4,5,6,7,8,9,10]
    var body: some View {
        NavigationStack{
            List(menu,id:\.self){item in
                Text(String(describing:item)).swipeActions {
                    Button {
                        removeItem(item: item)
                    } label: {
                        Text("Delete")
                    }
                    
                }
            }.navigationTitle("SwiftUIList")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem {
                        Button {
                            if menu.count > 0 {
                                menu.removeAll()
                                for item in 0..<10{
                                    menu.append(item+1)
                                }
                            }else{
                                for item in 0..<10{
                                    menu.append(item+1)
                                }
                            }
                            
                        } label: {
                            Text("Reload List")
                        }
                    }
                    
                }
        }
        
    }
    func removeItem(item:Int){
        for value in 0..<menu.count{
            if menu[value] == item{
                menu.remove(at: value)
                break
            }
        }
    }
}

#Preview {
    ContentView()
}
