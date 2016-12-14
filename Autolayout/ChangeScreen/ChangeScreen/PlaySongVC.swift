//
//  PlaySongVC.swift
//  ChangeScreen
//
//  Created by Thanh on 12/1/16.
//  Copyright © 2016 Thanh. All rights reserved.
//

import UIKit

class PlaySongVC: UIViewController {

    @IBOutlet weak var comeBackLoginBtn: UIButton!
    @IBOutlet weak var songTitleLbl: UILabel!
    private var _selectedSong: String!
    var selectedSong: String {
        get {
            return _selectedSong
        } set {
            _selectedSong = newValue
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        songTitleLbl.text = _selectedSong
    }

    @IBAction func actionComeBackLogin(_ sender: Any) {
        performSegue(withIdentifier: "LoginVC", sender: _selectedSong)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? LoginVC {
            if let song = sender as? String {
                destination.songTitle = song
            }
        }
    }
}
