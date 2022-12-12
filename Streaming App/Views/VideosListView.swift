//
//  VideosListView.swift
//  Streaming App
//
//  Created by Moussaab Djeradi on 21/11/2022.
//

import SwiftUI
import Combine

var subscription = Set<AnyCancellable>()

struct VideosListView: View {
    @State private var subscription = Set<AnyCancellable>()

    @StateObject private var viewModel = VideosListViewModel(resolution: .p360)

    
    var body: some View {
        Group {
            switch viewModel.currentState.value {
            case .loading:
                Text("loading...")
            case .success:
                self.showList()
            case .failure:
                Text("failure")
            }
        }.onAppear(perform: viewModel.fetchVideos)
    }
    
    func showList() -> some View {
        
        NavigationView {
            /*List(viewModel.videos) { video in
                NavigationLink(destination: VideoPlayerView(video: video)) {
                    CardView(video: video)
                }
            }
            .navigationTitle("This is where we tell stories")
            .listStyle(.grouped)
            .foregroundColor(.clear)
            */
            
            List {
                ForEach(viewModel.videos) { video in
                    HStack(spacing: 0) {
                        NavigationLink(destination: VideoPlayerView(video: video)) {
                        }
                        .frame(width: 0)
                        .opacity(0)
                        CardView(video: video)
                    }
                }
            }
            .navigationTitle("This is where you us what you do")
            .listStyle(.plain)
        }
    }
}

struct VideosListView_Previews: PreviewProvider {
    static var previews: some View {
        VideosListView()
    }
}
