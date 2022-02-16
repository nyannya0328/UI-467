//
//  Puzzle.swift
//  UI-467
//
//  Created by nyannyan0328 on 2022/02/16.
//

import SwiftUI

struct Puzzle: Identifiable {
    var id = UUID().uuidString
    var imageName : String
    var answer : String
    var jumbbledWord : String
    
    var letters : [Letter] = []
}

struct Letter : Identifiable{
    
    var id = UUID().uuidString
    var value : String
}

var puzzles : [Puzzle] = [

Puzzle(imageName: "Crown", answer: "Crown", jumbbledWord: "CUROROWKk"),
Puzzle(imageName: "p1", answer: "RokiSasaki", jumbbledWord: "REIWAMONSTER")


]

