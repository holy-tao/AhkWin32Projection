#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGipFirmwareUpdateResult.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * The result of an update operation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.custom.gipfirmwareupdateresult
 * @namespace Windows.Gaming.Input.Custom
 * @version WindowsRuntime 1.4
 */
class GipFirmwareUpdateResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGipFirmwareUpdateResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGipFirmwareUpdateResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The extended error code for the update operation.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.custom.gipfirmwareupdateresult.extendederrorcode
     * @type {Integer} 
     */
    ExtendedErrorCode {
        get => this.get_ExtendedErrorCode()
    }

    /**
     * The ID of the final updated component.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.custom.gipfirmwareupdateresult.finalcomponentid
     * @type {Integer} 
     */
    FinalComponentId {
        get => this.get_FinalComponentId()
    }

    /**
     * Indicates the status of the firmware update operation.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.custom.gipfirmwareupdateresult.status
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
    get_ExtendedErrorCode() {
        if (!this.HasProp("__IGipFirmwareUpdateResult")) {
            if ((queryResult := this.QueryInterface(IGipFirmwareUpdateResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGipFirmwareUpdateResult := IGipFirmwareUpdateResult(outPtr)
        }

        return this.__IGipFirmwareUpdateResult.get_ExtendedErrorCode()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FinalComponentId() {
        if (!this.HasProp("__IGipFirmwareUpdateResult")) {
            if ((queryResult := this.QueryInterface(IGipFirmwareUpdateResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGipFirmwareUpdateResult := IGipFirmwareUpdateResult(outPtr)
        }

        return this.__IGipFirmwareUpdateResult.get_FinalComponentId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IGipFirmwareUpdateResult")) {
            if ((queryResult := this.QueryInterface(IGipFirmwareUpdateResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGipFirmwareUpdateResult := IGipFirmwareUpdateResult(outPtr)
        }

        return this.__IGipFirmwareUpdateResult.get_Status()
    }

;@endregion Instance Methods
}
