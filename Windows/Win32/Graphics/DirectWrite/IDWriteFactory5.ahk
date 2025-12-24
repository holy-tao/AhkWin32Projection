#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteFontSetBuilder1.ahk
#Include .\IDWriteInMemoryFontFileLoader.ahk
#Include .\IDWriteRemoteFontFileLoader.ahk
#Include .\IDWriteFontFileStream.ahk
#Include .\IDWriteFactory4.ahk

/**
 * The root factory interface for all DirectWrite objects.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nn-dwrite_3-idwritefactory5
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteFactory5 extends IDWriteFactory4{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteFactory5
     * @type {Guid}
     */
    static IID => Guid("{958db99a-be2a-4f09-af7d-65189803d1d3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 43

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateFontSetBuilder", "CreateInMemoryFontFileLoader", "CreateHttpFontFileLoader", "AnalyzeContainerType", "UnpackFontFile"]

    /**
     * Creates an empty font set builder to add font face references and create a custom font set.
     * @returns {IDWriteFontSetBuilder1} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefontsetbuilder1">IDWriteFontSetBuilder1</a>**</b>
     * 
     * Holds the newly created font set builder object, or NULL in case of failure.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nf-dwrite_3-idwritefactory5-createfontsetbuilder
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
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nf-dwrite_3-idwritefactory5-createinmemoryfontfileloader
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
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nf-dwrite_3-idwritefactory5-createhttpfontfileloader
     */
    CreateHttpFontFileLoader(referrerUrl, extraHeaders) {
        referrerUrl := referrerUrl is String ? StrPtr(referrerUrl) : referrerUrl
        extraHeaders := extraHeaders is String ? StrPtr(extraHeaders) : extraHeaders

        result := ComCall(45, this, "ptr", referrerUrl, "ptr", extraHeaders, "ptr*", &newLoader := 0, "HRESULT")
        return IDWriteRemoteFontFileLoader(newLoader)
    }

    /**
     * The AnalyzeContainerType method analyzes the specified file data to determine whether it is a known font container format (e.g., WOFF or WOFF2).
     * @param {Pointer} fileData Type: <b>void</b>
     * 
     * Pointer to the file data to analyze.
     * @param {Integer} fileDataSize Type: <b>UINT32</b>
     * 
     * Size of the buffer passed in fileData.
     * @returns {Integer} Type: <b><a href="/windows/win32/api/dwrite_3/ne-dwrite_3-dwrite_container_type">DWRITE_CONTAINER_TYPE</a></b>
     * 
     * Returns the container type if recognized. DWRITE_CONTAINER_TYPE_UNKOWNN is returned for all other files, including uncompressed font files.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nf-dwrite_3-idwritefactory5-analyzecontainertype
     */
    AnalyzeContainerType(fileData, fileDataSize) {
        result := ComCall(46, this, "ptr", fileData, "uint", fileDataSize, "int")
        return result
    }

    /**
     * The UnpackFontFile method unpacks font data from a container file (WOFF or WOFF2) and returns the unpacked font data in the form of a font file stream.
     * @param {Integer} containerType Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/ne-dwrite_3-dwrite_container_type">DWRITE_CONTAINER_TYPE</a></b>
     * 
     * Container type returned by AnalyzeContainerType.
     * @param {Pointer} fileData Type: <b>void</b>
     * 
     * Pointer to the compressed data.
     * @param {Integer} fileDataSize Type: <b>UINT32</b>
     * 
     * Size of the compressed data, in bytes.
     * @returns {IDWriteFontFileStream} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefontfilestream">IDWriteFontFileStream</a>**</b>
     * 
     * Receives a pointer to a newly created font file stream containing the uncompressed data.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nf-dwrite_3-idwritefactory5-unpackfontfile
     */
    UnpackFontFile(containerType, fileData, fileDataSize) {
        result := ComCall(47, this, "int", containerType, "ptr", fileData, "uint", fileDataSize, "ptr*", &unpackedFontStream := 0, "HRESULT")
        return IDWriteFontFileStream(unpackedFontStream)
    }
}
