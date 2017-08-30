//
//  ViewController.swift
//  Swift0830
//
//  Created by zxjk on 17/8/30.
//
//

import UIKit
import AVKit
import AVFoundation
import MediaPlayer

class ViewController: UIViewController {

    var playerView = AVPlayerViewController()
    var player = AVPlayer()
    
    var logButton = UIButton()
    var signButton = UIButton()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createPlayer()
        self.createView()
    }
    
    func createPlayer() {
        // target -> Build Phases -> Copy Bundle Resources 添加视频文件
        let url = NSURL.fileURL(withPath: Bundle.main.path(forResource: "moments", ofType: "mp4")!)
        playerView = AVPlayerViewController()
        
        playerView.view.frame = self.view.frame
        
        playerView.showsPlaybackControls = false
        
        playerView.player = AVPlayer(url: url)
        playerView.player?.play()
        playerView.player?.volume = 1.0
        self.view.addSubview(playerView.view)
        
        NotificationCenter.default.addObserver(self, selector: #selector(playerItemDidReachEnd), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
    }
    
    func playerItemDidReachEnd() {
        playerView.player?.seek(to: kCMTimeZero)
        playerView.player?.play()
    }
    
    func createView() {
        logButton = UIButton(type: .system)
        logButton.backgroundColor = .black
        logButton.setTitle("LOG IN", for: .normal)
        logButton.setTitleColor(.white, for: .normal)
        logButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        logButton.frame = CGRect(x: 0, y: self.view.frame.size.height-60, width: self.view.frame.size.width/2.0, height: 60)
        self.view.addSubview(logButton)
        
        signButton = UIButton(type: .system)
        signButton.backgroundColor = .green
        signButton.setTitle("SIGN UP", for: .normal)
        signButton.setTitleColor(.white, for: .normal)
        signButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        signButton.frame = CGRect(x: self.view.frame.size.width/2.0, y: self.view.frame.size.height-60, width: self.view.frame.size.width/2.0, height: 60)
        self.view.addSubview(signButton)
    }
    
    
    
    
    
    
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

