//
//  HoneyComboGridView.swift
//  UI-467
//
//  Created by nyannyan0328 on 2022/02/16.
//

import SwiftUI

struct HoneyComboGridView<Content : View,Item>: View where Item : RandomAccessCollection  {
    
    var content : (Item.Element) -> Content
    var items : Item
    
    init(items : Item,@ViewBuilder content : @escaping(Item.Element) -> Content) {
        self.content = content
        self.items = items
    }
    
    @State var width : CGFloat = 0
    var body: some View {
        VStack(spacing:-20){
            
            
            ForEach(setUpHoneyComboGrid().indices,id:\.self){index in
                
                HStack(spacing:5){
                    
                    
                    ForEach(setUpHoneyComboGrid()[index].indices,id:\.self){subindex in
                        
                        
                        
                        content(setUpHoneyComboGrid()[index][subindex])
                            .frame(width: (width / 4))
                            
                        
                        
                        
                    }
                    
                    
                    
                }
            }
            
        }
        .maxHW()
        .coordinateSpace(name: "HEXAGON")
        .overlay {
            
            GeometryReader{proxy in
                
                
               Color.clear
                    .preference(key:(WidthKey.self), value: proxy.frame(in: .named("HEXAGON")).width - proxy.frame(in: .named("HEXAGON")).minX)
                    .onPreferenceChange((WidthKey.self)) { widht in
                        self.width = widht
                    }
                
            }
            
        }
    }
    
    func setUpHoneyComboGrid()->[[Item.Element]]{
        
        
        var rows : [[Item.Element]] = []
        
        var itemsAtRow : [Item.Element] = []
        
        var count : Int = 0
        
        
        items.forEach { item in
            
            itemsAtRow.append(item)
            count += 1
            
            
            if itemsAtRow.count >= 3{
                
                if rows.isEmpty && itemsAtRow.count == 4{
                    
                    
                    rows.append(itemsAtRow)
                    itemsAtRow.removeAll()
                }
                
                else if let last = rows.last,last.count == 4 && itemsAtRow.count == 3{
                    rows.append(itemsAtRow)
                    itemsAtRow.removeAll()
                    
                    
                }
                else if let last = rows.last,last.count == 3 && itemsAtRow.count == 4{
                    rows.append(itemsAtRow)
                    itemsAtRow.removeAll()
                    
                    
                }
                
                
            }
            
            
            if count == items.count{
                
                if let last = rows.last{
                    
                    
                    if rows.count >= 2{
                        
                        
                        let previous = (rows[rows.count - 2].count == 4 ? 3 : 4)
                        
                        
                        
                        if (last.count + itemsAtRow.count) <= previous{
                            
                            rows[rows.count - 1].append(contentsOf: itemsAtRow)
                            itemsAtRow.removeAll()
                            
                            
                        }
                        
                        else{
                            
                            rows.append(itemsAtRow)
                            itemsAtRow.removeAll()
                            
                            
                            
                        }
                        
                        
                    }
                    
                    else{
                        
                        
                        if (last.count + itemsAtRow.count) <= 4{
                            
                            
                            
                            rows[rows.count - 1].append(contentsOf: itemsAtRow)
                            itemsAtRow.removeAll()
                            
                            
                        }
                        else{
                            rows.append(itemsAtRow)
                            itemsAtRow.removeAll()
                            
                        }
                        
                        
                        
                    }
                    
                }
                else{
                    
                    
                    rows.append(itemsAtRow)
                    itemsAtRow.removeAll()
                }
                
                
            }
            
            
        }
        
        
        return rows
        
        
        
        
        
        
    }
    
    
}

struct HoneyComboGridView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct WidthKey : PreferenceKey{
    
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        
             value = nextValue()
    }
}
