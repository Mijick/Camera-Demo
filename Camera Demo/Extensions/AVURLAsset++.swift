//
//  AVURLAsset++.swift of Camera Demo
//
//  Created by Tomasz Kurylik. Sending ❤️ from Kraków!
//    - Mail: tomasz.kurylik@mijick.com
//    - GitHub: https://github.com/FulcrumOne
//    - Medium: https://medium.com/@mijick
//
//  Copyright ©2024 Mijick. All rights reserved.


import AVKit

// MARK: Video Details
extension AVURLAsset {
    func getVideoDetails() async throws -> (duration: Duration, thumbnail: UIImage)? {
        let duration = try await getVideoDuration()
        let videoThumbnail = try await getVideoThumbnail()

        return (duration, videoThumbnail)
    }
}
private extension AVURLAsset {
    func getVideoDuration() async throws -> Duration {
        let duration = try await load(.duration)
        return .init(secondsComponent: Int64(duration.seconds), attosecondsComponent: 0)
    }
    func getVideoThumbnail() async throws -> UIImage {
        let assetImageGenerator = AVAssetImageGenerator(asset: self)
        assetImageGenerator.appliesPreferredTrackTransform = true
        assetImageGenerator.apertureMode = AVAssetImageGenerator.ApertureMode.encodedPixels

        let cmTime = CMTime(seconds: 0, preferredTimescale: 60)
        let cgImage = try await assetImageGenerator.image(at: cmTime).image
        let thumbnailImage = UIImage(cgImage: cgImage)
        return thumbnailImage
    }
}
