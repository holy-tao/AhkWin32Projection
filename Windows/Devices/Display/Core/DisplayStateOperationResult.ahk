#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDisplayStateOperationResult.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains the status of a [DisplayState](displaystate.md) operation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaystateoperationresult
 * @namespace Windows.Devices.Display.Core
 * @version WindowsRuntime 1.4
 */
class DisplayStateOperationResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDisplayStateOperationResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDisplayStateOperationResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the status of the result.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaystateoperationresult.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Gets the extended error code of the result.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaystateoperationresult.extendederrorcode
     * @type {HRESULT} 
     */
    ExtendedErrorCode {
        get => this.get_ExtendedErrorCode()
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
        if (!this.HasProp("__IDisplayStateOperationResult")) {
            if ((queryResult := this.QueryInterface(IDisplayStateOperationResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayStateOperationResult := IDisplayStateOperationResult(outPtr)
        }

        return this.__IDisplayStateOperationResult.get_Status()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ExtendedErrorCode() {
        if (!this.HasProp("__IDisplayStateOperationResult")) {
            if ((queryResult := this.QueryInterface(IDisplayStateOperationResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayStateOperationResult := IDisplayStateOperationResult(outPtr)
        }

        return this.__IDisplayStateOperationResult.get_ExtendedErrorCode()
    }

;@endregion Instance Methods
}
