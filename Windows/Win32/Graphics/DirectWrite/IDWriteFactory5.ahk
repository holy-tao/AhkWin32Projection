#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<IDWriteFontSetBuilder1>} fontSetBuilder 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefactory5-createfontsetbuilder
     */
    CreateFontSetBuilder(fontSetBuilder) {
        result := ComCall(43, this, "ptr*", fontSetBuilder, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDWriteInMemoryFontFileLoader>} newLoader 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefactory5-createinmemoryfontfileloader
     */
    CreateInMemoryFontFileLoader(newLoader) {
        result := ComCall(44, this, "ptr*", newLoader, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} referrerUrl 
     * @param {PWSTR} extraHeaders 
     * @param {Pointer<IDWriteRemoteFontFileLoader>} newLoader 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefactory5-createhttpfontfileloader
     */
    CreateHttpFontFileLoader(referrerUrl, extraHeaders, newLoader) {
        referrerUrl := referrerUrl is String ? StrPtr(referrerUrl) : referrerUrl
        extraHeaders := extraHeaders is String ? StrPtr(extraHeaders) : extraHeaders

        result := ComCall(45, this, "ptr", referrerUrl, "ptr", extraHeaders, "ptr*", newLoader, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} fileData 
     * @param {Integer} fileDataSize 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefactory5-analyzecontainertype
     */
    AnalyzeContainerType(fileData, fileDataSize) {
        result := ComCall(46, this, "ptr", fileData, "uint", fileDataSize, "int")
        return result
    }

    /**
     * 
     * @param {Integer} containerType 
     * @param {Pointer} fileData 
     * @param {Integer} fileDataSize 
     * @param {Pointer<IDWriteFontFileStream>} unpackedFontStream 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefactory5-unpackfontfile
     */
    UnpackFontFile(containerType, fileData, fileDataSize, unpackedFontStream) {
        result := ComCall(47, this, "int", containerType, "ptr", fileData, "uint", fileDataSize, "ptr*", unpackedFontStream, "HRESULT")
        return result
    }
}
