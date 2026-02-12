#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IReplaceDevicePropertiesResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides information about the result of a call to [ReplaceDeviceProperties](ippprintdevice_replacedeviceproperties_1875570505.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.replacedevicepropertiesresult
 * @namespace Windows.Devices.Printers
 * @version WindowsRuntime 1.4
 */
class ReplaceDevicePropertiesResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IReplaceDevicePropertiesResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IReplaceDevicePropertiesResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the status of a call to [ReplaceDeviceProperties](ippprintdevice_replacedeviceproperties_1875570505.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.replacedevicepropertiesresult.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Gets extended information about the attribute set operation error for a call to [ReplaceDeviceProperties](ippprintdevice_replacedeviceproperties_1875570505.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.replacedevicepropertiesresult.extendederror
     * @type {HRESULT} 
     */
    ExtendedError {
        get => this.get_ExtendedError()
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
        if (!this.HasProp("__IReplaceDevicePropertiesResult")) {
            if ((queryResult := this.QueryInterface(IReplaceDevicePropertiesResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReplaceDevicePropertiesResult := IReplaceDevicePropertiesResult(outPtr)
        }

        return this.__IReplaceDevicePropertiesResult.get_Status()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ExtendedError() {
        if (!this.HasProp("__IReplaceDevicePropertiesResult")) {
            if ((queryResult := this.QueryInterface(IReplaceDevicePropertiesResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReplaceDevicePropertiesResult := IReplaceDevicePropertiesResult(outPtr)
        }

        return this.__IReplaceDevicePropertiesResult.get_ExtendedError()
    }

;@endregion Instance Methods
}
