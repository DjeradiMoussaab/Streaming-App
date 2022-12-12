//
//  CardView.swift
//  Streaming App
//
//  Created by Moussaab Djeradi on 23/11/2022.
//

import SwiftUI

struct CardView: View {
    
    @State var video: Video
    
    var body: some View {
        ZStack {
            HStack {
                AsyncImage(url: video.thumbnail) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 200, height: 200)
                .cornerRadius(30)
                .overlay {
                    VStack {
                        HStack {
                            Image(systemName: video.isFavorite ?  "star.fill" : "star")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.orange)
                            Spacer()
                        }
                        .padding(20)
                        Spacer()
                    }
                    Image(systemName: "play.fill")
                        .resizable()
                        .frame(width: 40, height: 40, alignment: .center)
                        .opacity(0.5)
                }
                VStack {
                    Text(video.name)
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Spacer()
                    Text(video.description)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.gray)
                    Spacer()
                    Text(video.duration)                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(video.dateCreated)                        .frame(maxWidth: .infinity, alignment: .leading)
                    Spacer()
                }
            }.overlay(alignment: .bottomLeading) {

            }
            .frame(width: .infinity, height: 200, alignment: .center)
            .padding(5)
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(video: Video.DummyData[0])
            .previewLayout(.sizeThatFits)
    }
}
