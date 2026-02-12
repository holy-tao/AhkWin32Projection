#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPdfDocument.ahk
#Include .\IPdfDocumentStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a Portable Document Format (PDF) document.
 * @remarks
 * Methods of this class return an **STG_E_READFAULT** error if there is a problem in reading the Portable Document Format (PDF) document.
 * @see https://learn.microsoft.com/uwp/api/windows.data.pdf.pdfdocument
 * @namespace Windows.Data.Pdf
 * @version WindowsRuntime 1.4
 */
class PdfDocument extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPdfDocument

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPdfDocument.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Outputs an asynchronous operation. When the operation completes, a [PdfDocument](pdfdocument.md) object is returned, which represents a Portable Document Format (PDF) document. Use this method if the Portable Document Format (PDF) document is password-protected.
     * @remarks
     * If the Portable Document Format (PDF) document does not require a password, this method ignores it.
     * 
     * This method returns an **ERROR_WRONG_PASSWORD** error if the wrong password is specified.
     * @param {IStorageFile} file_ The file, which represents a Portable Document Format (PDF) document.
     * @returns {IAsyncOperation<PdfDocument>} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.pdf.pdfdocument.loadfromfileasync
     */
    static LoadFromFileAsync(file_) {
        if (!PdfDocument.HasProp("__IPdfDocumentStatics")) {
            activatableClassId := HSTRING.Create("Windows.Data.Pdf.PdfDocument")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPdfDocumentStatics.IID)
            PdfDocument.__IPdfDocumentStatics := IPdfDocumentStatics(factoryPtr)
        }

        return PdfDocument.__IPdfDocumentStatics.LoadFromFileAsync(file_)
    }

    /**
     * Outputs an asynchronous operation. When the operation completes, a [PdfDocument](pdfdocument.md) object is returned, which represents a Portable Document Format (PDF) document.
     * @param {IStorageFile} file_ The file, which represents a Portable Document Format (PDF) document.
     * @param {HSTRING} password 
     * @returns {IAsyncOperation<PdfDocument>} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.pdf.pdfdocument.loadfromfileasync
     */
    static LoadFromFileWithPasswordAsync(file_, password) {
        if (!PdfDocument.HasProp("__IPdfDocumentStatics")) {
            activatableClassId := HSTRING.Create("Windows.Data.Pdf.PdfDocument")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPdfDocumentStatics.IID)
            PdfDocument.__IPdfDocumentStatics := IPdfDocumentStatics(factoryPtr)
        }

        return PdfDocument.__IPdfDocumentStatics.LoadFromFileWithPasswordAsync(file_, password)
    }

    /**
     * Creates a [PdfDocument](pdfdocument.md) object, representing a Portable Document Format (PDF) document, from a stream of data that represents a Portable Document Format (PDF) document in the file system. Use this method if the Portable Document Format (PDF) document is password-protected.
     * @remarks
     * If the Portable Document Format (PDF) document does not require a password, this method ignores it.
     * 
     * This method returns an **ERROR_WRONG_PASSWORD** error if the wrong password is specified.
     * @param {IRandomAccessStream} inputStream The stream of data, which represents a Portable Document Format (PDF) document.
     * @returns {IAsyncOperation<PdfDocument>} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.pdf.pdfdocument.loadfromstreamasync
     */
    static LoadFromStreamAsync(inputStream) {
        if (!PdfDocument.HasProp("__IPdfDocumentStatics")) {
            activatableClassId := HSTRING.Create("Windows.Data.Pdf.PdfDocument")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPdfDocumentStatics.IID)
            PdfDocument.__IPdfDocumentStatics := IPdfDocumentStatics(factoryPtr)
        }

        return PdfDocument.__IPdfDocumentStatics.LoadFromStreamAsync(inputStream)
    }

    /**
     * Creates a [PdfDocument](pdfdocument.md) object, representing a Portable Document Format (PDF) document, from a stream of data that represents a Portable Document Format (PDF) document in the file system.
     * @param {IRandomAccessStream} inputStream The stream of data, which represents a Portable Document Format (PDF) document.
     * @param {HSTRING} password 
     * @returns {IAsyncOperation<PdfDocument>} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.pdf.pdfdocument.loadfromstreamasync
     */
    static LoadFromStreamWithPasswordAsync(inputStream, password) {
        if (!PdfDocument.HasProp("__IPdfDocumentStatics")) {
            activatableClassId := HSTRING.Create("Windows.Data.Pdf.PdfDocument")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPdfDocumentStatics.IID)
            PdfDocument.__IPdfDocumentStatics := IPdfDocumentStatics(factoryPtr)
        }

        return PdfDocument.__IPdfDocumentStatics.LoadFromStreamWithPasswordAsync(inputStream, password)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the number of pages in the Portable Document Format (PDF) document.
     * @see https://learn.microsoft.com/uwp/api/windows.data.pdf.pdfdocument.pagecount
     * @type {Integer} 
     */
    PageCount {
        get => this.get_PageCount()
    }

    /**
     * Gets whether the Portable Document Format (PDF) document is password-protected.
     * @see https://learn.microsoft.com/uwp/api/windows.data.pdf.pdfdocument.ispasswordprotected
     * @type {Boolean} 
     */
    IsPasswordProtected {
        get => this.get_IsPasswordProtected()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Gets a page from a Portable Document Format (PDF) document.
     * @remarks
     * The first page of a Portable Document Format (PDF) document is 0 (zero).
     * @param {Integer} pageIndex The location of the Portable Document Format (PDF) page relative to its parent document.
     * @returns {PdfPage} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.pdf.pdfdocument.getpage
     */
    GetPage(pageIndex) {
        if (!this.HasProp("__IPdfDocument")) {
            if ((queryResult := this.QueryInterface(IPdfDocument.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPdfDocument := IPdfDocument(outPtr)
        }

        return this.__IPdfDocument.GetPage(pageIndex)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PageCount() {
        if (!this.HasProp("__IPdfDocument")) {
            if ((queryResult := this.QueryInterface(IPdfDocument.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPdfDocument := IPdfDocument(outPtr)
        }

        return this.__IPdfDocument.get_PageCount()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPasswordProtected() {
        if (!this.HasProp("__IPdfDocument")) {
            if ((queryResult := this.QueryInterface(IPdfDocument.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPdfDocument := IPdfDocument(outPtr)
        }

        return this.__IPdfDocument.get_IsPasswordProtected()
    }

;@endregion Instance Methods
}
