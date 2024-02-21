import SwiftUI
import CoreGraphics

struct ContentView: View {
    @State var detailSelection:Int? = 0
    @State var progress = 0.0
    @State var columnVisibility = NavigationSplitViewVisibility.doubleColumn
    
    var body: some View {
        NavigationSplitView(columnVisibility: $columnVisibility,sidebar: {
            List(sections, id: \.id, selection: $detailSelection) { section in
                    Label(section.name, systemImage: section.icon)
            }
            .listStyle(.sidebar)
            .navigationTitle("Bezier Curves")
        
            
        }, detail: {
            PageView(selection: $detailSelection, columnVisibility: $columnVisibility)
                .onChange(of: detailSelection, perform: { _ in
                    columnVisibility = .detailOnly
                })
        })
    }
}



