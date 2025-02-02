# SwiftUI TopSheetViewModifier

A custom SwiftUI .topSheet view modifier with behaviour similar to the native .sheet modifier.

## Installation

### Swift Package Manager

To install Lottie using Swift Package Manager you can follow the tutorial published by Apple using the URL for this repo with the current version:

In Xcode, select “File” → “Add Packages...”
Enter https://github.com/airbnb/lottie-spm.git
or you can add the following dependency to your Package.swift:
```

swift
  dependencies: [
    .package(url: "https://github.com/your_username/MyAwesomeViewModifiers.git", from: "1.0.0"),
  ]

```
## Usage

```
import TopSheetModifier

struct YourView: View {

  @State var isPresented = false

  var body: some View {
    AnyView()
      .topSheet(isPresented: $isPresented) {
          // Your sheet view
      }
  }

```
Modifier also has optional showIndicator parameter. Hide by default.

## Demo

