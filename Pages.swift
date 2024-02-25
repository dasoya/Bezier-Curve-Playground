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
    
    let finalPages = [0,4,1,0,0]
    var body: some View {
        VStack {
            EmptyView()
                .onChange(of: selection, perform: { _ in
                    page = 0
                    finalPage = finalPages[selection!]
                })
            
            switch selection {
            case 0:
               WelcomeAnimationView()
    
            case 1:
                LearningView(stepIndex: $page)
            case 2:
                LongerCurveMainView(stepIndex: $page)
                
            case 3:
                Bezier3DCurveView()
                
            case 4:
                PlaygroundMainView()
                
            default:
                Text("Hi You meet a Bug >3<")
            }
            
        }
        .onChange(of: selection, perform: { _ in
            page = 0
        })
        .toolbar(content: {
            
            
            ToolbarItem(placement: .bottomBar ,content: {
          
               
                if finalPage != page && hideButton == false {
                    Button(action: {
                        if(selection==1 && page == 1 ){
                            
                        }
                        else { page += 1 }
                   
                    }, label: {
                        Label("Forward", systemImage: "arrow.forward")
                    })
                    .buttonStyle(.bordered)
                    .buttonBorderShape(.capsule)

                    
                } else if hideButton == false {
                    if selection! < 4{
                        Button(action: {
                            
                                selection! += 1
                                page = 0
                            
                            
                        }, label: {
                            Label("Complete", systemImage: "checkmark")
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

