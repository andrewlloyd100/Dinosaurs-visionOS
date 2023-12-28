//
//  ContentView.swift
//  Dinosaurs
//
//  Created by Andrew Lloyd on 20/12/2023.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct HomeView: View {
    @Environment(ViewModel.self) private var model

    var body: some View {
        @Bindable var model = model
        
        VStack {
            Spacer()
            ZStack {
                HStack {
                    Spacer()
                    NavigationLink(value: NavigationDestination.info) {
                        Image(systemName: "info.circle")
                    }
                }
                .padding(.trailing, 24)
                Text("Dinosaurs!")
                    .font(.custom("DIN Condensed", size: 75))
                    .bold()
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            }
            Spacer()
            
            Model3D(named: RealityKitImmersionModels.skeleton.rawValue, bundle: realityKitContentBundle) { model in
                model
                    .resizable()
                    .scaledToFit()
                    .frame(depth: 20)
                    .accessibilitySortPriority(1)
            } placeholder: {
                ProgressView()
                    .offset(z: -200 * 0.75)
            }
            .shadow(radius: 50)
            .frame(maxHeight: 400)
            
            HStack {
                ForEach(Module.allCases) { module in
                    NavigationLink(value: module.navigationDestination) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(module.name)
                                .font(.largeTitle)
                        }
                        .padding(.vertical, 30)
                    }
                    .buttonStyle(.bordered)
                    .buttonBorderShape(.roundedRectangle(radius: 20))
                    .frame(minWidth: 200, maxWidth: 355)
                }
            }
            .frame(maxWidth: .infinity)
            .padding()
            Spacer()
        }
        .background() {
            Image("background")
                .resizable()
                .opacity(0.5)
                .scaledToFill()
                .accessibility(hidden: true)
        }
        .glassBackgroundEffect()
    }
}

#Preview(windowStyle: .automatic) {
    HomeView()
}
