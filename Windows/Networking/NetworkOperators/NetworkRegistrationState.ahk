#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes the network registration state of a mobile broadband device.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
  * > 
  * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.networkregistrationstate
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class NetworkRegistrationState extends Win32Enum{

    /**
     * No connectivity.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * The device is not registered and is not searching for a network provider.
     * @type {Integer (Int32)}
     */
    static Deregistered => 1

    /**
     * The device is not registered and is searching for a network provider.
     * @type {Integer (Int32)}
     */
    static Searching => 2

    /**
     * The device is on a home network provider.
     * @type {Integer (Int32)}
     */
    static Home => 3

    /**
     * The device is on a roaming network provider.
     * @type {Integer (Int32)}
     */
    static Roaming => 4

    /**
     * The device is on a roaming partner network provider.
     * @type {Integer (Int32)}
     */
    static Partner => 5

    /**
     * The device was denied registration. Emergency voice calls may be made. This applies to voice and not data.
     * @type {Integer (Int32)}
     */
    static Denied => 6
}
