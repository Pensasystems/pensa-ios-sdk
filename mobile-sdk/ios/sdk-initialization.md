# SDK Initialization

## Initializing PensaSdk

### Developing with  SwiftUI framework

{% hint style="info" %}
The Pensa SDK's functionality is encapsulated within a shared object, allowing developers to interact with its API.
{% endhint %}

Import the PensaSdk framework in your app's main struct and call the <mark style="color:orange;">**initPensa**</mark> method as shown below.

```swift
import SwiftUI
import PensaSdk

@main
struct SampleApp: App {
    init() {
        Pensa.shared.initPensa(clientId: "YOUR-CLIENT-ID", clientSecret: "YOUR-CLIENT-SECRET"){ error in
            if let error {
                print("Error on initializing Pensa SDK: \(error)")
            } else {
                print("Pensa SDK is ready to start!!")
            }
        }
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```



## Developing with UIKit

Import the PensaSdk framework in your app's AppDelegate class and call <mark style="color:orange;">**initPensa**</mark> method inside the **didFinishLaunchingWithOptions** method.



```swift
@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        Pensa.shared.initPensa(clientId: "YOUR_CLIENT_ID", clientSecret: "YOUR_CLIENT_SECRET"){ error in
            if let error {
                print("Error on initializing Pensa SDK: \(error)")
            } else {
                print("Pensa SDK is ready to start!!")
            }
        }
        
        return true
    }
}
```



### Logging&#x20;

You can show/hide Pensa framework logs by simply calling the enableLogging/disableLogging methods.  By default the Pensa library logs were disabled.



{% hint style="info" %}
Calling the **enableLogging** method before starting PensaSdk ensures that you do not miss any logs during initialization.
{% endhint %}



```swift
import SwiftUI
import PensaSdk

@main
struct SampleApp: App {
    init() {
        Pensa.shared.enableLogging()
        Pensa.shared.initPensa(clientId: "YOUR_CLIENT_ID", clientSecret: "YOUR_CLIENT_SECRET"){ error in
            if let error {
                print("Error on initializing Pensa SDK: \(error)")
            } else {
                print("Pensa SDK is ready to start!!")
            }
        }
    }
    ...
```



{% hint style="danger" %}
Once the Pensa SDK is initialized, the callback method triggers immediately. If the initialization fails, an error is returned. Otherwise, the error is nil.
{% endhint %}

Scan capture requires access to the device's camera. To avoid runtime errors, add the `NSCameraUsageDescription` key to your application's `Info.plist` file. This key allows you to provide a user-facing message explaining why your app needs camera access, for example:

```xml
<key>NSCameraUsageDescription</key>
<string>This app requires camera access to perform scans.</string>
```
