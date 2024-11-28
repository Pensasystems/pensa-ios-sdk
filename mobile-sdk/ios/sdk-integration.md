---
description: >-
  Integrating the Pensa SDK is straightforward with Swift Package Manager.  Take
  advantage of Swift's intuitive syntax and powerful features to quickly add
  advanced shelf recognition to your iOS app.
---

# SDK Integration

To integrate Pensa SDK into your project using SPM, follow the steps below:



1. Open your project in Xcode and select **File > Add Package Dependencies.**

<figure><img src="../../.gitbook/assets/Screenshot 2024-11-26 at 14.19.53.png" alt=""><figcaption></figcaption></figure>

2. Enter the Pensa iOS SDK GitHub repo URL ([`https://github.com/aws-amplify/amplify-swift`](https://github.com/Pensasystems/pensa-ios-sdk)) into the search bar.
3. You'll see the Pensa iOS SDK repository information for which version of Pensa SDK you want Swift Package Manager to install. Choose **Up to Next Major Version** and enter **1.0.0** as the minimum version for the Dependency Rule, then click **Add Package**.

<figure><img src="../../.gitbook/assets/Screenshot 2024-11-26 at 14.24.36.png" alt=""><figcaption></figcaption></figure>

4. Select your app target and click on **Add Package.**

<figure><img src="../../.gitbook/assets/Screenshot 2024-11-26 at 14.24.53.png" alt=""><figcaption></figcaption></figure>

5. Once the package is added, verify its integration by checking the **Build Phases** tab in your project settings to ensure the package is correctly listed under **Link Binary With Libraries**.

<figure><img src="../../.gitbook/assets/Screenshot 2024-11-26 at 14.34.43.png" alt=""><figcaption></figcaption></figure>

