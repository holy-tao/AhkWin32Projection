#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMobileBroadbandNetworkRegistrationStateChange.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides details about one network registration state change.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
  * > 
  * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
 * @remarks
 * Instances of this class are created by the system. When a network registration state change notification is sent to your app, the [MobileBroadbandNetworkRegistrationStateChangeTriggerDetails.NetworkRegistrationStateChanges](mobilebroadbandnetworkregistrationstatechangetriggerdetails_networkregistrationstatechanges.md) property that is provided with that notification contains a list of MobileBroadbandNetworkRegistrationStateChange instances with the details of the changes associated with the notification.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandnetworkregistrationstatechange
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class MobileBroadbandNetworkRegistrationStateChange extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMobileBroadbandNetworkRegistrationStateChange

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMobileBroadbandNetworkRegistrationStateChange.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the unique identifier of the device associated with a network registration state change.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandnetworkregistrationstatechange.deviceid
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * Gets an object which contains details about the network associated with this network state change.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandnetworkregistrationstatechange.network
     * @type {MobileBroadbandNetwork} 
     */
    Network {
        get => this.get_Network()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceId() {
        if (!this.HasProp("__IMobileBroadbandNetworkRegistrationStateChange")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandNetworkRegistrationStateChange.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandNetworkRegistrationStateChange := IMobileBroadbandNetworkRegistrationStateChange(outPtr)
        }

        return this.__IMobileBroadbandNetworkRegistrationStateChange.get_DeviceId()
    }

    /**
     * 
     * @returns {MobileBroadbandNetwork} 
     */
    get_Network() {
        if (!this.HasProp("__IMobileBroadbandNetworkRegistrationStateChange")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandNetworkRegistrationStateChange.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandNetworkRegistrationStateChange := IMobileBroadbandNetworkRegistrationStateChange(outPtr)
        }

        return this.__IMobileBroadbandNetworkRegistrationStateChange.get_Network()
    }

;@endregion Instance Methods
}
