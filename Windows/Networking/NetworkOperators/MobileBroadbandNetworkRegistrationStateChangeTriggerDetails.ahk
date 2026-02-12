#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMobileBroadbandNetworkRegistrationStateChangeTriggerDetails.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides details for a network registration state change notification.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
  * > 
  * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
 * @remarks
 * When a background task is triggered by a mobile network registration state change notification, the [IBackgroundTaskInstance.TriggerDetails](../windows.applicationmodel.background/ibackgroundtaskinstance_triggerdetails.md) property returns an instance of this class with information specific to the triggered notification.
 * 
 * The operating system extends battery life by suspending applications that are not in the foreground. If your application must handle new network registration state change notifications even while suspended, you must create a background work item to handle the messages. When a new network registration state change notification arrives, the background work item will be activated. The MobileBroadbandNetworkRegistrationStateChangeTriggerDetails class provides the details of the event to your background work item code.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandnetworkregistrationstatechangetriggerdetails
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class MobileBroadbandNetworkRegistrationStateChangeTriggerDetails extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMobileBroadbandNetworkRegistrationStateChangeTriggerDetails

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMobileBroadbandNetworkRegistrationStateChangeTriggerDetails.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the collection of network registration state changes associated with this notification.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandnetworkregistrationstatechangetriggerdetails.networkregistrationstatechanges
     * @type {IVectorView<MobileBroadbandNetworkRegistrationStateChange>} 
     */
    NetworkRegistrationStateChanges {
        get => this.get_NetworkRegistrationStateChanges()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVectorView<MobileBroadbandNetworkRegistrationStateChange>} 
     */
    get_NetworkRegistrationStateChanges() {
        if (!this.HasProp("__IMobileBroadbandNetworkRegistrationStateChangeTriggerDetails")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandNetworkRegistrationStateChangeTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandNetworkRegistrationStateChangeTriggerDetails := IMobileBroadbandNetworkRegistrationStateChangeTriggerDetails(outPtr)
        }

        return this.__IMobileBroadbandNetworkRegistrationStateChangeTriggerDetails.get_NetworkRegistrationStateChanges()
    }

;@endregion Instance Methods
}
