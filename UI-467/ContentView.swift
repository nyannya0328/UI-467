//
//  ContentView.swift
//  UI-467
//
//  Created by nyannyan0328 on 2022/02/16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View{
    
    func getRect()->CGRect{
        
        
        return UIScreen.main.bounds
    }
    
    func lLeading()->some View{
        
        self
            .frame(maxWidth:.infinity,alignment: .leading)
    }
    func lTreading()->some View{
        
        self
            .frame(maxWidth:.infinity,alignment: .trailing)
    }
    func lCenter()->some View{
        
        self
            .frame(maxWidth:.infinity,alignment: .center)
    }
    
    func maxHW()->some View{
        
        self
            .frame(maxWidth:.infinity,maxHeight: .infinity)
        
    
    }
    
    func maxHWTop()->some View{
        
        self
            .frame(maxWidth:.infinity,maxHeight: .infinity,alignment: .top)
        
    }
}
