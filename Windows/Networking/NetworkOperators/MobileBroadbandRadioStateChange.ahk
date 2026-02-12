#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMobileBroadbandRadioStateChange.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains details of a radio state change notification.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
  * > 
  * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
 * @remarks
 * The system creates instances of this class. Your code can retrieve the details for a particular notification by getting of the [MobileBroadbandRadioStateChangeTriggerDetails.RadioStateChanges](mobilebroadbandradiostatechangetriggerdetails_radiostatechanges.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandradiostatechange
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class MobileBroadbandRadioStateChange extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMobileBroadbandRadioStateChange

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMobileBroadbandRadioStateChange.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the device ID of the device whose radio state changed.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandradiostatechange.deviceid
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * Gets the new state of the radio.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandradiostatechange.radiostate
     * @type {Integer} 
     */
    RadioState {
        get => this.get_RadioState()
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
        if (!this.HasProp("__IMobileBroadbandRadioStateChange")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandRadioStateChange.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandRadioStateChange := IMobileBroadbandRadioStateChange(outPtr)
        }

        return this.__IMobileBroadbandRadioStateChange.get_DeviceId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RadioState() {
        if (!this.HasProp("__IMobileBroadbandRadioStateChange")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandRadioStateChange.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandRadioStateChange := IMobileBroadbandRadioStateChange(outPtr)
        }

        return this.__IMobileBroadbandRadioStateChange.get_RadioState()
    }

;@endregion Instance Methods
}
