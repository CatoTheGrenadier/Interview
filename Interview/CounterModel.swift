//
//  CounterModel.swift
//  Interview
//
//  Created by Yi Ling on 10/1/24.
//

import Foundation

class CounterModel : ObservableObject, Identifiable{
    var id = UUID()
    @Published var counter = 0;
    @Published var shown = false;
    @Published var unToggled = true;
    @Published var storedValue = 0;
    @Published var firstShown = true;
    
    func startCounter(){
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true){ _ in
            if ( self.shown && self.unToggled ){
                self.counter += 1
            }
        }
    }
    
    func appearHandler(){
        shown = true
        counter = storedValue
    }
    
    func disappearHandler(){
        shown = false
        storedValue = counter
    }
    
    func toggle(){
        unToggled = false
        storedValue = counter
    }
    
    func unToggle(){
        unToggled = true
        counter = storedValue
    }
}
