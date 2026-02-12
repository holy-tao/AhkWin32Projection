#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrintSupportMxdcImageQualityConfiguration.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents an Microsoft XPS Document Converter (MXDC) image quality configuration.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printsupport.printsupportmxdcimagequalityconfiguration
 * @namespace Windows.Graphics.Printing.PrintSupport
 * @version WindowsRuntime 1.4
 */
class PrintSupportMxdcImageQualityConfiguration extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrintSupportMxdcImageQualityConfiguration

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrintSupportMxdcImageQualityConfiguration.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the image quality for XPS images when the output quality is set to "Normal".
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printsupport.printsupportmxdcimagequalityconfiguration.normaloutputquality
     * @type {Integer} 
     */
    NormalOutputQuality {
        get => this.get_NormalOutputQuality()
        set => this.put_NormalOutputQuality(value)
    }

    /**
     * Gets or sets the image quality for XPS images when the output quality is set to "Draft".
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printsupport.printsupportmxdcimagequalityconfiguration.draftoutputquality
     * @type {Integer} 
     */
    DraftOutputQuality {
        get => this.get_DraftOutputQuality()
        set => this.put_DraftOutputQuality(value)
    }

    /**
     * Gets or sets the image quality for XPS images when the output quality is set to "High".
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printsupport.printsupportmxdcimagequalityconfiguration.highoutputquality
     * @type {Integer} 
     */
    HighOutputQuality {
        get => this.get_HighOutputQuality()
        set => this.put_HighOutputQuality(value)
    }

    /**
     * Gets or sets the image quality for XPS images when the output quality is set to "Photographic".
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printsupport.printsupportmxdcimagequalityconfiguration.photographicoutputquality
     * @type {Integer} 
     */
    PhotographicOutputQuality {
        get => this.get_PhotographicOutputQuality()
        set => this.put_PhotographicOutputQuality(value)
    }

    /**
     * Gets or sets the image quality for XPS images when the output quality is set to "Text".
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printsupport.printsupportmxdcimagequalityconfiguration.textoutputquality
     * @type {Integer} 
     */
    TextOutputQuality {
        get => this.get_TextOutputQuality()
        set => this.put_TextOutputQuality(value)
    }

    /**
     * Gets or sets the image quality for XPS images when the output quality is set to "Automatic".
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printsupport.printsupportmxdcimagequalityconfiguration.automaticoutputquality
     * @type {Integer} 
     */
    AutomaticOutputQuality {
        get => this.get_AutomaticOutputQuality()
        set => this.put_AutomaticOutputQuality(value)
    }

    /**
     * Gets or sets the image quality for XPS images when the output quality is set to "Fax".
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printsupport.printsupportmxdcimagequalityconfiguration.faxoutputquality
     * @type {Integer} 
     */
    FaxOutputQuality {
        get => this.get_FaxOutputQuality()
        set => this.put_FaxOutputQuality(value)
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
    get_NormalOutputQuality() {
        if (!this.HasProp("__IPrintSupportMxdcImageQualityConfiguration")) {
            if ((queryResult := this.QueryInterface(IPrintSupportMxdcImageQualityConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintSupportMxdcImageQualityConfiguration := IPrintSupportMxdcImageQualityConfiguration(outPtr)
        }

        return this.__IPrintSupportMxdcImageQualityConfiguration.get_NormalOutputQuality()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_NormalOutputQuality(value) {
        if (!this.HasProp("__IPrintSupportMxdcImageQualityConfiguration")) {
            if ((queryResult := this.QueryInterface(IPrintSupportMxdcImageQualityConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintSupportMxdcImageQualityConfiguration := IPrintSupportMxdcImageQualityConfiguration(outPtr)
        }

        return this.__IPrintSupportMxdcImageQualityConfiguration.put_NormalOutputQuality(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DraftOutputQuality() {
        if (!this.HasProp("__IPrintSupportMxdcImageQualityConfiguration")) {
            if ((queryResult := this.QueryInterface(IPrintSupportMxdcImageQualityConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintSupportMxdcImageQualityConfiguration := IPrintSupportMxdcImageQualityConfiguration(outPtr)
        }

        return this.__IPrintSupportMxdcImageQualityConfiguration.get_DraftOutputQuality()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_DraftOutputQuality(value) {
        if (!this.HasProp("__IPrintSupportMxdcImageQualityConfiguration")) {
            if ((queryResult := this.QueryInterface(IPrintSupportMxdcImageQualityConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintSupportMxdcImageQualityConfiguration := IPrintSupportMxdcImageQualityConfiguration(outPtr)
        }

        return this.__IPrintSupportMxdcImageQualityConfiguration.put_DraftOutputQuality(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HighOutputQuality() {
        if (!this.HasProp("__IPrintSupportMxdcImageQualityConfiguration")) {
            if ((queryResult := this.QueryInterface(IPrintSupportMxdcImageQualityConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintSupportMxdcImageQualityConfiguration := IPrintSupportMxdcImageQualityConfiguration(outPtr)
        }

        return this.__IPrintSupportMxdcImageQualityConfiguration.get_HighOutputQuality()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_HighOutputQuality(value) {
        if (!this.HasProp("__IPrintSupportMxdcImageQualityConfiguration")) {
            if ((queryResult := this.QueryInterface(IPrintSupportMxdcImageQualityConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintSupportMxdcImageQualityConfiguration := IPrintSupportMxdcImageQualityConfiguration(outPtr)
        }

        return this.__IPrintSupportMxdcImageQualityConfiguration.put_HighOutputQuality(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PhotographicOutputQuality() {
        if (!this.HasProp("__IPrintSupportMxdcImageQualityConfiguration")) {
            if ((queryResult := this.QueryInterface(IPrintSupportMxdcImageQualityConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintSupportMxdcImageQualityConfiguration := IPrintSupportMxdcImageQualityConfiguration(outPtr)
        }

        return this.__IPrintSupportMxdcImageQualityConfiguration.get_PhotographicOutputQuality()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_PhotographicOutputQuality(value) {
        if (!this.HasProp("__IPrintSupportMxdcImageQualityConfiguration")) {
            if ((queryResult := this.QueryInterface(IPrintSupportMxdcImageQualityConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintSupportMxdcImageQualityConfiguration := IPrintSupportMxdcImageQualityConfiguration(outPtr)
        }

        return this.__IPrintSupportMxdcImageQualityConfiguration.put_PhotographicOutputQuality(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TextOutputQuality() {
        if (!this.HasProp("__IPrintSupportMxdcImageQualityConfiguration")) {
            if ((queryResult := this.QueryInterface(IPrintSupportMxdcImageQualityConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintSupportMxdcImageQualityConfiguration := IPrintSupportMxdcImageQualityConfiguration(outPtr)
        }

        return this.__IPrintSupportMxdcImageQualityConfiguration.get_TextOutputQuality()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_TextOutputQuality(value) {
        if (!this.HasProp("__IPrintSupportMxdcImageQualityConfiguration")) {
            if ((queryResult := this.QueryInterface(IPrintSupportMxdcImageQualityConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintSupportMxdcImageQualityConfiguration := IPrintSupportMxdcImageQualityConfiguration(outPtr)
        }

        return this.__IPrintSupportMxdcImageQualityConfiguration.put_TextOutputQuality(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AutomaticOutputQuality() {
        if (!this.HasProp("__IPrintSupportMxdcImageQualityConfiguration")) {
            if ((queryResult := this.QueryInterface(IPrintSupportMxdcImageQualityConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintSupportMxdcImageQualityConfiguration := IPrintSupportMxdcImageQualityConfiguration(outPtr)
        }

        return this.__IPrintSupportMxdcImageQualityConfiguration.get_AutomaticOutputQuality()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_AutomaticOutputQuality(value) {
        if (!this.HasProp("__IPrintSupportMxdcImageQualityConfiguration")) {
            if ((queryResult := this.QueryInterface(IPrintSupportMxdcImageQualityConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintSupportMxdcImageQualityConfiguration := IPrintSupportMxdcImageQualityConfiguration(outPtr)
        }

        return this.__IPrintSupportMxdcImageQualityConfiguration.put_AutomaticOutputQuality(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FaxOutputQuality() {
        if (!this.HasProp("__IPrintSupportMxdcImageQualityConfiguration")) {
            if ((queryResult := this.QueryInterface(IPrintSupportMxdcImageQualityConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintSupportMxdcImageQualityConfiguration := IPrintSupportMxdcImageQualityConfiguration(outPtr)
        }

        return this.__IPrintSupportMxdcImageQualityConfiguration.get_FaxOutputQuality()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_FaxOutputQuality(value) {
        if (!this.HasProp("__IPrintSupportMxdcImageQualityConfiguration")) {
            if ((queryResult := this.QueryInterface(IPrintSupportMxdcImageQualityConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintSupportMxdcImageQualityConfiguration := IPrintSupportMxdcImageQualityConfiguration(outPtr)
        }

        return this.__IPrintSupportMxdcImageQualityConfiguration.put_FaxOutputQuality(value)
    }

;@endregion Instance Methods
}
