#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMobileBroadbandPinLockStateChangeTriggerDetails.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides details for a network registration state change notification.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
  * > 
  * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
 * @remarks
 * When a background task is triggered by a mobile network device service notification, the [IBackgroundTaskInstance.TriggerDetails](../windows.applicationmodel.background/ibackgroundtaskinstance_triggerdetails.md) property returns an instance of this class with information specific to the triggered notification.
 * 
 * The operating system extends battery life by suspending applications that are not in the foreground. If your application must handle new PIN lock state change notifications even while suspended, you must create a background work item to handle the messages. When a new PIN lock state change notification arrives, the background work item will be activated. The MobileBroadbandPinLockStateChangeTriggerDetails class provides the details of the event to your background work item code.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandpinlockstatechangetriggerdetails
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class MobileBroadbandPinLockStateChangeTriggerDetails extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMobileBroadbandPinLockStateChangeTriggerDetails

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMobileBroadbandPinLockStateChangeTriggerDetails.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the collection of PIN lock state change details associated with a notification.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandpinlockstatechangetriggerdetails.pinlockstatechanges
     * @type {IVectorView<MobileBroadbandPinLockStateChange>} 
     */
    PinLockStateChanges {
        get => this.get_PinLockStateChanges()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVectorView<MobileBroadbandPinLockStateChange>} 
     */
    get_PinLockStateChanges() {
        if (!this.HasProp("__IMobileBroadbandPinLockStateChangeTriggerDetails")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandPinLockStateChangeTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandPinLockStateChangeTriggerDetails := IMobileBroadbandPinLockStateChangeTriggerDetails(outPtr)
        }

        return this.__IMobileBroadbandPinLockStateChangeTriggerDetails.get_PinLockStateChanges()
    }

;@endregion Instance Methods
}
