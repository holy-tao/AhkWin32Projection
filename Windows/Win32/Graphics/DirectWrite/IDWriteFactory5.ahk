#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDWriteInMemoryFontFileLoader.ahk" { IDWriteInMemoryFontFileLoader }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IDWriteFontFileStream.ahk" { IDWriteFontFileStream }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDWriteRemoteFontFileLoader.ahk" { IDWriteRemoteFontFileLoader }
#Import ".\IDWriteFontSetBuilder1.ahk" { IDWriteFontSetBuilder1 }
#Import ".\IDWriteFactory4.ahk" { IDWriteFactory4 }
#Import ".\DWRITE_CONTAINER_TYPE.ahk" { DWRITE_CONTAINER_TYPE }

/**
 * The root factory interface for all DirectWrite objects. (IDWriteFactory5)
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefactory5
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct IDWriteFactory5 extends IDWriteFactory4 {
    /**
     * The interface identifier for IDWriteFactory5
     * @type {Guid}
     */
    static IID := Guid("{958db99a-be2a-4f09-af7d-65189803d1d3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDWriteFactory5 interfaces
    */
    struct Vtbl extends IDWriteFactory4.Vtbl {
        CreateFontSetBuilder         : IntPtr
        CreateInMemoryFontFileLoader : IntPtr
        CreateHttpFontFileLoader     : IntPtr
        AnalyzeContainerType         : IntPtr
        UnpackFontFile               : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDWriteFactory5.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates an empty font set builder to add font face references and create a custom font set. (IDWriteFactory5.CreateFontSetBuilder)
     * @returns {IDWriteFontSetBuilder1} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefontsetbuilder1">IDWriteFontSetBuilder1</a>**</b>
     * 
     * Holds the newly created font set builder object, or NULL in case of failure.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefactory5-createfontsetbuilder
     */
    CreateFontSetBuilder() {
        result := ComCall(43, this, "ptr*", &fontSetBuilder := 0, "HRESULT")
        return IDWriteFontSetBuilder1(fontSetBuilder)
    }

    /**
     * Creates a loader object that can be used to create font file references to in-memory fonts. The caller is responsible for registering and unregistering the loader.
     * @returns {IDWriteInMemoryFontFileLoader} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwriteinmemoryfontfileloader">IDWriteInMemoryFontFileLoader</a>**</b>
     * 
     * Receives a pointer to the newly-created loader object.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefactory5-createinmemoryfontfileloader
     */
    CreateInMemoryFontFileLoader() {
        result := ComCall(44, this, "ptr*", &newLoader := 0, "HRESULT")
        return IDWriteInMemoryFontFileLoader(newLoader)
    }

    /**
     * Creates a remote font file loader that can create font file references from HTTP or HTTPS URLs. The caller is responsible for registering and unregistering the loader.
     * @param {PWSTR} referrerUrl Type: <b>wchar_t const*</b>
     * 
     * Optional referrer URL for HTTP requests.
     * @param {PWSTR} extraHeaders Type: <b>wchar_t const*</b>
     * 
     * Optional additional header fields to include in HTTP requests. Each header field consists of a name followed by a colon (":") and the field value, as specified by RFC 2616. Multiple header fields may be separated by newlines.
     * @returns {IDWriteRemoteFontFileLoader} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwriteremotefontfileloader">IDWriteRemoteFontFileLoader</a>**</b>
     * 
     * Receives a pointer to the newly-created loader object.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefactory5-createhttpfontfileloader
     */
    CreateHttpFontFileLoader(referrerUrl, extraHeaders) {
        referrerUrl := referrerUrl is String ? StrPtr(referrerUrl) : referrerUrl
        extraHeaders := extraHeaders is String ? StrPtr(extraHeaders) : extraHeaders

        result := ComCall(45, this, "ptr", referrerUrl, "ptr", extraHeaders, "ptr*", &newLoader := 0, "HRESULT")
        return IDWriteRemoteFontFileLoader(newLoader)
    }

    /**
     * The AnalyzeContainerType method analyzes the specified file data to determine whether it is a known font container format (e.g., WOFF or WOFF2).
     * @param {Integer} fileData Type: <b>void</b>
     * 
     * Pointer to the file data to analyze.
     * @param {Integer} fileDataSize Type: <b>UINT32</b>
     * 
     * Size of the buffer passed in fileData.
     * @returns {DWRITE_CONTAINER_TYPE} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/ne-dwrite_3-dwrite_container_type">DWRITE_CONTAINER_TYPE</a></b>
     * 
     * Returns the container type if recognized. DWRITE_CONTAINER_TYPE_UNKOWNN is returned for all other files, including uncompressed font files.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefactory5-analyzecontainertype
     */
    AnalyzeContainerType(fileData, fileDataSize) {
        result := ComCall(46, this, "ptr", fileData, "uint", fileDataSize, DWRITE_CONTAINER_TYPE)
        return result
    }

    /**
     * The UnpackFontFile method unpacks font data from a container file (WOFF or WOFF2) and returns the unpacked font data in the form of a font file stream.
     * @param {DWRITE_CONTAINER_TYPE} containerType Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/ne-dwrite_3-dwrite_container_type">DWRITE_CONTAINER_TYPE</a></b>
     * 
     * Container type returned by AnalyzeContainerType.
     * @param {Integer} fileData Type: <b>void</b>
     * 
     * Pointer to the compressed data.
     * @param {Integer} fileDataSize Type: <b>UINT32</b>
     * 
     * Size of the compressed data, in bytes.
     * @returns {IDWriteFontFileStream} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefontfilestream">IDWriteFontFileStream</a>**</b>
     * 
     * Receives a pointer to a newly created font file stream containing the uncompressed data.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefactory5-unpackfontfile
     */
    UnpackFontFile(containerType, fileData, fileDataSize) {
        result := ComCall(47, this, DWRITE_CONTAINER_TYPE, containerType, "ptr", fileData, "uint", fileDataSize, "ptr*", &unpackedFontStream := 0, "HRESULT")
        return IDWriteFontFileStream(unpackedFontStream)
    }

    Query(iid) {
        if (IDWriteFactory5.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateFontSetBuilder := CallbackCreate(GetMethod(implObj, "CreateFontSetBuilder"), flags, 2)
        this.vtbl.CreateInMemoryFontFileLoader := CallbackCreate(GetMethod(implObj, "CreateInMemoryFontFileLoader"), flags, 2)
        this.vtbl.CreateHttpFontFileLoader := CallbackCreate(GetMethod(implObj, "CreateHttpFontFileLoader"), flags, 4)
        this.vtbl.AnalyzeContainerType := CallbackCreate(GetMethod(implObj, "AnalyzeContainerType"), flags, 3)
        this.vtbl.UnpackFontFile := CallbackCreate(GetMethod(implObj, "UnpackFontFile"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateFontSetBuilder)
        CallbackFree(this.vtbl.CreateInMemoryFontFileLoader)
        CallbackFree(this.vtbl.CreateHttpFontFileLoader)
        CallbackFree(this.vtbl.AnalyzeContainerType)
        CallbackFree(this.vtbl.UnpackFontFile)
    }
}
