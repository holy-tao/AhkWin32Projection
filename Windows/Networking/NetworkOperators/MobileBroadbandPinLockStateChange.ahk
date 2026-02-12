#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMobileBroadbandPinLockStateChange.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains details of a PIN lock state change notification.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
  * > 
  * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
 * @remarks
 * The system creates instances of this class. Your code can retrieve the details for a particular notification by getting of the [MobileBroadbandPinLockStateChangeTriggerDetails.PinLockStateChanges](mobilebroadbandpinlockstatechangetriggerdetails_pinlockstatechanges.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandpinlockstatechange
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class MobileBroadbandPinLockStateChange extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMobileBroadbandPinLockStateChange

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMobileBroadbandPinLockStateChange.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the device identifier associated with a PIN lock state change.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandpinlockstatechange.deviceid
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * Gets a value representing the type of PIN involved in a PIN lock state change.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandpinlockstatechange.pintype
     * @type {Integer} 
     */
    PinType {
        get => this.get_PinType()
    }

    /**
     * Gets a value representing the new PIN lock state after a PIN lock state change.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandpinlockstatechange.pinlockstate
     * @type {Integer} 
     */
    PinLockState {
        get => this.get_PinLockState()
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
        if (!this.HasProp("__IMobileBroadbandPinLockStateChange")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandPinLockStateChange.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandPinLockStateChange := IMobileBroadbandPinLockStateChange(outPtr)
        }

        return this.__IMobileBroadbandPinLockStateChange.get_DeviceId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PinType() {
        if (!this.HasProp("__IMobileBroadbandPinLockStateChange")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandPinLockStateChange.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandPinLockStateChange := IMobileBroadbandPinLockStateChange(outPtr)
        }

        return this.__IMobileBroadbandPinLockStateChange.get_PinType()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PinLockState() {
        if (!this.HasProp("__IMobileBroadbandPinLockStateChange")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandPinLockStateChange.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandPinLockStateChange := IMobileBroadbandPinLockStateChange(outPtr)
        }

        return this.__IMobileBroadbandPinLockStateChange.get_PinLockState()
    }

;@endregion Instance Methods
}
