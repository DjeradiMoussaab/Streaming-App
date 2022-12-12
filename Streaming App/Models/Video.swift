//
//  Video.swift
//  Streaming App
//
//  Created by Moussaab Djeradi on 20/11/2022.
//

import Foundation

struct Video : Identifiable {
    let id: Int
    let name: String
    let description: String
    var isFavorite: Bool
    let streams: [Stream]
    let duration: String
    let dateCreated: String
    let thumbnail: URL
}


// MARK: - Creating DUMMY Data for Videos

extension Video {
    static var DummyData : [Video] {
        [
            Video(
                id: 01,
                name: "Nature Video Clip With Music",
                description: "a Little description of the nature video clips with music a Little description of the nature video clips with music a Little description of the nature video clips with music",
                isFavorite: false,
                streams: [
                    Stream(resolution: .p360, streamURL: URL(string: "https://d142uv38695ylm.cloudfront.net/videos/promo/allesneu.land-promo-trailer-360p.m3u8")!),
                    Stream(resolution: .p360, streamURL: URL(string: "https://d142uv38695ylm.cloudfront.net/videos/promo/allesneu.land-promo-trailer-720p.m3u8")!),
                    Stream(resolution: .p360, streamURL: URL(string: "https://d142uv38695ylm.cloudfront.net/videos/promo/allesneu.land-promo-trailer-1080p.m3u8")!),
                ],
                duration: "12m28",
                dateCreated: "23 Dec 2022",
                thumbnail: URL(string: "https://news.climate.columbia.edu/wp-content/uploads/2021/04/mark-koch-KiRlN3jjVNU-unsplash-637x425.jpeg")!
            ),
            Video(
                id: 01,
                name: "Nature Video Clip With Music",
                description: "a Little description of the nature video clips with music",
                isFavorite: false,
                streams: [
                    Stream(resolution: .p360, streamURL: URL(string: "https://d142uv38695ylm.cloudfront.net/videos/promo/allesneu.land-promo-trailer-360p.m3u8")!),
                    Stream(resolution: .p360, streamURL: URL(string: "https://d142uv38695ylm.cloudfront.net/videos/promo/allesneu.land-promo-trailer-720p.m3u8")!),
                    Stream(resolution: .p360, streamURL: URL(string: "https://d142uv38695ylm.cloudfront.net/videos/promo/allesneu.land-promo-trailer-1080p.m3u8")!),
                ],
                duration: "12m28",
                dateCreated: "23 Dec 2022",
                thumbnail: URL(string: "https://news.climate.columbia.edu/wp-content/uploads/2021/04/mark-koch-KiRlN3jjVNU-unsplash-637x425.jpeg")!
            ),
            Video(
                id: 01,
                name: "Nature Video Clip With Music",
                description: "a Little description of the nature video clips with music",
                isFavorite: false,
                streams: [
                    Stream(resolution: .p360, streamURL: URL(string: "https://d142uv38695ylm.cloudfront.net/videos/promo/allesneu.land-promo-trailer-360p.m3u8")!),
                    Stream(resolution: .p360, streamURL: URL(string: "https://d142uv38695ylm.cloudfront.net/videos/promo/allesneu.land-promo-trailer-720p.m3u8")!),
                    Stream(resolution: .p360, streamURL: URL(string: "https://d142uv38695ylm.cloudfront.net/videos/promo/allesneu.land-promo-trailer-1080p.m3u8")!),
                ],
                duration: "12m28",
                dateCreated: "23 Dec 2022",
                thumbnail: URL(string: "https://news.climate.columbia.edu/wp-content/uploads/2021/04/mark-koch-KiRlN3jjVNU-unsplash-637x425.jpeg")!
            ),
            Video(
                id: 01,
                name: "Nature Video Clip With Music",
                description: "a Little description of the nature video clips with music",
                isFavorite: false,
                streams: [
                    Stream(resolution: .p360, streamURL: URL(string: "https://d142uv38695ylm.cloudfront.net/videos/promo/allesneu.land-promo-trailer-360p.m3u8")!),
                    Stream(resolution: .p360, streamURL: URL(string: "https://d142uv38695ylm.cloudfront.net/videos/promo/allesneu.land-promo-trailer-720p.m3u8")!),
                    Stream(resolution: .p360, streamURL: URL(string: "https://d142uv38695ylm.cloudfront.net/videos/promo/allesneu.land-promo-trailer-1080p.m3u8")!),
                ],
                duration: "12m28",
                dateCreated: "23 Dec 2022",
                thumbnail: URL(string: "https://news.climate.columbia.edu/wp-content/uploads/2021/04/mark-koch-KiRlN3jjVNU-unsplash-637x425.jpeg")!
            )
        ]
    }
}
