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
