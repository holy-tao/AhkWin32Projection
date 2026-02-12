#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IIppAttributeError.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents an error for an attribute set operation for a printer or printer job.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippattributeerror
 * @namespace Windows.Devices.Printers
 * @version WindowsRuntime 1.4
 */
class IppAttributeError extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IIppAttributeError

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IIppAttributeError.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * A value that indicates the reason why the attribute set operation failed for a printer or printer job.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippattributeerror.reason
     * @type {Integer} 
     */
    Reason {
        get => this.get_Reason()
    }

    /**
     * Gets extended information about the attribute set operation error for a printer or printer job.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippattributeerror.extendederror
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
    get_Reason() {
        if (!this.HasProp("__IIppAttributeError")) {
            if ((queryResult := this.QueryInterface(IIppAttributeError.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIppAttributeError := IIppAttributeError(outPtr)
        }

        return this.__IIppAttributeError.get_Reason()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ExtendedError() {
        if (!this.HasProp("__IIppAttributeError")) {
            if ((queryResult := this.QueryInterface(IIppAttributeError.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIppAttributeError := IIppAttributeError(outPtr)
        }

        return this.__IIppAttributeError.get_ExtendedError()
    }

    /**
     * Gets the list of attribute values that are not supported by the current printer or printer job.
     * @returns {IVectorView<IppAttributeValue>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippattributeerror.getunsupportedvalues
     */
    GetUnsupportedValues() {
        if (!this.HasProp("__IIppAttributeError")) {
            if ((queryResult := this.QueryInterface(IIppAttributeError.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIppAttributeError := IIppAttributeError(outPtr)
        }

        return this.__IIppAttributeError.GetUnsupportedValues()
    }

;@endregion Instance Methods
}
