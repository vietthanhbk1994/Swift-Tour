//
//  Pokemon.swift
//  pokedex3
//
//  Created by Thanh on 12/15/16.
//  Copyright © 2016 Thanh. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon {
    private var _name: String!
    private var _pokedexId: Int!
    private var _description: String!
    private var _type: String!
    private var _defense: String!
    private var _height: String!
    private var _weight: String!
    private var _baseAttack: String!
    private var _nextEvolution: String!
    private var _nextEvolutionLevel: String!
    private var _nextEvolutionName: String!
    private var _nextEvolutionId: String!
    private var _pokemonURL: String!
    
    var name: String {
        return (_name == nil) ? "" : _name
    }
    var pokedexId: Int {
        return (_pokedexId == nil) ? 0 : _pokedexId
    }
    var description: String {
        return (_description == nil) ? "" : _description
    }
    var type: String {
        return (_type == nil) ? "" : _type
    }
    var defense: String {
        return (_defense == nil) ? "" : _defense
    }
    var height: String {
        return (_height == nil) ? "" : _height
    }
    var weight: String {
        return (_weight == nil) ? "" : _weight
    }
    var baseAttack: String {
        return (_baseAttack == nil) ? "" : _baseAttack
    }
    var nextEvolution: String {
        return (nextEvolutionId == "") ? "No Evolutions" : "Next evolution \(nextEvolutionName) - LVL \(nextEvolutionLevel)"
    }
    var nextEvolutionLevel: String {
        return (_nextEvolutionLevel == nil) ? "?" : _nextEvolutionLevel
    }
    var nextEvolutionName: String {
        return (_nextEvolutionName == nil) ? "" : _nextEvolutionName
    }
    var nextEvolutionId: String {
        return (_nextEvolutionId == nil) ? "" : _nextEvolutionId
    }
    var pokemonURL: String {
        return (_pokemonURL == nil) ? "" : _pokemonURL
    }
    
    init(name: String, pokedexId: Int) {
        self._name = name.capitalized
        self._pokedexId = pokedexId
        if let pokeId = _pokedexId {
            self._pokemonURL = "\(URL_BASE)\(URL_POKEMON)\(pokeId)/"
        }
    }
    
    func downloadPokemonDetail(completed: @escaping DownloadComplete) {
        Alamofire.request(self._pokemonURL).responseJSON { response in
            if let dictionary = response.result.value as? Dictionary<String, AnyObject>{
                if let attack = dictionary["attack"] as? Int {
                    self._baseAttack = "\(attack)"
                    print(self._baseAttack)
                }
                if let defense = dictionary["defense"] as? Int {
                    self._defense = "\(defense)"
                }
                if let height = dictionary["height"] as? String {
                    self._height = height
                }
                if let weight = dictionary["weight"] as? String {
                    self._weight = weight
                }
                
                if let types = dictionary["types"] as? [Dictionary<String, String>], types.count > 0 {
                    if let name = types[0]["name"] {
                        self._type = name.capitalized
                    }
                    if types.count > 1 {
                        for x in 1 ..< types.count {
                            if let name = types[x]["name"] {
                                self._type! += "/\(name.capitalized)"
                            }
                        }
                    }
                }
                
                if let descriptions = dictionary["descriptions"] as? [Dictionary<String, String>], descriptions.count > 0 {
                    if let urlDescription = descriptions[0]["resource_uri"] {
                        let descriptionURL = "\(URL_BASE)\(urlDescription)"
                        Alamofire.request(descriptionURL).responseJSON{ responseDescription in
                            if let descriptionDictionary = responseDescription.result.value as? Dictionary<String, AnyObject> {
                                if let descriptionPokemon = descriptionDictionary["description"] as? String {
                                    self._description = descriptionPokemon
                                }
                                
                            }
                            completed()
                        }
                    }
                }
                
                if let evolutions = dictionary["evolutions"] as? [Dictionary<String, AnyObject>], evolutions.count > 0 {
                    if let nextEvolutionLevel = evolutions[0]["level"] as? Int {
                        self._nextEvolutionLevel = "\(nextEvolutionLevel)"
                    }
                    if let nextEvolutionName = evolutions[0]["to"] as? String {
                        self._nextEvolutionName = nextEvolutionName
                    }
                    if let urlEvolution = evolutions[0]["resource_uri"] {
                        let evolutionURL = "\(URL_BASE)\(urlEvolution)"
                        Alamofire.request(evolutionURL).responseJSON{ responseEvolution in
                            if let evolutionDictionary = responseEvolution.result.value as? Dictionary<String, AnyObject> {
                                if let pkdxId = evolutionDictionary["pkdx_id"] as? Int {
                                    self._nextEvolutionId = "\(pkdxId)"
                                }
                            }
                            completed()
                        }
                    }
                }
            }
            completed()
        }
    }
}
