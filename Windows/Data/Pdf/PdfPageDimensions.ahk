#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPdfPageDimensions.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the dimensions of a single page in a Portable Document Format (PDF) document.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.data.pdf.pdfpagedimensions
 * @namespace Windows.Data.Pdf
 * @version WindowsRuntime 1.4
 */
class PdfPageDimensions extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPdfPageDimensions

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPdfPageDimensions.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the size of a rectangle that defines the boundaries of the area that the Portable Document Format (PDF) page will be displayed or printed to.
     * @see https://learn.microsoft.com/uwp/api/windows.data.pdf.pdfpagedimensions.mediabox
     * @type {RECT} 
     */
    MediaBox {
        get => this.get_MediaBox()
    }

    /**
     * Gets the size of a rectangle that specifies the cropped region of a Portable Document Format (PDF) page's contents when it is displayed.
     * @remarks
     * When the Portable Document Format (PDF) page is displayed or printed, its contents are cropped to this rectangle.
     * @see https://learn.microsoft.com/uwp/api/windows.data.pdf.pdfpagedimensions.cropbox
     * @type {RECT} 
     */
    CropBox {
        get => this.get_CropBox()
    }

    /**
     * Gets the size of a rectangle that specifies the clipped region of a Portable Document Format (PDF) page's contents when it is displayed.
     * @see https://learn.microsoft.com/uwp/api/windows.data.pdf.pdfpagedimensions.bleedbox
     * @type {RECT} 
     */
    BleedBox {
        get => this.get_BleedBox()
    }

    /**
     * Gets the size of a rectangle that specifies the intended dimensions of the Portable Document Format (PDF) page after it has been trimmed.
     * @see https://learn.microsoft.com/uwp/api/windows.data.pdf.pdfpagedimensions.trimbox
     * @type {RECT} 
     */
    TrimBox {
        get => this.get_TrimBox()
    }

    /**
     * Gets the size of a rectangle that contains the Portable Document Format (PDF) page's contents, including any meaningful surrounding white space, as intended by the Portable Document Format (PDF) page's creator.
     * @see https://learn.microsoft.com/uwp/api/windows.data.pdf.pdfpagedimensions.artbox
     * @type {RECT} 
     */
    ArtBox {
        get => this.get_ArtBox()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_MediaBox() {
        if (!this.HasProp("__IPdfPageDimensions")) {
            if ((queryResult := this.QueryInterface(IPdfPageDimensions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPdfPageDimensions := IPdfPageDimensions(outPtr)
        }

        return this.__IPdfPageDimensions.get_MediaBox()
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_CropBox() {
        if (!this.HasProp("__IPdfPageDimensions")) {
            if ((queryResult := this.QueryInterface(IPdfPageDimensions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPdfPageDimensions := IPdfPageDimensions(outPtr)
        }

        return this.__IPdfPageDimensions.get_CropBox()
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_BleedBox() {
        if (!this.HasProp("__IPdfPageDimensions")) {
            if ((queryResult := this.QueryInterface(IPdfPageDimensions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPdfPageDimensions := IPdfPageDimensions(outPtr)
        }

        return this.__IPdfPageDimensions.get_BleedBox()
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_TrimBox() {
        if (!this.HasProp("__IPdfPageDimensions")) {
            if ((queryResult := this.QueryInterface(IPdfPageDimensions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPdfPageDimensions := IPdfPageDimensions(outPtr)
        }

        return this.__IPdfPageDimensions.get_TrimBox()
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_ArtBox() {
        if (!this.HasProp("__IPdfPageDimensions")) {
            if ((queryResult := this.QueryInterface(IPdfPageDimensions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPdfPageDimensions := IPdfPageDimensions(outPtr)
        }

        return this.__IPdfPageDimensions.get_ArtBox()
    }

;@endregion Instance Methods
}
