#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IVirtualPrinterInstallationParameters.ahk
#Include ..\..\..\Guid.ahk

/**
 * @namespace Windows.Devices.Printers
 * @version WindowsRuntime 1.4
 */
class VirtualPrinterInstallationParameters extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVirtualPrinterInstallationParameters

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVirtualPrinterInstallationParameters.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * @type {HSTRING} 
     */
    PrinterName {
        get => this.get_PrinterName()
        set => this.put_PrinterName(value)
    }

    /**
     * @type {IVector<HSTRING>} 
     */
    OutputFileExtensions {
        get => this.get_OutputFileExtensions()
    }

    /**
     * @type {IVector<VirtualPrinterSupportedFormat>} 
     */
    SupportedInputFormats {
        get => this.get_SupportedInputFormats()
    }

    /**
     * @type {HSTRING} 
     */
    PrintDeviceCapabilitiesPackageRelativeFilePath {
        get => this.get_PrintDeviceCapabilitiesPackageRelativeFilePath()
        set => this.put_PrintDeviceCapabilitiesPackageRelativeFilePath(value)
    }

    /**
     * @type {HSTRING} 
     */
    PrintDeviceResourcesPackageRelativeFilePath {
        get => this.get_PrintDeviceResourcesPackageRelativeFilePath()
        set => this.put_PrintDeviceResourcesPackageRelativeFilePath(value)
    }

    /**
     * @type {Integer} 
     */
    PreferredInputFormat {
        get => this.get_PreferredInputFormat()
        set => this.put_PreferredInputFormat(value)
    }

    /**
     * @type {Uri} 
     */
    PrinterUri {
        get => this.get_PrinterUri()
        set => this.put_PrinterUri(value)
    }

    /**
     * @type {HSTRING} 
     */
    EntryPoint {
        get => this.get_EntryPoint()
        set => this.put_EntryPoint(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Devices.Printers.VirtualPrinterInstallationParameters")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PrinterName() {
        if (!this.HasProp("__IVirtualPrinterInstallationParameters")) {
            if ((queryResult := this.QueryInterface(IVirtualPrinterInstallationParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVirtualPrinterInstallationParameters := IVirtualPrinterInstallationParameters(outPtr)
        }

        return this.__IVirtualPrinterInstallationParameters.get_PrinterName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_PrinterName(value) {
        if (!this.HasProp("__IVirtualPrinterInstallationParameters")) {
            if ((queryResult := this.QueryInterface(IVirtualPrinterInstallationParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVirtualPrinterInstallationParameters := IVirtualPrinterInstallationParameters(outPtr)
        }

        return this.__IVirtualPrinterInstallationParameters.put_PrinterName(value)
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_OutputFileExtensions() {
        if (!this.HasProp("__IVirtualPrinterInstallationParameters")) {
            if ((queryResult := this.QueryInterface(IVirtualPrinterInstallationParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVirtualPrinterInstallationParameters := IVirtualPrinterInstallationParameters(outPtr)
        }

        return this.__IVirtualPrinterInstallationParameters.get_OutputFileExtensions()
    }

    /**
     * 
     * @returns {IVector<VirtualPrinterSupportedFormat>} 
     */
    get_SupportedInputFormats() {
        if (!this.HasProp("__IVirtualPrinterInstallationParameters")) {
            if ((queryResult := this.QueryInterface(IVirtualPrinterInstallationParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVirtualPrinterInstallationParameters := IVirtualPrinterInstallationParameters(outPtr)
        }

        return this.__IVirtualPrinterInstallationParameters.get_SupportedInputFormats()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PrintDeviceCapabilitiesPackageRelativeFilePath() {
        if (!this.HasProp("__IVirtualPrinterInstallationParameters")) {
            if ((queryResult := this.QueryInterface(IVirtualPrinterInstallationParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVirtualPrinterInstallationParameters := IVirtualPrinterInstallationParameters(outPtr)
        }

        return this.__IVirtualPrinterInstallationParameters.get_PrintDeviceCapabilitiesPackageRelativeFilePath()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_PrintDeviceCapabilitiesPackageRelativeFilePath(value) {
        if (!this.HasProp("__IVirtualPrinterInstallationParameters")) {
            if ((queryResult := this.QueryInterface(IVirtualPrinterInstallationParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVirtualPrinterInstallationParameters := IVirtualPrinterInstallationParameters(outPtr)
        }

        return this.__IVirtualPrinterInstallationParameters.put_PrintDeviceCapabilitiesPackageRelativeFilePath(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PrintDeviceResourcesPackageRelativeFilePath() {
        if (!this.HasProp("__IVirtualPrinterInstallationParameters")) {
            if ((queryResult := this.QueryInterface(IVirtualPrinterInstallationParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVirtualPrinterInstallationParameters := IVirtualPrinterInstallationParameters(outPtr)
        }

        return this.__IVirtualPrinterInstallationParameters.get_PrintDeviceResourcesPackageRelativeFilePath()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_PrintDeviceResourcesPackageRelativeFilePath(value) {
        if (!this.HasProp("__IVirtualPrinterInstallationParameters")) {
            if ((queryResult := this.QueryInterface(IVirtualPrinterInstallationParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVirtualPrinterInstallationParameters := IVirtualPrinterInstallationParameters(outPtr)
        }

        return this.__IVirtualPrinterInstallationParameters.put_PrintDeviceResourcesPackageRelativeFilePath(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PreferredInputFormat() {
        if (!this.HasProp("__IVirtualPrinterInstallationParameters")) {
            if ((queryResult := this.QueryInterface(IVirtualPrinterInstallationParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVirtualPrinterInstallationParameters := IVirtualPrinterInstallationParameters(outPtr)
        }

        return this.__IVirtualPrinterInstallationParameters.get_PreferredInputFormat()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_PreferredInputFormat(value) {
        if (!this.HasProp("__IVirtualPrinterInstallationParameters")) {
            if ((queryResult := this.QueryInterface(IVirtualPrinterInstallationParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVirtualPrinterInstallationParameters := IVirtualPrinterInstallationParameters(outPtr)
        }

        return this.__IVirtualPrinterInstallationParameters.put_PreferredInputFormat(value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_PrinterUri() {
        if (!this.HasProp("__IVirtualPrinterInstallationParameters")) {
            if ((queryResult := this.QueryInterface(IVirtualPrinterInstallationParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVirtualPrinterInstallationParameters := IVirtualPrinterInstallationParameters(outPtr)
        }

        return this.__IVirtualPrinterInstallationParameters.get_PrinterUri()
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_PrinterUri(value) {
        if (!this.HasProp("__IVirtualPrinterInstallationParameters")) {
            if ((queryResult := this.QueryInterface(IVirtualPrinterInstallationParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVirtualPrinterInstallationParameters := IVirtualPrinterInstallationParameters(outPtr)
        }

        return this.__IVirtualPrinterInstallationParameters.put_PrinterUri(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_EntryPoint() {
        if (!this.HasProp("__IVirtualPrinterInstallationParameters")) {
            if ((queryResult := this.QueryInterface(IVirtualPrinterInstallationParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVirtualPrinterInstallationParameters := IVirtualPrinterInstallationParameters(outPtr)
        }

        return this.__IVirtualPrinterInstallationParameters.get_EntryPoint()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_EntryPoint(value) {
        if (!this.HasProp("__IVirtualPrinterInstallationParameters")) {
            if ((queryResult := this.QueryInterface(IVirtualPrinterInstallationParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVirtualPrinterInstallationParameters := IVirtualPrinterInstallationParameters(outPtr)
        }

        return this.__IVirtualPrinterInstallationParameters.put_EntryPoint(value)
    }

;@endregion Instance Methods
}
