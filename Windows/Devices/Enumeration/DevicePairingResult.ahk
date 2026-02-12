#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDevicePairingResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains information about the result of attempting to pair a device.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.devicepairingresult
 * @namespace Windows.Devices.Enumeration
 * @version WindowsRuntime 1.4
 */
class DevicePairingResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDevicePairingResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDevicePairingResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the paired status of the device after the pairing action completed.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.devicepairingresult.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Gets the level of protection used to pair the device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.devicepairingresult.protectionlevelused
     * @type {Integer} 
     */
    ProtectionLevelUsed {
        get => this.get_ProtectionLevelUsed()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IDevicePairingResult")) {
            if ((queryResult := this.QueryInterface(IDevicePairingResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDevicePairingResult := IDevicePairingResult(outPtr)
        }

        return this.__IDevicePairingResult.get_Status()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ProtectionLevelUsed() {
        if (!this.HasProp("__IDevicePairingResult")) {
            if ((queryResult := this.QueryInterface(IDevicePairingResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDevicePairingResult := IDevicePairingResult(outPtr)
        }

        return this.__IDevicePairingResult.get_ProtectionLevelUsed()
    }

;@endregion Instance Methods
}
