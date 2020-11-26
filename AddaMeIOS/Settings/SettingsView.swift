//
//  SettingsView.swift
//  AddaMeIOS
//
//  Created by Saroar Khandoker on 26.11.2020.
//

import SwiftUI

struct SettingsView: View {
  @State private var distance = UserDefaults.standard.double(forKey: "distance") //133.0
  
  var body: some View {
    VStack {
      DistanceFilterView(distance: self.$distance)
        .padding([.top, .bottom], 20)
        .transition(.opacity)
      Spacer()
    }
  }
}

struct SettingsView_Previews: PreviewProvider {
  static var previews: some View {
    SettingsView()
  }
}

struct DistanceFilterView: View {
  
  @Binding var distance: Double 
  
  var minDistance = 5.0
  var maxDistance = 250.0
  
  var body: some View {
    VStack(alignment: .leading) {
      
      Text("Near by distance \(Int(distance)) km")
        .onChange(of: /*@START_MENU_TOKEN@*/"Value"/*@END_MENU_TOKEN@*/, perform: { value in
          UserDefaults.standard.set(distance, forKey: "distance")
        })
        .font(.system(.headline, design: .rounded))
      
      HStack {
        Slider(value: $distance, in: minDistance...maxDistance, step: 1, onEditingChanged: {changing in self.update(changing) })
          .accentColor(.green)
      }
      
      HStack {
        Text("\(Int(minDistance))")
          .font(.system(.footnote, design: .rounded))
        
        Spacer()
        
        Text("\(Int(maxDistance))")
          .font(.system(.footnote, design: .rounded))
      }
      
    }
    .onAppear {
      update(true)
    }
    .padding(.horizontal)
    .padding(.bottom, 10)
  }
  
  func update(_ changing: Bool) -> Void {
    UserDefaults.standard.setValue(distance == 0 ? 249 : distance, forKey: "distance")
  }
  
}

struct DistanceFilterView_Previews: PreviewProvider {
  static var previews: some View {
    DistanceFilterView(distance: .constant(250))
  }
}