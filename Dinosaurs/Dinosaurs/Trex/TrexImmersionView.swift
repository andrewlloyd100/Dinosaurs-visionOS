//
//  TrexImmersionView.swift
//  Dinosaurs
//
//  Created by Andrew Lloyd on 21/12/2023.
//

import SwiftUI
import RealityKit

struct TrexImmersionView: View {
    @Environment(ViewModel.self) private var model
    
    var body: some View {
        ZStack {
            TRex()
            PrehistoricLandscape()
        }
        .onAppear {
            model.isShowingTRex = true
            var announcement = AttributedString("Entered the immersive prehistoric age with a TRex!")
            announcement.accessibilitySpeechAnnouncementPriority = .high
            AccessibilityNotification.Announcement(announcement).post()
        }
        .onDisappear {
            model.isShowingTRex = false
        }
    }
}

#Preview {
    TrexImmersionView()
}
