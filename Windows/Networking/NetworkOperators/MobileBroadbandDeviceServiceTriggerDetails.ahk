#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMobileBroadbandDeviceServiceTriggerDetails.ahk
#Include .\IMobileBroadbandDeviceServiceTriggerDetails2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides details for a network device service notification.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
  * > 
  * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
 * @remarks
 * When a background task is triggered by a mobile network device service notification, the [IBackgroundTaskInstance.TriggerDetails](../windows.applicationmodel.background/ibackgroundtaskinstance_triggerdetails.md) property returns an instance of this class with information specific to the triggered notification.
 * 
 * The operating system extends battery life by suspending applications that are not in the foreground. If your application must handle new network device service notifications even while suspended, you must create a background work item to handle the messages. When a new device service notification arrives, the background work item will be activated. The MobileBroadbandDeviceServiceTriggerDetails class provides the details of the event to your background work item code.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbanddeviceservicetriggerdetails
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class MobileBroadbandDeviceServiceTriggerDetails extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMobileBroadbandDeviceServiceTriggerDetails

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMobileBroadbandDeviceServiceTriggerDetails.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the device ID of the device that triggered a broadband device service event.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbanddeviceservicetriggerdetails.deviceid
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * Gets the device service identifier for the device service trigger event.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbanddeviceservicetriggerdetails.deviceserviceid
     * @type {Guid} 
     */
    DeviceServiceId {
        get => this.get_DeviceServiceId()
    }

    /**
     * Gets the received data associated with the triggered event.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbanddeviceservicetriggerdetails.receiveddata
     * @type {IBuffer} 
     */
    ReceivedData {
        get => this.get_ReceivedData()
    }

    /**
     * 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbanddeviceservicetriggerdetails.eventid
     * @type {Integer} 
     */
    EventId {
        get => this.get_EventId()
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
        if (!this.HasProp("__IMobileBroadbandDeviceServiceTriggerDetails")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandDeviceServiceTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandDeviceServiceTriggerDetails := IMobileBroadbandDeviceServiceTriggerDetails(outPtr)
        }

        return this.__IMobileBroadbandDeviceServiceTriggerDetails.get_DeviceId()
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_DeviceServiceId() {
        if (!this.HasProp("__IMobileBroadbandDeviceServiceTriggerDetails")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandDeviceServiceTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandDeviceServiceTriggerDetails := IMobileBroadbandDeviceServiceTriggerDetails(outPtr)
        }

        return this.__IMobileBroadbandDeviceServiceTriggerDetails.get_DeviceServiceId()
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_ReceivedData() {
        if (!this.HasProp("__IMobileBroadbandDeviceServiceTriggerDetails")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandDeviceServiceTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandDeviceServiceTriggerDetails := IMobileBroadbandDeviceServiceTriggerDetails(outPtr)
        }

        return this.__IMobileBroadbandDeviceServiceTriggerDetails.get_ReceivedData()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_EventId() {
        if (!this.HasProp("__IMobileBroadbandDeviceServiceTriggerDetails2")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandDeviceServiceTriggerDetails2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandDeviceServiceTriggerDetails2 := IMobileBroadbandDeviceServiceTriggerDetails2(outPtr)
        }

        return this.__IMobileBroadbandDeviceServiceTriggerDetails2.get_EventId()
    }

;@endregion Instance Methods
}
