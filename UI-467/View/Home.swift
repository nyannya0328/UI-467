//
//  Home.swift
//  UI-467
//
//  Created by nyannyan0328 on 2022/02/16.
//

import SwiftUI

struct Home: View {
    
    @State var currenpuzzle : Puzzle = puzzles[0]
    @State var selectedLetter : [Letter] = []
    var body: some View {
        VStack{
            
            
            VStack{
                
                
                HStack{
                    
                    
                    Button {
                        
                        selectedLetter.removeAll()
                        currenpuzzle = puzzles[0]
                        geneRateletters()
                        
                    } label: {
                        
                        Image(systemName:"arrowtriangle.left.square.fill")
                            .font(.title)
                            .foregroundColor(.black)
                            
                    }
                    .lLeading()
                    
                    Button {
                        
                    } label: {
                        
                        Image(systemName:"speaker.wave.2.fill")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding(10)
                            .background(Color("Blue"),in: Circle())
                            
                    }

                }
                .overlay {
                    
                    
                    Text("Lebel 1")
                        .font(.title.weight(.semibold))
                        .kerning(1.5)
                }
                
                
                Image(currenpuzzle.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 250)
                    .clipShape(RoundedRectangle(cornerRadius: currenpuzzle.imageName == "p1" ? 100 : 0))
                    .padding(.vertical)
                    
                
                HStack(spacing:10){
                    
                    
                    ForEach(0..<currenpuzzle.answer.count,id:\.self){index in
                        
                        ZStack{
                            
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color("Blue").opacity(selectedLetter.count > index ? 1 : 0.2))
                                .frame(height:75)
                            
                            
                            if selectedLetter.count > index{
                                
                                
                                Text(selectedLetter[index].value)
                                    .font(.title.weight(.bold))
                                    .foregroundColor(.white)
                            }
                            
                        }
                        
                        
                    }
                }
                
                
                    
                
                
                
                
                
                
            }
            .padding()
            .background(.white,in: RoundedRectangle(cornerRadius: 10))
            
            
            
            HoneyComboGridView(items: currenpuzzle.letters) { item in
                
                ZStack{
                    
                    HexgonView()
                        .fill(isSeleted(letter: item) ? Color("Gold") : .white)
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color("Gold"))
                        .shadow(color: .green.opacity(0.1), radius: 5, x: 5, y: 5)
                        .shadow(color: .blue.opacity(0.1), radius: 5, x: -15, y: -3)
                    
                    
                    Text(item.value)
                        .font(.largeTitle.weight(.black))
                }
                .contentShape(HexgonView())
                .onTapGesture {
                    
                    
                    addLetter(letter: item)
                }
                
            }
            
            
            
            Button {
                
                selectedLetter.removeAll()
                currenpuzzle = puzzles[1]
                geneRateletters()
                
                
            } label: {
                
                Text("NEXT")
                    .font(.largeTitle.weight(.bold))
                    .foregroundColor(.white)
                    .lCenter()
                    .padding(.vertical,10)
                    .padding(.horizontal,20)
                    .background(Color("Gold"),in: RoundedRectangle(cornerRadius: 10))
                
                
            }
            .disabled(selectedLetter.count != currenpuzzle.answer.count)
            .opacity(selectedLetter.count != currenpuzzle.answer.count ? 0.6 : 1)
            
            
            

            
            
            
        }
        .padding()
        .frame(maxWidth:.infinity,maxHeight: .infinity,alignment: .top)
        .background(Color("BG"))
        .onAppear {
            
            geneRateletters()
            
            
        }
    }
    
    
    func addLetter(letter : Letter){
        
        
        withAnimation{
            
            if isSeleted(letter: letter){
                
                selectedLetter.removeAll { currentLetter in
                    
                    
                    return currentLetter.id == letter.id
                }
                
                
                
            }
            
            else{
                
                
                if selectedLetter.count == currenpuzzle.answer.count{return}
                
                
                selectedLetter.append(letter)
            }
            
       
            
        }
        
        
    }
    
    func isSeleted(letter : Letter) -> Bool{
        
        
        return selectedLetter.contains { currentLetter in
            
            
            currentLetter.id == letter.id
        }
        
    
        
        
    }
    
    func geneRateletters(){
        
        
        currenpuzzle.jumbbledWord.forEach { character in
            
            currenpuzzle.letters.append(Letter(value: String(character)))
        }
        
        
        
    }
    
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
