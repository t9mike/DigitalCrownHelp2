import SwiftUI

struct ContentView: View {
    @State var crownValue = 0.0
    @Namespace private var namespace
    @Environment(\.resetFocus) var resetFocus
    @State var forceFocus = false
    
    var body: some View {
        ScrollView {
            VStack {
                Button("Button") {
                }
                .focusable(forceFocus)
                .prefersDefaultFocus(true, in: namespace)
                Text("\(crownValue)")
            }
            .digitalCrownRotation($crownValue)
            
            // Goal is for this button to give focus to other button and start capturing
            // digital crown changes; but have to touch this button twice to get desired
            // effect
            Button("Enable Crown") {
                print("Enabling crown")
                forceFocus = true
                resetFocus(in: namespace)
            }
        }
        .focusScope(namespace)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
