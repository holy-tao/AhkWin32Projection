#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteRemoteFontFileStream.ahk
#Include .\IDWriteFontFile.ahk
#Include .\IDWriteFontFileLoader.ahk

/**
 * Represents a font file loader that can access remote (i.e., downloadable) fonts.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nn-dwrite_3-idwriteremotefontfileloader
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteRemoteFontFileLoader extends IDWriteFontFileLoader{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateRemoteStreamFromKey", "GetLocalityFromKey", "CreateFontFileReferenceFromUrl"]

    /**
     * 
     * @param {Pointer} fontFileReferenceKey 
     * @param {Integer} fontFileReferenceKeySize 
     * @returns {IDWriteRemoteFontFileStream} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwriteremotefontfileloader-createremotestreamfromkey
     */
    CreateRemoteStreamFromKey(fontFileReferenceKey, fontFileReferenceKeySize) {
        result := ComCall(4, this, "ptr", fontFileReferenceKey, "uint", fontFileReferenceKeySize, "ptr*", &fontFileStream := 0, "HRESULT")
        return IDWriteRemoteFontFileStream(fontFileStream)
    }

    /**
     * 
     * @param {Pointer} fontFileReferenceKey 
     * @param {Integer} fontFileReferenceKeySize 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwriteremotefontfileloader-getlocalityfromkey
     */
    GetLocalityFromKey(fontFileReferenceKey, fontFileReferenceKeySize) {
        result := ComCall(5, this, "ptr", fontFileReferenceKey, "uint", fontFileReferenceKeySize, "int*", &locality := 0, "HRESULT")
        return locality
    }

    /**
     * 
     * @param {IDWriteFactory} factory 
     * @param {PWSTR} baseUrl 
     * @param {PWSTR} fontFileUrl 
     * @returns {IDWriteFontFile} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwriteremotefontfileloader-createfontfilereferencefromurl
     */
    CreateFontFileReferenceFromUrl(factory, baseUrl, fontFileUrl) {
        baseUrl := baseUrl is String ? StrPtr(baseUrl) : baseUrl
        fontFileUrl := fontFileUrl is String ? StrPtr(fontFileUrl) : fontFileUrl

        result := ComCall(6, this, "ptr", factory, "ptr", baseUrl, "ptr", fontFileUrl, "ptr*", &fontFile := 0, "HRESULT")
        return IDWriteFontFile(fontFile)
    }
}
