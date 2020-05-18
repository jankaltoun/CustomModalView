# Custom Modal View

Custom Modal View is a tiny SwiftUI library that lets you present completely customizable modal dialogs.

It's API is built similar to the one of native `.sheet(...)` view modifier and its usage fits well into the existing SwiftUI apps.

![Styling View](screenshots/preview.gif)

# Installation

## Swift Package Manager

Simply add URL of this repository into your package dependencies:

https://github.com/jankaltoun/custom-modal-view

# Platform support

This library is best used on iOS and iPadOS but macOS works as well.

The code would compile for tvOS and watchOS as well but the UI paradigms there are different enough so that using modals does not really make sense.

![Styling View](screenshots/example_ios.png)

![Styling View](screenshots/example_macos.png)

# Usage

Please refer to the [Example project](Example) for working iOS and macOS example.

## Creating a modal

To create a modal view, use the `.modal(...)` view modifier on any view.

You need to pass a binding to some `Bool` or `Identifiable?` property so that the modal knows when to appear and disappear. The behaviour is exactly the same as with `.sheet(...)` view modifier.

The example below shows initialization with a binding to a `Bool` property.

```
struct MainView: View {
    @State var modalIsDisplayed = false
    
    var body: some View {
        Button(action: { self.modalIsDisplayed = true }) {
            Text("Show modal")
        }
        .modal(isPresented: $modalIsDisplayed) {
            Text("Hello world!")
                .padding()
        }
    }
}
```

And the next example shows initialization with a binding to an `Identifiable?` property.

```
struct ContentView: View {
    enum SomethingIdentifiable: Int, Identifiable {
        case llama = 1

        var id: Int {
            rawValue
        }
    }
    
    @State var somethingIdentifiable: SomethingIdentifiable? = nil

    var body: some View {
        Button(action: { self.somethingIdentifiable = .llama }) {
            Text("Show modal")
        }
        .modal(item: $somethingIdentifiable) { item in
            Text("Alpacas are the best!")
                .padding()
        }
    }
}
```

## Dismissing a modal

By default, tapping the area behind the modal dismisses it. This behaviour can be modified (see the [Styling a modal](#styling-a-modal) section).

If you'd like to dismiss your modal using a button, you can use the `.modalPresentationMode` key to get a binding to `ModalPresentationMode` and call `dismiss()` on it.

Such property of your view should be defined as `@Environment(\.modalPresentationMode) var modalPresentationMode: Binding<ModalPresentationMode>`.

Doing so would look like the following example.

```
import CustomModalView

struct ContentView: View {
    @State var modalIsDisplayed = false

    var body: some View {
        Button(action: { self.modalIsDisplayed = true }) {
            Text("Show modal")
        }
        .modal(isPresented: $modalIsDisplayed) {
            DetailView()
        }
    }
}

struct DetailView: View {
    @Environment(\.modalPresentationMode) var modalPresentationMode: Binding<ModalPresentationMode>
    
    var body: some View {
        VStack(spacing: 32) {
            Text("I'm a modal")
            
            Button(action: {
                self.modalPresentationMode.wrappedValue.dismiss()
            }) {
                Text("Dismiss")
            }
        }
        .padding()
    }
}
```

Another option would be to just pass the binding to the property your modal is bound to and setting it to `false` (or `nil` if your property is `Identifiable?`).

This is a bit cumbersome, but it can be done quite easily.

```
struct ContentView: View {
    @State var modalIsDisplayed = false

    var body: some View {
        Button(action: { self.modalIsDisplayed = true }) {
            Text("Show modal")
        }
        .modal(isPresented: $modalIsDisplayed) {
            DetailView(isDisplayed: $modalIsDisplayed)
        }
    }
}

struct DetailView: View {
    @Binding var isDisplayed: Bool
    
    var body: some View {
        VStack(spacing: 32) {
            Text("I'm a modal.")
                .fixedSize(horizontal: false, vertical: true)
            
            Button(action: { self.isDisplayed = false }) {
                Text("Dismiss")
            }
        }
        .padding()
    }
    
    init(isDisplayed: Binding<Bool>) {
        self._isDisplayed = isDisplayed
    }
}
```

## Styling a modal

You are free to style your modal as you wish and there are two tools at your disposal:
- Styling the view
- Styling the container

### Styling the view

View styling can be used to modify the appearance of the modal contents.
You can use all SwiftUI tools to do so.

For example - a modal defined like the one in the example below.

```
struct ContentView: View {
    @State var modalIsDisplayed = false

    var body: some View {
        Button(action: { self.modalIsDisplayed = true }) {
            Text("Show modal")
        }
        .modal(isPresented: $modalIsDisplayed) {
            Text("I'm a fancy Hello world!")
                .frame(width: 200, height: 100, alignment: .topLeading)
                .padding()
                .background(Color.red)
                .foregroundColor(.white)
        }
    }
}
```

Will result in the following UI.

![Styling View](screenshots/styling_view.png)

### Styling the container

If you need to adjust roundness of the corners, background of the modal or basically anything else, you can create your own modal style.

Defining your own style is easy. First create a `struct` conforming to `ModalStyle` protocol and then implement the two required functions.

Using the two functions you can completely customize the appearance of both the background and modal views as well as the animation used when the modal appears and disappears.

```
struct DefaultModalStyle: ModalStyle {
    let animation: Animation? = .easeInOut(duration: 0.5)
    
    func makeBackground(configuration: ModalStyle.BackgroundConfiguration, isPresented: Binding<Bool>) -> some View {
        configuration.background
            .edgesIgnoringSafeArea(.all)
            .foregroundColor(.black)
            .opacity(0.3)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .zIndex(1000)
            .onTapGesture {
                isPresented.wrappedValue = false
            }
    }
    
    func makeModal(configuration: ModalStyle.ModalContentConfiguration, isPresented: Binding<Bool>) -> some View {
        configuration.content
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .zIndex(1001)
    }
}
```

In fact, this is exactly how the [DefaultModalStyle](Sources/CustomModalView/Style/DefaultModalStyle) is implemented.

A fancy style may look like the example below.

```
import CustomModalView

struct FancyModalStyle: ModalStyle {
    let animation: Animation? = .easeInOut(duration: 0.5)
    
    func makeBackground(configuration: ModalStyle.BackgroundConfiguration, isPresented: Binding<Bool>) -> some View {
        configuration.background
            .edgesIgnoringSafeArea(.all)
            .foregroundColor(.blue)
            .opacity(0.3)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .zIndex(1000)
    }
    
    func makeModal(configuration: ModalStyle.ModalContentConfiguration, isPresented: Binding<Bool>) -> some View {
        configuration.content
            .background(Color.yellow)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .zIndex(1001)
    }
}

struct ContentView: View {
    @State var modalIsDisplayed = false
    
    var body: some View {
        Button(action: { self.modalIsDisplayed = true }) {
            Text("Show modal")
        }
        .modal(isPresented: $modalIsDisplayed) {
            Text("Hello world!")
                .padding()
        }
        .modalStyle(FancyModalStyle())
    }
}
```

The result of such style is demonstrated by the following screenshots.

![Styling View](screenshots/styling_container.png)

![Styling View](screenshots/styling_container_macos.png)