//
//  VideoPlayerView.swift
//  Streaming App
//
//  Created by Moussaab Djeradi on 20/11/2022.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    @EnvironmentObject private var viewModel: VideosListViewModel
    let video : Video
    @ObservedObject private var videoPlayerManager : VideoPlayerManager
    
    @State private var changeResolution = false

    init(video: Video) {
        self.video = video
        self.videoPlayerManager = VideoPlayerManager(video: video, resolution: .p360)
    }
    var body: some View {
        ZStack {
            Color.white
            .ignoresSafeArea()
            VStack {
                Text(video.name)
                    .padding(10)
                    .font(.subheadline)
                    .foregroundColor(.green)
                VideoPlayer(player: videoPlayerManager.player) {
                    VStack {
                        
                    }
                }
                .navigationTitle(video.name)
                .ignoresSafeArea()
                .frame(
                      minWidth: 0,
                      maxWidth: .infinity,
                      minHeight: 0,
                      maxHeight: 320.0,
                      alignment: .top
                    )
                .onDisappear {
                    videoPlayerManager.player.pause()
                }
                Spacer()
                Text(video.duration)
                    .padding(10)
                Text(video.dateCreated)
                    .padding(10)
                Text(video.description)
                    .padding(10)
                Button("Change resolution") {
                    withAnimation {
                        changeResolution.toggle()
                    }
                }
                .font(Font.body.bold())
                Spacer()
            }
            
            if changeResolution {
                VStack(spacing: 20) {
                    Spacer()
                    ForEach(Resolution.allCases) { resolution in
                        Button(resolution.stringValue, action: {
                            withAnimation {
                                videoPlayerManager.currentResolution = resolution
                                changeResolution.toggle()
                            }
                        })
                    }
                    
                    Button(action: {
                        withAnimation {
                            changeResolution.toggle()
                        }
                    }, label: {
                        Image(systemName: "xmark.circle")
                            .imageScale(.large)
                    })
                        .padding(.top)
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .background(.thinMaterial)
                .transition(.move(edge: .bottom))
            }
        }
    }
}

struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        let video = Video.DummyData[0]
        VideoPlayerView(video: video)
    }
}
