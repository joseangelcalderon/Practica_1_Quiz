//
//  QuizPlayView.swift
//  Quiz
//
//  Created by b017 DIT UPM on 24/11/22.
//

import SwiftUI

struct QuizPlayView: View {
    var quizItem: QuizItem
    @State var answer: String = ""
    @EnvironmentObject var scoresModel: ScoresModel
    @State var showAlert = false
    @Environment(\.horizontalSizeClass) var hsc
    
    var body: some View{
        VStack{
            if hsc == .compact {
                VStack {
                    titulo
                    respuesta
                    HStack{
                        attachment
                    }
                    footer
                }
            } else{
                HStack{
                    titulo
                    respuesta
                    attachment
                    footer
                }
                
            }
        }
        .navigationTitle("A jugar")
      
    }
    
    private var titulo: some View{
        HStack{
            Text(quizItem.question)
                .fontWeight(.heavy)
                .font(.largeTitle)
            Image(quizItem.favourite ? "star_yellow-2" : "star_grey-2")
        }
    }
    
    private var respuesta: some View {
        VStack{
            TextField("Introduzca su respuesta", text: $answer)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
            
            Button("Comprobar"){
                scoresModel.add(answer: answer, quizItem: quizItem)
                showAlert=true
            }
        }
        .alert(isPresented: $showAlert){
            Alert(title: Text("Resultado"),
                  message: Text(answer.lowercased().trimmingCharacters(in: .whitespacesAndNewlines) == quizItem.answer.lowercased().trimmingCharacters(in: .whitespacesAndNewlines) ? "Bien" : "Mal"),
                  dismissButton: .default(Text("OK"))
            )
        }
    }
    
    private var attachment: some View{
        GeometryReader {geom in
            MyAsyncImage(url: quizItem.attachment?.url)
                .scaledToFill()
                .frame(width: geom.size.width, height: geom.size.height)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black, lineWidth: 3))
                .shadow(radius: 15)
        }
        .padding()
    }
    
    private var footer: some View {
        HStack{
            
            Text("Puntos= \(scoresModel.acertadas.count)")
                .foregroundColor(.green)
            Text(quizItem.author?.username  ?? "Anónimo")
                .font(.callout)
            MyAsyncImage(url: quizItem.author?.photo?.url)
                .scaledToFill()
                .frame(width: 30, height: 30)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                .shadow(radius: 15)
        }
    }
}

//struct QuizPlayView_Previews: PreviewProvider {
//    static var previews: some View {
//        QuizPlayView()
//    }
//}
