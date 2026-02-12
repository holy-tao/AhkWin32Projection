#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IIppPrintDeviceInstallationResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * @namespace Windows.Devices.Printers
 * @version WindowsRuntime 1.4
 */
class IppPrintDeviceInstallationResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IIppPrintDeviceInstallationResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IIppPrintDeviceInstallationResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * @type {HSTRING} 
     */
    InstalledPrinterName {
        get => this.get_InstalledPrinterName()
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
        if (!this.HasProp("__IIppPrintDeviceInstallationResult")) {
            if ((queryResult := this.QueryInterface(IIppPrintDeviceInstallationResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIppPrintDeviceInstallationResult := IIppPrintDeviceInstallationResult(outPtr)
        }

        return this.__IIppPrintDeviceInstallationResult.get_Status()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_InstalledPrinterName() {
        if (!this.HasProp("__IIppPrintDeviceInstallationResult")) {
            if ((queryResult := this.QueryInterface(IIppPrintDeviceInstallationResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIppPrintDeviceInstallationResult := IIppPrintDeviceInstallationResult(outPtr)
        }

        return this.__IIppPrintDeviceInstallationResult.get_InstalledPrinterName()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ExtendedError() {
        if (!this.HasProp("__IIppPrintDeviceInstallationResult")) {
            if ((queryResult := this.QueryInterface(IIppPrintDeviceInstallationResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIppPrintDeviceInstallationResult := IIppPrintDeviceInstallationResult(outPtr)
        }

        return this.__IIppPrintDeviceInstallationResult.get_ExtendedError()
    }

;@endregion Instance Methods
}
