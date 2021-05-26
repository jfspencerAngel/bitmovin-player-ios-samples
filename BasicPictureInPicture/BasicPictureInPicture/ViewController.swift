//
// Bitmovin Player iOS SDK
// Copyright (C) 2021, Bitmovin Inc, All Rights Reserved
//
// This source code and its use and distribution, is subject to the terms
// and conditions of the applicable license agreement.
//

import UIKit
import BitmovinPlayer

class ViewController: UIViewController {
    let streamUrl = URL(string: "https://bitmovin-a.akamaihd.net/content/MI201109210084_1/m3u8s/f08e80da-bf1d-4e3d-8899-f0f6155f6efa.m3u8")!
    let posterUrl = URL(string: "https://bitmovin-a.akamaihd.net/content/MI201109210084_1/poster.jpg")!
    
    var userInterfaceType: UserInterfaceType = .bitmovin
    
    var player: Player!
    var playerView: PlayerView!
    
    deinit {
        player?.destroy()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .black
        
        let config = createPlayerConfig()
        let player = PlayerFactory.create(playerConfig: config)
        let playerView = createPlayerView(player: player)
        let sourceConfig = createSourceConfig(
            url: streamUrl,
            posterUrl: posterUrl,
            type: .hls
        )
        let source = SourceFactory.create(from: sourceConfig)
        
        player.add(listener: self)
        // If you want to be notified about PiP state
        // you should add yourself as a listener and conform to
        // the 'UserInterfaceListener' protocol
        playerView.add(listener: self)
        
        self.player = player
        self.playerView = playerView
        
        view.addSubview(self.playerView)
        
        configureAudioSession()
        
        self.player.load(source: source)
    }
    
    private func configureAudioSession() {
        // You need to set a category for audio session to '.playback'
        // to be able to use PiP functionality, otherwise PiP won't work
        let audioSession = AVAudioSession.sharedInstance()
        try? audioSession.setCategory(.playback)
    }
    
    private func createPlayerConfig() -> PlayerConfig {
        let config = PlayerConfig()
        // The 'isPictureInPictureEnabled' property of 'PlaybackConfig' is responsible
        // for enabling the PiP functionality
        config.playbackConfig.isBackgroundPlaybackEnabled = true
        config.playbackConfig.isPictureInPictureEnabled = true
        config.styleConfig.userInterfaceType = userInterfaceType
        
        return config
    }
    
    private func createPlayerView(player: Player) -> PlayerView {
        let playerView = PlayerView(player: player, frame: .zero)
        playerView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        playerView.frame = view.bounds
        
        return playerView
    }
    
    private func createSourceConfig(
        url: URL,
        posterUrl: URL,
        type: SourceType
    ) -> SourceConfig {
        let sourceConfig = SourceConfig(url: streamUrl, type: .hls)
        sourceConfig.posterSource = posterUrl
        return sourceConfig
    }
}

extension ViewController: PlayerListener {
    func onEvent(_ event: Event, player: Player) {
        dump(event, name: "[Player Event]", maxDepth: 1)
    }
}

extension ViewController: UserInterfaceListener {
    func onPictureInPictureEnter(_ event: PictureInPictureEnterEvent, view: PlayerView) {
        print("onPictureInPictureEnter")
    }
    
    func onPictureInPictureEntered(_ event: PictureInPictureEnteredEvent, view: PlayerView) {
        print("onPictureInPictureEntered")
    }
    
    func onPictureInPictureExit(_ event: PictureInPictureExitEvent, view: PlayerView) {
        print("onPictureInPictureExit")
    }
    
    func onPictureInPictureExited(_ event: PictureInPictureExitedEvent, view: PlayerView) {
        print("onPictureInPictureExited")
    }
}
