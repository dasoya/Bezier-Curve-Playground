//
//  Pages.swift
//  2024challenge
//
//  Created by dasoya on 2/21/24.
//

import SwiftUI

struct PageView: View {
    @Binding var selection:Int?
    @State var page:Int = 0
    @State var finalPage = 0
    @State var hideButton = false
    @Binding var columnVisibility: NavigationSplitViewVisibility
   
    let finalPages = [1,4,1,1,1,1]
    var body: some View {
        VStack {
            EmptyView()
                .onChange(of: selection, perform: { _ in
                    page = 0
                })
            
                switch selection {
                    case 0:
                        LongerCurveView()
                    case 1:
                        LearningView()
                        
                    default:
                        Text("hello \(page)")
                }
            
        }
        .onChange(of: selection, perform: { _ in
            page = 0
        })
        .toolbar(content: {
         
            
            ToolbarItem(placement: .bottomBar,content: {
                if finalPage != page && hideButton == false {
                    Button(action: {
                        page += 1
                    }, label: {
                        Label("Forward", systemImage: "arrow.forward")
                    })
                    .buttonStyle(.bordered)
                    .buttonBorderShape(.capsule)
                    .tint((page == 0) ? .white : .blue)
                } else if hideButton == false {
                    if page < 6 {
                        Button(action: {
                            if selection != 5 {
                                selection! += 1
                                page = 0
                            }
                           
                        }, label: {
                            Label("Complete Section", systemImage: "checkmark")
                        })
                        .buttonStyle(.bordered)
                        .buttonBorderShape(.capsule)
                        .tint(.green)
                    }
                }
            })
        })
    }
}

