#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IVirtualPrinterInstallationResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * @namespace Windows.Devices.Printers
 * @version WindowsRuntime 1.4
 */
class VirtualPrinterInstallationResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVirtualPrinterInstallationResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVirtualPrinterInstallationResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
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
        if (!this.HasProp("__IVirtualPrinterInstallationResult")) {
            if ((queryResult := this.QueryInterface(IVirtualPrinterInstallationResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVirtualPrinterInstallationResult := IVirtualPrinterInstallationResult(outPtr)
        }

        return this.__IVirtualPrinterInstallationResult.get_Status()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ExtendedError() {
        if (!this.HasProp("__IVirtualPrinterInstallationResult")) {
            if ((queryResult := this.QueryInterface(IVirtualPrinterInstallationResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVirtualPrinterInstallationResult := IVirtualPrinterInstallationResult(outPtr)
        }

        return this.__IVirtualPrinterInstallationResult.get_ExtendedError()
    }

;@endregion Instance Methods
}
