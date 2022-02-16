//
//  HexgonView.swift
//  UI-467
//
//  Created by nyannyan0328 on 2022/02/16.
//

import SwiftUI

struct HexgonView: Shape {
    var raidus : CGFloat = 15
    func path(in rect: CGRect) -> Path {
        return Path{path in
            
            
            let pt1 = CGPoint(x: 0, y: 20)
            let pt2 = CGPoint(x: 0, y: rect.height - 20)
            let pt3 = CGPoint(x: rect.width / 2, y: rect.height)
            let pt4 = CGPoint(x: rect.width, y: rect.height - 20)
            let pt5 = CGPoint(x: rect.width, y: 20)
            let pt6 = CGPoint(x: rect.width / 2, y: 0)
            
            path.move(to: pt6)
            
            
            path.addArc(tangent1End: pt1, tangent2End: pt2, radius: raidus)
            path.addArc(tangent1End: pt2, tangent2End: pt3, radius: raidus)
            path.addArc(tangent1End: pt3, tangent2End: pt4, radius: raidus)
            path.addArc(tangent1End: pt4, tangent2End: pt5, radius: raidus)
            path.addArc(tangent1End: pt5, tangent2End: pt6, radius: raidus)
            path.addArc(tangent1End: pt6, tangent2End: pt1, radius: raidus)
            
        }
    }
}

struct HexgonView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
