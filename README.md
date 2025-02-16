# SwiftUI TopSheetViewModifier

A custom SwiftUI .topSheet view modifier with behaviour similar to the native .sheet modifier.

## Installation

### Swift Package Manager

In Xcode, select “File” → “Add Packages...”
Enter https://github.com/AtrakhimovichDev/TopSheetModifier.git
or you can add the following dependency to your Package.swift:
```swift
  dependencies: [
    .package(url: "https://github.com/AtrakhimovichDev/TopSheetModifier.git", branch: "main"),
  ]
```

## Manual

Just copy TopSheetViewModifier.swift file to your project and use it.

## Usage

```swift
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

https://github.com/user-attachments/assets/14d16be8-3338-44ba-9e90-5ffbe09ad47c

## License

This framework template is available as open source under the terms of the [MIT License](https://opensource.org/license/MIT).
