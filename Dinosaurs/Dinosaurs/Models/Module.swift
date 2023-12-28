//
//  Module.swift
//  Dinosaurs
//
//  Created by Andrew Lloyd on 20/12/2023.
//

import Foundation

/// A description of the modules that the app can present.
enum Module: String, Identifiable, CaseIterable, Equatable {
    case tyrannosaurus, velociraptor, triceratops
    var id: Self { self }
    var name: String { rawValue.capitalized }

    var heading: String {
        switch self {
        case .tyrannosaurus:
            "Tyrannosaurus: The Fearsome King of the Cretaceous"
        case .velociraptor:
            "Velociraptor: The Swift and Clever Hunter"
        case .triceratops:
            "Triceratops: The Majestic Three-Horned Herbivore"
        }
    }

    var body: String {
        switch self {
        case .tyrannosaurus:
            "The Tyrannosaurus rex, often known as T. rex, reigned as one of the largest carnivorous dinosaurs during the Late Cretaceous period. With its massive size, powerful jaws, and serrated teeth, T. rex was a formidable predator, capable of hunting down prey and scavenging for meals. Despite its short arms, this iconic dinosaur's strong hind limbs enabled it to move swiftly, making it a dominant force in its prehistoric ecosystem."
        case .velociraptor:
            "Velociraptor, often depicted in popular culture, was a small but highly intelligent carnivorous dinosaur from the Late Cretaceous period. Contrary to some portrayals, Velociraptors were about the size of a turkey, yet they compensated for their petite stature with remarkable agility and sharp, retractable claws. Believed to be pack hunters, these dinosaurs utilized teamwork and cunning strategies to take down larger prey, showcasing a level of intelligence that sets them apart in the dinosaur kingdom."
        case .triceratops:
            "The Triceratops, characterized by its distinct frill and three facial horns, was a herbivorous dinosaur that roamed North America during the Late Cretaceous period. With a massive body and a beak suitable for cropping vegetation, Triceratops was well-adapted to a plant-based diet. The horns and frill likely served both defensive and mating purposes, making this dinosaur a striking and formidable presence on the prehistoric landscape."
        }
    }
    
    var modelName: String {
        switch self {
        case .tyrannosaurus:
            return "trex"
        case .velociraptor:
            return "raptor"
        case .triceratops:
            return "triceratops"
        }
    }
    
    var callToAction: String {
        switch self {
        case .velociraptor: "View Raptor Egg"
        case .triceratops: "Invite a Triceratops into your room"
        case .tyrannosaurus: "Explore with a T-Rex"
        }
    }
    
    var navigationDestination: NavigationDestination {
        switch self {
        case .tyrannosaurus:
            return .tyrannosaurus
        case .velociraptor:
            return .velociraptor
        case .triceratops:
            return .triceratops
        }
    }
}

enum RealityKitImmersionModels: String {
    case skeleton = "Dino"
    case trex
    case raptorEgg
    case triceratops
    case raptor = "raptor2"
    case animatedTrex
}
