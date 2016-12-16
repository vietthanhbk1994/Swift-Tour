//
//  PokemonDetailVC.swift
//  pokedex3
//
//  Created by Thanh on 12/15/16.
//  Copyright © 2016 Thanh. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var pokedexId: UILabel!
    @IBOutlet weak var baseAttackLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var evolutionLbl: UILabel!
    @IBOutlet weak var currentEvolutionImg: UIImageView!
    @IBOutlet weak var nextEvolutionImg: UIImageView!
    
    
    private var _pokemon: Pokemon!
    
    var pokemon: Pokemon! {
        get {
            return _pokemon
        }
        set {
            _pokemon = newValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pokemon.downloadPokemonDetail {
            //Whatever we write will only be called after the network call is complete
            self.updateUI()
        }
    }
    
    func updateUI() {
        nameLbl.text = pokemon.name
        defenseLbl.text = pokemon.defense
        heightLbl.text = pokemon.height
        weightLbl.text = pokemon.weight
        pokedexId.text = "\(pokemon.pokedexId)"
        baseAttackLbl.text = pokemon.baseAttack
        typeLbl.text = pokemon.type
        descriptionLbl.text = pokemon.description
        evolutionLbl.text = pokemon.nextEvolution
        if pokemon.nextEvolutionId == "" {
            nextEvolutionImg.isHidden = true
        } else {
            nextEvolutionImg.isHidden = false
            nextEvolutionImg.image = UIImage(named: pokemon.nextEvolutionId)
        }
        
        let img = UIImage(named: "\(pokemon.pokedexId)")
        mainImg.image = img
        currentEvolutionImg.image = img
        
    }

    @IBAction func backBtnPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var musicBtnPressed: UIButton!
}
