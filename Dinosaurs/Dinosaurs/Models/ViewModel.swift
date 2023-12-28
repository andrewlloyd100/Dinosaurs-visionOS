//
//  ViewModel.swift
//  Dinosaurs
//
//  Created by Andrew Lloyd on 20/12/2023.
//

import Foundation

@Observable
class ViewModel {
    
    // MARK: - Navigation
    var navigationPath: [NavigationDestination] = []

    // MARK: - Triceratops
    var isShowingTriceratops: Bool = false

    // MARK: - Raptor
    var isShowingRaptorEgg: Bool = false
    var isShowingRaptor: Bool = false

    // MARK: - TRex
    var isShowingTRex: Bool = false
}

enum NavigationDestination: Hashable {
    case info
    case tyrannosaurus
    case velociraptor
    case triceratops
}
