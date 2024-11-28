# Table of contents

* [SDK Integration](#sdk-integration)
* [SDK Initialization](#sdk-initialization)
* [SDK Functionality](#sdk-functionality)


# SDK Integration

To integrate Pensa SDK into your project using SPM, follow the steps below:


1. Open your project in Xcode and select **File > Add Package Dependencies.**

<figure><img src=".gitbook/assets/Screenshot 2024-11-26 at 14.19.53.png" alt=""><figcaption></figcaption></figure>

2. Enter the Pensa iOS SDK GitHub repo URL ([`https://github.com/Pensasystems/pensa-ios-sdk`](https://github.com/Pensasystems/pensa-ios-sdk)) into the search bar.
  
3. You'll see the Pensa iOS SDK repository information for which version of Pensa SDK you want Swift Package Manager to install. Choose **Up to Next Major Version** and enter **1.0.0** as the minimum version for the Dependency Rule, then click **Add Package**.

<figure><img src=".gitbook/assets/Screenshot 2024-11-29 at 02.14.00.png" alt=""><figcaption></figcaption></figure>

4. Select your app target and click on **Add Package.**

<figure><img src=".gitbook/assets/Screenshot 2024-11-26 at 14.24.53.png" alt=""><figcaption></figcaption></figure>

5. Once the package is added, verify its integration by checking the **Build Phases** tab in your project settings to ensure the package is correctly listed under **Link Binary With Libraries**.

<figure><img src=".gitbook/assets/Screenshot 2024-11-26 at 14.34.43.png" alt=""><figcaption></figcaption></figure>

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


# SDK Functionality

The Pensa library is a lightweight SDK that simplifies interactions through straightforward method calls. This SDK enables you to:

* **Locate stores:** Easily find the stores you're looking for.
* **Access stores directly:** Use global store IDs to access a specific store and initiate a scan directly.
* **View store history:** Conveniently access a list of previously visited stores.
* **Monitor scan uploads:** Track the upload status of your scans.

## Searching stores

To initiate a store search using the Pensa SDK, integrate the following code snippet into your UIViewController/UIView:

```swift
 Pensa.shared.displaySearchStore()
```

This will present a search interface where you can input keywords (e.g., store name, location) to find the desired store. Upon selecting a store from the search results, the SDK will automatically redirect you to that store's details, allowing you to begin a scan.

{% hint style="warning" %}
The entered keyword must be at least 3 characters long.
{% endhint %}

## **Accessing Stores Directly with Global Store IDs**

The Pensa SDK lets you directly access a store and initiate a scan using its global store ID. To do this, use the `displayStoreById` method:

```swift
Pensa.shared.displayStoreById(globalStoreId: storeId)
```

This method takes the `globalStoreId` as a parameter and navigates directly to the specified store.

**Handling Errors**

To handle potential errors during store initialization, you can provide an `onError` callback to the `displayStoreById` method:

```swift
Pensa.shared.displayStoreById(globalStoreId: storeId, 
                              onError: { error in
                                  print(error.localizedDescription)
                              })
```

The `onError` callback will be executed if an error occurs, providing a `PensaError` object that contains information about the error.

**Sending Custom Parameters with Scans**

In addition to using global store IDs, the Pensa SDK allows you to send custom parameters along with your scans. This can be useful for including company-specific information or metadata.

To send custom parameters, use the `sectionKey` and `guid` parameters in the `displayStoreById` method.

{% hint style="danger" %}
It's important to note that both `sectionKey` and `guid` must be used together. If either parameter is missing, the SDK will only consider the `globalStoreId` parameter.
{% endhint %}

Here's an example code block demonstrating how to use these parameters:

```swift
Pensa.shared.displayStoreById(sectionKey: sectionKey,
                              guid: guid,
                              globalStoreId: storeId,
                              onError: { error in
                                  print(error.localizedDescription) 
                              })
```

## Recently Visited Stores

The Pensa SDK maintains a cache of recently visited stores for easy access and reuse. This allows you to quickly return to a previously scanned store without searching for it again.

**Adding Stores to the Cache**

A store is automatically added to the "Recently Visited Stores" cache when you:

* Use the `displayStoreById(globalStoreId:)` method to access a store.
* Select a store from the search results after using `displaySearchStore()`.

**Accessing Recently Visited Stores**

To display the "Recently Visited Stores" screen, use the following code:

```swift
Pensa.shared.displayRecentlyVisitedStores()
```

This will present a screen listing the recently visited stores. You can select a store from this screen to access its details and initiate a new scan.

## Monitoring Scan Uploads

The Pensa SDK provides a convenient way to monitor the progress of your scan uploads. By using the `monitorUploads` method, you gain real-time visibility into the upload status:

```swift
Pensa.shared.monitorUploads()
```

This method presents a screen that displays the status of each scan upload. You can use this screen to:

* **Track upload progress:** Observe the progress of ongoing uploads.
* **View completed uploads:** See a history of successfully uploaded scans.
* **Cancel uploads:** Stop the upload of any scan that is in progress.

This feature gives you complete control over your scan uploads and ensures you're always informed about their status.
