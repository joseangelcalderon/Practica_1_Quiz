//
//  MyAsyncImage.swift
//  Quiz
//
//  Created by b017 DIT UPM on 23/11/22.
//

import SwiftUI

struct MyAsyncImage: View {
    
    var url: URL?
    
    var body: some View {
        AsyncImage(url: url){ phase in
            if url == nil{
                Image("imagen_error_2")
                    .scaledToFill()
            }else if let image = phase.image{
                image.resizable() //Devuelve imagen descargada
            } else if phase.error != nil {
                Color.red //Lo que devuelve en caso de error
            } else {
                ProgressView() //Placeholder durante la descarga
            }
        }
    }
}

struct MyAsyncImage_Previews: PreviewProvider {
    static var previews: some View {
        MyAsyncImage()
    }
}
