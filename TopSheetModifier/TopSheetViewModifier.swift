//
//  TopSheetViewModifier.swift
//  TopSheetModifier
//
//  Created by Andrei Atrakhimovich on 31.01.25.
//

import SwiftUI

/// The view modifier for handling top sheet.
///
/// Use this modifier in conjunction with your view.
///
/// - Important: `isPresented`  should be controlled by parent view.
///
///     struct ContentView : View {
///         @State private var showSheet = false
///
///         var body: some View {
///             Text("Hello World")
///                 .topSheet(isPresented: $showSheet) {
///                     Text("This is Top sheet")
///                 }
///         }
///     }
///
/// - Parameters:
///   - isPresented: Controls the state of the sheet.
///   - showIndicator:  Show the indicator.
///   - content: The content of the sheet.
///
public struct TopSheetViewModifier<InnerContent: View>: ViewModifier {

    @State private var dragOffset = CGSize.zero
    @Binding var isPresented: Bool

    private let showIndicator: Bool
    private let content: () -> InnerContent

    private let maxDragDistance: CGFloat = 100

    init(isPresented: Binding<Bool>,
         showIndicator: Bool,
         content: @escaping () -> InnerContent) {
        self._isPresented = isPresented
        self.showIndicator = showIndicator
        self.content = content
    }

    public func body(content: Content) -> some View {
        ZStack(alignment: .top) {
            VStack(spacing: 0) {
                Spacer()
                content
                Spacer()
            }
            .zIndex(0)
            if isPresented {
                darkBackground()
                    .zIndex(1)
                VStack(spacing: 0) {
                    Rectangle()
                        .fill(.white)
                        .frame(height: min(dragOffset.height, maxDragDistance) / 4)
                    self.content()
                        .padding(.top, 60)
                        .padding(.bottom, 5)
                    Rectangle()
                        .fill(.white)
                        .frame(height: min(dragOffset.height, maxDragDistance) / 4)
                    draggableView()
                }
                .zIndex(2)
                .frame(maxWidth: .infinity)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                .shadow(radius: 5)
                .offset(y: min(dragOffset.height, 0))
                .transition(.asymmetric(insertion: .move(edge: .top), removal: .move(edge: .top)))
                .animation(.bouncy, value: dragOffset)
            }
        }
        .ignoresSafeArea(edges: .top)
        .animation(.spring, value: isPresented)
    }

    @ViewBuilder private func darkBackground() -> some View {
        Color.black.opacity(0.3)
            .ignoresSafeArea()
            .onTapGesture {
                withAnimation {
                    isPresented = false
                }
            }
    }

    @ViewBuilder private func draggableView() -> some View {
        ZStack {
            Rectangle()
                .fill(.white)
                .frame(maxWidth: .infinity, maxHeight: 40)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            print(value.translation)
                            dragOffset = value.translation
                        }
                        .onEnded { value in
                            withAnimation {
                                if value.predictedEndTranslation.height < -100 {
                                    isPresented = false
                                }
                                dragOffset = .zero
                            }
                        }
                )
            if showIndicator {
                DragIndicator()

            }
        }
    }
}

struct DragIndicator: View {
    var body: some View {
        Capsule()
            .fill(.gray.opacity(0.6))
            .frame(width: 36, height: 5)
            .padding(.vertical, 8)
    }
}

extension View {
    func topSheet<Content: View>(isPresented: Binding<Bool>,
                                 showIndicator: Bool = false,
                                 @ViewBuilder content: @escaping () -> Content) -> some View {
        self.modifier(TopSheetViewModifier(isPresented: isPresented,
                                           showIndicator: showIndicator,
                                           content: content))
    }
}
