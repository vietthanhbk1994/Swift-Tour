//
//  MusicListVC.swift
//  ChangeScreen
//
//  Created by Thanh on 12/1/16.
//  Copyright © 2016 Thanh. All rights reserved.
//

import UIKit

class MusicListVC: UIViewController {
    @IBAction func actionReturn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        view.backgroundColor = UIColor.blue
    }
    @IBAction func load3rdScreenPressed(_ sender: Any) {
        let songTitle = "Quit Play Gmae With My Heart"
        performSegue(withIdentifier: "PlaySongVC", sender: songTitle)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? PlaySongVC {
            if let song = sender as? String {
                destination.selectedSong = song
            }
        }
    }
}
