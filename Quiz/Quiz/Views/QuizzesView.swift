//
//  ContentView.swift
//  Quiz
//
//  Created by b017 DIT UPM on 23/11/22.
//

import SwiftUI

struct QuizzesView: View {
    
    @EnvironmentObject var quizzesModel: QuizzesModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(quizzesModel.quizzes) { quizItem in
                    NavigationLink{
                        QuizPlayView(quizItem: quizItem)
                    }label: {
                        QuizRow(quizItem: quizItem)
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Quizzes")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                quizzesModel.load()
            }
        }
    }
}
        

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        QuizzesView()
    }
}
