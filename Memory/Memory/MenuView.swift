//
//  MenuView.swift
//  Memory
//
//  Created by Sinead on 06.10.22.
//

import SwiftUI

struct MenuContentView: View {
    @State private var showingSheet = true
    @State var model : EmojiMemoryViewModel


    var body: some View {
        Button("New Game") {
            showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet) {
            MenuView(emojiViewModel: model)
        }
    }
}

struct MenuView: View {
    @Environment(\.dismiss) var dismiss

           var emojiViewModel: EmojiMemoryViewModel
           var factory = MemoryFactory()
           var screenWidth = UIScreen.main.bounds.width
    @State var levelSelection : levels = .easy
         
    
    var body: some View {
        ScrollView{
            VStack(spacing: 10){
                Title(title: "Memory Game")
                SubTitle(title: "1. Choose your level")
                Picker("", selection: $levelSelection) {
                    ForEach(levels.allCases, id: \.self) { option in
                        Text(option.rawValue)
                    }
                }.pickerStyle(SegmentedPickerStyle())
                    .padding()
                
                SubTitle(title: "2. Choose your favorite memory deck")
                Button (action: {
                    withAnimation(.easeInOut){
                        emojiViewModel.chooseEmoji(level: levelSelection.rawValue, screenWidth: screenWidth)
                        dismiss()
                    }
                }, label: {ContentText(title: "Emoji")})
                .buttonStyle(MemoryButton())
                
                Button (action: {
                    withAnimation(.easeInOut){
                        emojiViewModel.chooseAnimals(level: levelSelection.rawValue, screenWidth: screenWidth)
                        dismiss()
                    }
                }, label: {ContentText(title: "Animals")})
                .buttonStyle(MemoryButton())
                
                Button (action: {
                    withAnimation(.easeInOut){
                        emojiViewModel.chooseFood(level: levelSelection.rawValue, screenWidth: screenWidth)
                        dismiss()
                    }
                }, label: {ContentText(title: "Food")})
                .buttonStyle(MemoryButton())
                
                Button (
                    action: {
                        withAnimation(.easeInOut){
                            //                    shapeModel.chooseForms(level: levelSelection.rawValue, screenWidth: screenWidth)
                            //                    dismiss()
                        }
                    }, label: {ContentText(title: "Forms")})
                .buttonStyle(MemoryButton()).disabled(true)
                
                
                
                Button("Close") {
                    dismiss()
                }
                .font(.headline)
                .foregroundColor(.white)
                .padding(10)
                
                .background(.black)
                .cornerRadius(10)
                
            }
        }
    }
}




struct SubTitle: View {
  let title: String

  var body: some View {
    Text(title)
    .font(.headline)
    .fontWeight(.medium)
    .padding()
    .frame(maxWidth: .infinity, alignment: .leading)
  }
}

struct Title: View {
  let title: String

  var body: some View {
    Text(title)
      .font(.title)
      .fontWeight(.bold)
      .padding()
      .multilineTextAlignment(.center)
  }
}

struct ContentText: View {
  let title: String

  var body: some View {
    Text(title)
          .font(.system(.callout, design: .rounded))
      .fontWeight(.bold)
      .padding()
      .multilineTextAlignment(.leading)
  }
}

struct MemoryButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(5)
            .background(.mint)
            .foregroundColor(.white)
            .cornerRadius(5)
            .frame(maxWidth: .infinity)
    }
}
