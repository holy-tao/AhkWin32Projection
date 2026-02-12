#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPdfPage.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a single page in a Portable Document Format (PDF) document.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.data.pdf.pdfpage
 * @namespace Windows.Data.Pdf
 * @version WindowsRuntime 1.4
 */
class PdfPage extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPdfPage

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPdfPage.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the relative position of the Portable Document Format (PDF) page within its parent Portable Document Format (PDF) document.
     * @remarks
     * The first page of a Portable Document Format (PDF) document is index 0 (zero).
     * @see https://learn.microsoft.com/uwp/api/windows.data.pdf.pdfpage.index
     * @type {Integer} 
     */
    Index {
        get => this.get_Index()
    }

    /**
     * Gets the Portable Document Format (PDF) page's size in device-independent pixels (DIPs) based on its related [CropBox](pdfpagedimensions_cropbox.md), [MediaBox](pdfpagedimensions_mediabox.md), and [Rotation](pdfpage_rotation.md) property values.
     * @see https://learn.microsoft.com/uwp/api/windows.data.pdf.pdfpage.size
     * @type {SIZE} 
     */
    Size {
        get => this.get_Size()
    }

    /**
     * Gets the group of dimension properties for a single page in a Portable Document Format (PDF) document.
     * @see https://learn.microsoft.com/uwp/api/windows.data.pdf.pdfpage.dimensions
     * @type {PdfPageDimensions} 
     */
    Dimensions {
        get => this.get_Dimensions()
    }

    /**
     * Gets the number of degrees that the Portable Document Format (PDF) page will be rotated when it's displayed or printed.
     * @remarks
     * Degrees are expressed relative to a clockwise rotation. Degrees are expressed in multiples of 90.
     * @see https://learn.microsoft.com/uwp/api/windows.data.pdf.pdfpage.rotation
     * @type {Integer} 
     */
    Rotation {
        get => this.get_Rotation()
    }

    /**
     * Gets the Portable Document Format (PDF) page's preferred magnification factor.
     * @see https://learn.microsoft.com/uwp/api/windows.data.pdf.pdfpage.preferredzoom
     * @type {Float} 
     */
    PreferredZoom {
        get => this.get_PreferredZoom()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        this.Close()

        super.__Delete()
    }

    /**
     * Takes a set of display settings, applies them to the output of a Portable Document Format (PDF) page's contents, and creates a stream with the customized, rendered output as an asynchronous action. This asynchronous action can be used to create a customized display image of the Portable Document Format (PDF) page.
     * @param {IRandomAccessStream} outputStream The stream of data, which represents a Portable Document Format (PDF) page's contents.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.pdf.pdfpage.rendertostreamasync
     */
    RenderToStreamAsync(outputStream) {
        if (!this.HasProp("__IPdfPage")) {
            if ((queryResult := this.QueryInterface(IPdfPage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPdfPage := IPdfPage(outPtr)
        }

        return this.__IPdfPage.RenderToStreamAsync(outputStream)
    }

    /**
     * Outputs a stream of data, which represents a Portable Document Format (PDF) page's contents, as an asynchronous action. This asynchronous action can be used to create an image of the Portable Document Format (PDF) page.
     * @param {IRandomAccessStream} outputStream The stream of data, which represents a Portable Document Format (PDF) page's content.
     * @param {PdfPageRenderOptions} options 
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.pdf.pdfpage.rendertostreamasync
     */
    RenderWithOptionsToStreamAsync(outputStream, options) {
        if (!this.HasProp("__IPdfPage")) {
            if ((queryResult := this.QueryInterface(IPdfPage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPdfPage := IPdfPage(outPtr)
        }

        return this.__IPdfPage.RenderWithOptionsToStreamAsync(outputStream, options)
    }

    /**
     * Begins building the Portable Document Format (PDF) page. After this method finishes, the Portable Document Format (PDF) page is completely built.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.pdf.pdfpage.preparepageasync
     */
    PreparePageAsync() {
        if (!this.HasProp("__IPdfPage")) {
            if ((queryResult := this.QueryInterface(IPdfPage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPdfPage := IPdfPage(outPtr)
        }

        return this.__IPdfPage.PreparePageAsync()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Index() {
        if (!this.HasProp("__IPdfPage")) {
            if ((queryResult := this.QueryInterface(IPdfPage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPdfPage := IPdfPage(outPtr)
        }

        return this.__IPdfPage.get_Index()
    }

    /**
     * 
     * @returns {SIZE} 
     */
    get_Size() {
        if (!this.HasProp("__IPdfPage")) {
            if ((queryResult := this.QueryInterface(IPdfPage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPdfPage := IPdfPage(outPtr)
        }

        return this.__IPdfPage.get_Size()
    }

    /**
     * 
     * @returns {PdfPageDimensions} 
     */
    get_Dimensions() {
        if (!this.HasProp("__IPdfPage")) {
            if ((queryResult := this.QueryInterface(IPdfPage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPdfPage := IPdfPage(outPtr)
        }

        return this.__IPdfPage.get_Dimensions()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Rotation() {
        if (!this.HasProp("__IPdfPage")) {
            if ((queryResult := this.QueryInterface(IPdfPage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPdfPage := IPdfPage(outPtr)
        }

        return this.__IPdfPage.get_Rotation()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_PreferredZoom() {
        if (!this.HasProp("__IPdfPage")) {
            if ((queryResult := this.QueryInterface(IPdfPage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPdfPage := IPdfPage(outPtr)
        }

        return this.__IPdfPage.get_PreferredZoom()
    }

    /**
     * Releases all resources associated with the Portable Document Format (PDF) page.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.pdf.pdfpage.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

;@endregion Instance Methods
}
