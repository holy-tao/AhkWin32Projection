#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPdfPageRenderOptions.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents display settings for a single page of a Portable Document Format (PDF) document, such as the page's background color and its encoding type.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.data.pdf.pdfpagerenderoptions
 * @namespace Windows.Data.Pdf
 * @version WindowsRuntime 1.4
 */
class PdfPageRenderOptions extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPdfPageRenderOptions

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPdfPageRenderOptions.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a portion of the Portable Document Format (PDF) page to be displayed.
     * @see https://learn.microsoft.com/uwp/api/windows.data.pdf.pdfpagerenderoptions.sourcerect
     * @type {RECT} 
     */
    SourceRect {
        get => this.get_SourceRect()
        set => this.put_SourceRect(value)
    }

    /**
     * Gets or sets the final size of the rendering of the Portable Document Format (PDF) page in device-independent pixels (DIPs).
     * @remarks
     * The value for **DestinationWidth** is the final size of the rendered page. If **DestinationWidth** is not specified, the page's aspect ratio is maintained relative to the destination height.
     * @see https://learn.microsoft.com/uwp/api/windows.data.pdf.pdfpagerenderoptions.destinationwidth
     * @type {Integer} 
     */
    DestinationWidth {
        get => this.get_DestinationWidth()
        set => this.put_DestinationWidth(value)
    }

    /**
     * Gets or sets the final size of the rendering of the Portable Document Format (PDF) page in device-independent pixels (DIPs).
     * @remarks
     * The value for **DestinationHeight** is the final size of the rendered page. If **DestinationHeight** is not specified, the page's aspect ratio is maintained relative to the destination width.
     * @see https://learn.microsoft.com/uwp/api/windows.data.pdf.pdfpagerenderoptions.destinationheight
     * @type {Integer} 
     */
    DestinationHeight {
        get => this.get_DestinationHeight()
        set => this.put_DestinationHeight(value)
    }

    /**
     * Gets or sets the Portable Document Format (PDF) page's background color.
     * @remarks
     * The default background color is [White](../windows.ui/colors_white.md)
     * @see https://learn.microsoft.com/uwp/api/windows.data.pdf.pdfpagerenderoptions.backgroundcolor
     * @type {Color} 
     */
    BackgroundColor {
        get => this.get_BackgroundColor()
        set => this.put_BackgroundColor(value)
    }

    /**
     * Gets or sets whether the Portable Document Format (PDF) page uses the system's high contrast display setting.
     * @see https://learn.microsoft.com/uwp/api/windows.data.pdf.pdfpagerenderoptions.isignoringhighcontrast
     * @type {Boolean} 
     */
    IsIgnoringHighContrast {
        get => this.get_IsIgnoringHighContrast()
        set => this.put_IsIgnoringHighContrast(value)
    }

    /**
     * Gets or sets the Portable Document Format (PDF) page's encoding type to be used while the page is being converted to a bitmap.
     * @see https://learn.microsoft.com/uwp/api/windows.data.pdf.pdfpagerenderoptions.bitmapencoderid
     * @type {Guid} 
     */
    BitmapEncoderId {
        get => this.get_BitmapEncoderId()
        set => this.put_BitmapEncoderId(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates and initializes a new instance of display settings for a single page of a Portable Document Format (PDF) document.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Data.Pdf.PdfPageRenderOptions")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_SourceRect() {
        if (!this.HasProp("__IPdfPageRenderOptions")) {
            if ((queryResult := this.QueryInterface(IPdfPageRenderOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPdfPageRenderOptions := IPdfPageRenderOptions(outPtr)
        }

        return this.__IPdfPageRenderOptions.get_SourceRect()
    }

    /**
     * 
     * @param {RECT} value 
     * @returns {HRESULT} 
     */
    put_SourceRect(value) {
        if (!this.HasProp("__IPdfPageRenderOptions")) {
            if ((queryResult := this.QueryInterface(IPdfPageRenderOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPdfPageRenderOptions := IPdfPageRenderOptions(outPtr)
        }

        return this.__IPdfPageRenderOptions.put_SourceRect(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DestinationWidth() {
        if (!this.HasProp("__IPdfPageRenderOptions")) {
            if ((queryResult := this.QueryInterface(IPdfPageRenderOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPdfPageRenderOptions := IPdfPageRenderOptions(outPtr)
        }

        return this.__IPdfPageRenderOptions.get_DestinationWidth()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_DestinationWidth(value) {
        if (!this.HasProp("__IPdfPageRenderOptions")) {
            if ((queryResult := this.QueryInterface(IPdfPageRenderOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPdfPageRenderOptions := IPdfPageRenderOptions(outPtr)
        }

        return this.__IPdfPageRenderOptions.put_DestinationWidth(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DestinationHeight() {
        if (!this.HasProp("__IPdfPageRenderOptions")) {
            if ((queryResult := this.QueryInterface(IPdfPageRenderOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPdfPageRenderOptions := IPdfPageRenderOptions(outPtr)
        }

        return this.__IPdfPageRenderOptions.get_DestinationHeight()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_DestinationHeight(value) {
        if (!this.HasProp("__IPdfPageRenderOptions")) {
            if ((queryResult := this.QueryInterface(IPdfPageRenderOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPdfPageRenderOptions := IPdfPageRenderOptions(outPtr)
        }

        return this.__IPdfPageRenderOptions.put_DestinationHeight(value)
    }

    /**
     * 
     * @returns {Color} 
     */
    get_BackgroundColor() {
        if (!this.HasProp("__IPdfPageRenderOptions")) {
            if ((queryResult := this.QueryInterface(IPdfPageRenderOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPdfPageRenderOptions := IPdfPageRenderOptions(outPtr)
        }

        return this.__IPdfPageRenderOptions.get_BackgroundColor()
    }

    /**
     * 
     * @param {Color} value 
     * @returns {HRESULT} 
     */
    put_BackgroundColor(value) {
        if (!this.HasProp("__IPdfPageRenderOptions")) {
            if ((queryResult := this.QueryInterface(IPdfPageRenderOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPdfPageRenderOptions := IPdfPageRenderOptions(outPtr)
        }

        return this.__IPdfPageRenderOptions.put_BackgroundColor(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsIgnoringHighContrast() {
        if (!this.HasProp("__IPdfPageRenderOptions")) {
            if ((queryResult := this.QueryInterface(IPdfPageRenderOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPdfPageRenderOptions := IPdfPageRenderOptions(outPtr)
        }

        return this.__IPdfPageRenderOptions.get_IsIgnoringHighContrast()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsIgnoringHighContrast(value) {
        if (!this.HasProp("__IPdfPageRenderOptions")) {
            if ((queryResult := this.QueryInterface(IPdfPageRenderOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPdfPageRenderOptions := IPdfPageRenderOptions(outPtr)
        }

        return this.__IPdfPageRenderOptions.put_IsIgnoringHighContrast(value)
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_BitmapEncoderId() {
        if (!this.HasProp("__IPdfPageRenderOptions")) {
            if ((queryResult := this.QueryInterface(IPdfPageRenderOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPdfPageRenderOptions := IPdfPageRenderOptions(outPtr)
        }

        return this.__IPdfPageRenderOptions.get_BitmapEncoderId()
    }

    /**
     * 
     * @param {Guid} value 
     * @returns {HRESULT} 
     */
    put_BitmapEncoderId(value) {
        if (!this.HasProp("__IPdfPageRenderOptions")) {
            if ((queryResult := this.QueryInterface(IPdfPageRenderOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPdfPageRenderOptions := IPdfPageRenderOptions(outPtr)
        }

        return this.__IPdfPageRenderOptions.put_BitmapEncoderId(value)
    }

;@endregion Instance Methods
}
