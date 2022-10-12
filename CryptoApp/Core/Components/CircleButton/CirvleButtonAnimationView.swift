//
//  CirvleButtonAnimationView.swift
//  CryptoApp
//
//  Created by MM on 13.09.2022.
//

import SwiftUI

struct CirvleButtonAnimationView: View {
    
    @Binding var isAnimatedCircle: Bool
    
    var body: some View {
        Circle()
            .stroke(lineWidth: 5)
            .scaleEffect(isAnimatedCircle ? 1 : 0)
            .opacity(isAnimatedCircle ? 0 : 1)
            .onAppear {
                isAnimatedCircle.toggle()
            }
            .animation(isAnimatedCircle ? Animation.easeInOut : .none)
    }
}

struct CirvleButtonAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        CirvleButtonAnimationView(isAnimatedCircle: .constant(false))
            .frame(width: 100, height: 100)
    }
}
