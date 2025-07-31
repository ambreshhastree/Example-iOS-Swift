# Ready Player Me SwiftUI iOS Example

This example showcases running Ready Player Me avatar creator website inside a native iOS SwiftUI application using `WKWebView` with `UIViewControllerRepresentable`.

This is a SwiftUI conversion of the original UIKit-based Ready Player Me integration, maintaining all the same functionality while using modern SwiftUI patterns.

## Features

- **SwiftUI Interface**: Modern declarative UI using SwiftUI
- **WebView Integration**: Uses `UIViewControllerRepresentable` to wrap the WebKit WebView
- **State Management**: Uses `@StateObject` and `@Published` for reactive state management
- **Event Handling**: Maintains all Ready Player Me event handling capabilities
- **Cookie Management**: Preserves user sessions and avatar data
- **Cache Management**: Includes web cache cleaning functionality

## Key Components

### ContentView
The main SwiftUI view that displays the avatar creation interface with buttons for creating new avatars and updating existing ones.

### WebViewManager
An `ObservableObject` that manages the WebView state and handles Ready Player Me events, bridging between SwiftUI and UIKit.

### WebViewContainer
A `UIViewControllerRepresentable` that wraps the UIKit WebViewController for use in SwiftUI.

### WebViewController
The core WebKit integration that handles JavaScript messaging and Ready Player Me API communication.

## Usage

1. Update the subdomain in `AvatarCreatorSettings.swift` to match your Ready Player Me configuration
2. Build and run the project
3. Tap "Create Your Avatar" to start the avatar creation process
4. Once an avatar is created, the "Update Avatar" button will appear for editing

## Architecture

The app follows SwiftUI best practices:
- Uses `@StateObject` for managing the WebView lifecycle
- Implements reactive UI updates with `@Published` properties
- Maintains separation of concerns between UI and business logic
- Uses `UIViewControllerRepresentable` for UIKit interoperability

## Requirements

- iOS 14.0+
- Xcode 12.0+
- Swift 5.0+

---

## About Ready Player Me
[Ready Player Me](https://readyplayer.me/developers) is a cross-game avatar platform for Unity, Unreal Engine, and all web-based stacks.

### Getting Started
[Read the documentation](https://docs.readyplayer.me) to get started with integrating Ready Player Me or explore the examples.