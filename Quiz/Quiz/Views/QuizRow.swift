//
//  QuizRow.swift
//  Quiz
//
//  Created by b017 DIT UPM on 23/11/22.
//

import SwiftUI

struct QuizRow: View {
    var quizItem: QuizItem
    
    var body: some View{
        
        HStack{
            MyAsyncImage(url: quizItem.attachment?.url)
                .scaledToFill()
                .frame(width: 80, height: 80)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.black, lineWidth: 3))
                .shadow(radius: 15)
            MyAsyncImage(url: quizItem.author?.photo?.url)
                .scaledToFill()
                .frame(width: 30, height: 30)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                .shadow(radius: 15)
            
        VStack {
            Text(quizItem.question)
                .fontWeight(.heavy)
            Text(quizItem.author?.username  ?? "Anónimo")
                .font(.callout)
        }
            Image(quizItem.favourite ? "star_yellow-2" : "star_grey-2")
        }
    }
}

/*struct QuizRow_Previews: PreviewProvider {
    static var previews: some View {
        QuizRow(quizItem: QuizItem)
    }
}*/
