#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDeviceUnpairingResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains information about the result of attempting to unpair a device.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.deviceunpairingresult
 * @namespace Windows.Devices.Enumeration
 * @version WindowsRuntime 1.4
 */
class DeviceUnpairingResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDeviceUnpairingResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDeviceUnpairingResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the paired status of the device after the unpairing action completed.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.deviceunpairingresult.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
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
        if (!this.HasProp("__IDeviceUnpairingResult")) {
            if ((queryResult := this.QueryInterface(IDeviceUnpairingResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceUnpairingResult := IDeviceUnpairingResult(outPtr)
        }

        return this.__IDeviceUnpairingResult.get_Status()
    }

;@endregion Instance Methods
}
