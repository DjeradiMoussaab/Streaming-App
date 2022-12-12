//
//  VideoPlayerViewModel.swift
//  Streaming App
//
//  Created by Moussaab Djeradi on 20/11/2022.
//

import Foundation
import Combine
import AVKit

class VideoPlayerManager: ObservableObject {
    
    @Published var currentResolution: Resolution
    @Published private var shouldLowerResolution = false
    
    let player = AVPlayer()
    var video: Video
    private var subscriptions: Set<AnyCancellable> = []



    init(video: Video, resolution: Resolution) {
        self.video = video
        self.currentResolution = resolution
        
        $shouldLowerResolution
            .dropFirst()
            .filter({ $0 == true })
            .sink(receiveValue: { [weak self] _ in
                guard let self = self else { return }
                self.lowerResolutionIfPossible()
            })
            .store(in: &subscriptions)
        
        $currentResolution
            .sink(receiveValue: { [weak self] resolution in
                guard let self = self else { return }
                self.replaceStream(with: resolution)
            })
            .store(in: &subscriptions)
    }
    
    func replaceStream(with newResolution: Resolution) {
        guard let currentStream = self.video.streams.first(where: { $0.resolution == currentResolution }) else { return }
        let currentTime: CMTime
        if let currentItem = self.player.currentItem {
            currentTime = currentItem.currentTime()
        } else {
            currentTime = .zero
        }
        
        player.replaceCurrentItem(with: AVPlayerItem(url: currentStream.streamURL))
        player.seek(to: currentTime, toleranceBefore: .zero, toleranceAfter: .zero)
    }
    
    func lowerResolutionIfPossible() {
        guard let newResolution = Resolution(rawValue: currentResolution.rawValue - 1) else { return }
        self.currentResolution = newResolution
    }

}
