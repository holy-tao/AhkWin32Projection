#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteFontFileLoader.ahk

/**
 * Represents a font file loader that can access remote (i.e., downloadable) fonts.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nn-dwrite_3-idwriteremotefontfileloader
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteRemoteFontFileLoader extends IDWriteFontFileLoader{
    /**
     * The interface identifier for IDWriteRemoteFontFileLoader
     * @type {Guid}
     */
    static IID => Guid("{68648c83-6ede-46c0-ab46-20083a887fde}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * 
     * @param {Pointer} fontFileReferenceKey 
     * @param {Integer} fontFileReferenceKeySize 
     * @param {Pointer<IDWriteRemoteFontFileStream>} fontFileStream 
     * @returns {HRESULT} 
     */
    CreateRemoteStreamFromKey(fontFileReferenceKey, fontFileReferenceKeySize, fontFileStream) {
        result := ComCall(4, this, "ptr", fontFileReferenceKey, "uint", fontFileReferenceKeySize, "ptr", fontFileStream, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} fontFileReferenceKey 
     * @param {Integer} fontFileReferenceKeySize 
     * @param {Pointer<Int32>} locality 
     * @returns {HRESULT} 
     */
    GetLocalityFromKey(fontFileReferenceKey, fontFileReferenceKeySize, locality) {
        result := ComCall(5, this, "ptr", fontFileReferenceKey, "uint", fontFileReferenceKeySize, "int*", locality, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDWriteFactory>} factory 
     * @param {PWSTR} baseUrl 
     * @param {PWSTR} fontFileUrl 
     * @param {Pointer<IDWriteFontFile>} fontFile 
     * @returns {HRESULT} 
     */
    CreateFontFileReferenceFromUrl(factory, baseUrl, fontFileUrl, fontFile) {
        baseUrl := baseUrl is String ? StrPtr(baseUrl) : baseUrl
        fontFileUrl := fontFileUrl is String ? StrPtr(fontFileUrl) : fontFileUrl

        result := ComCall(6, this, "ptr", factory, "ptr", baseUrl, "ptr", fontFileUrl, "ptr", fontFile, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
