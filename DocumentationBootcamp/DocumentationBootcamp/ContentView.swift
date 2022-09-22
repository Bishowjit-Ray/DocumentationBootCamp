//
//  ContentView.swift
//  DocumentationBootcamp
//
//  Created by Bishowjit Ray on 22/9/22.
//

import SwiftUI

struct ContentView: View {
    
    //Mark: Propertise
    
    @State var data: [String] = ["Apples","oranges","Bananas"]
    @State var showAlert: Bool = false
    
    //Mark: BODY
    //Working copy - things to do:

    /*
    1) fix title
    2) Fix alert
    */

    
    var body: some View {
        NavigationView{ //START: NAV
            ZStack {
                //BAckground
                
                Color.red.ignoresSafeArea()
                
                //foregroumd
                foregroundLayer
                
                ScrollView { // START: SCROLLV
                    Text("Hello")
                    ForEach(data, id: \.self) { name in
                        Text(name)
                            .font(.headline)
                    }
                } // END: SCROLLV
                .navigationTitle("Documentation")
                .navigationBarItems(trailing:
                                        Button("Alert", action: {
                    showAlert.toggle()
                })
                                    
                                            .alert(isPresented: $showAlert, content: {
                                    getAlert(text: "This is the Alert")
                                            })
            )
                
            }
            
        }// END: NAV
        
    }
    /// This  is the foreground layer that holds a scrollView
    private var foregroundLayer: some View{
        
        ScrollView { // START: SCROLLV
            Text("Hello")
            ForEach(data, id: \.self) { name in
                Text(name)
                    .font(.headline)
            }
        } // END: SCROLLV
        
    }

    // MARK: FUNCTIONS
    /// Gets an alert with a specified title
    ///
    ///This function creates and returns an alert immediately. the alert will have a title based on the text parameter but it will NOT have a meesage
    ///
    /// - Parameter text: This is the title for alert
    /// - Returns: returns an alert with a title
    func getAlert(text: String) -> Alert {
        return Alert(title: Text(text))
    }
}
  // Mark: Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
