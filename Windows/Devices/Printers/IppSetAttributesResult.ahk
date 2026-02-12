#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IIppSetAttributesResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * The result of an attribute set operation for a printer or printer job.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippsetattributesresult
 * @namespace Windows.Devices.Printers
 * @version WindowsRuntime 1.4
 */
class IppSetAttributesResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IIppSetAttributesResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IIppSetAttributesResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that indicates whether the attribute set operation succeeded.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippsetattributesresult.succeeded
     * @type {Boolean} 
     */
    Succeeded {
        get => this.get_Succeeded()
    }

    /**
     * Gets the collection of errors for an attribute set operation for a printer or printer job.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippsetattributesresult.attributeerrors
     * @type {IMapView<HSTRING, IppAttributeError>} 
     */
    AttributeErrors {
        get => this.get_AttributeErrors()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Succeeded() {
        if (!this.HasProp("__IIppSetAttributesResult")) {
            if ((queryResult := this.QueryInterface(IIppSetAttributesResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIppSetAttributesResult := IIppSetAttributesResult(outPtr)
        }

        return this.__IIppSetAttributesResult.get_Succeeded()
    }

    /**
     * 
     * @returns {IMapView<HSTRING, IppAttributeError>} 
     */
    get_AttributeErrors() {
        if (!this.HasProp("__IIppSetAttributesResult")) {
            if ((queryResult := this.QueryInterface(IIppSetAttributesResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIppSetAttributesResult := IIppSetAttributesResult(outPtr)
        }

        return this.__IIppSetAttributesResult.get_AttributeErrors()
    }

;@endregion Instance Methods
}
