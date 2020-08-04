//
//  SquadPlayer.swift
//  ManchesterUnitedSquad
//
//  Created by clicklabs on 24/06/20.
//  Copyright © 2020 clicklabs. All rights reserved.
//

import UIKit

class SquadPlayer {
    var playerName: String
    var photoImage: UIImage?
    
    init?(name: String, photo: UIImage?) {
        guard !name.isEmpty else {
            return nil
        }
        self.playerName = name
        self.photoImage = photo
    }
}
