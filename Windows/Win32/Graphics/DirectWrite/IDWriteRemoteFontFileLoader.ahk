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
     * Creates a remote font file stream object that encapsulates an open file resource and can be used to download remote file data.
     * @param {Pointer} fontFileReferenceKey Type: <b>void</b>
     * 
     * Font file reference key that uniquely identifies the font file resource within the scope of the font loader being used.
     * @param {Integer} fontFileReferenceKeySize Type: <b>UINT32</b>
     * 
     * Size of font file reference key in bytes.
     * @returns {IDWriteRemoteFontFileStream} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwriteremotefontfilestream">IDWriteRemoteFontFileStream</a>**</b>
     * 
     * Pointer to the newly created font file stream.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nf-dwrite_3-idwriteremotefontfileloader-createremotestreamfromkey
     */
    CreateRemoteStreamFromKey(fontFileReferenceKey, fontFileReferenceKeySize) {
        result := ComCall(4, this, "ptr", fontFileReferenceKey, "uint", fontFileReferenceKeySize, "ptr*", &fontFileStream := 0, "HRESULT")
        return IDWriteRemoteFontFileStream(fontFileStream)
    }

    /**
     * Gets the locality of the file resource identified by the unique key.
     * @param {Pointer} fontFileReferenceKey Type: <b>void</b>
     * 
     * Font file reference key that uniquely identifies the font file resource within the scope of the font loader being used.
     * @param {Integer} fontFileReferenceKeySize Type: <b>UINT32</b>
     * 
     * Size of font file reference key in bytes.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/ne-dwrite_3-dwrite_locality">DWRITE_LOCALITY</a>*</b>
     * 
     * Locality of the file.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nf-dwrite_3-idwriteremotefontfileloader-getlocalityfromkey
     */
    GetLocalityFromKey(fontFileReferenceKey, fontFileReferenceKeySize) {
        result := ComCall(5, this, "ptr", fontFileReferenceKey, "uint", fontFileReferenceKeySize, "int*", &locality := 0, "HRESULT")
        return locality
    }

    /**
     * Creates a font file reference from a URL if the loader supports this capability.
     * @param {IDWriteFactory} factory Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefactory">IDWriteFactory</a>*</b>
     * 
     * Factory used to create the font file reference.
     * @param {PWSTR} baseUrl Type: <b>WCHAR</b>
     * 
     * Optional base URL. The base URL is used to resolve the fontFileUrl if it is relative. For example, the baseUrl might be the URL of the referring document
     *           that contained the fontFileUrl.
     * @param {PWSTR} fontFileUrl Type: <b>WCHAR</b>
     * 
     * URL of the font resource.
     * @returns {IDWriteFontFile} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefontfile">IDWriteFontFile</a>**</b>
     * 
     * Receives a pointer to the newly created font file reference.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nf-dwrite_3-idwriteremotefontfileloader-createfontfilereferencefromurl
     */
    CreateFontFileReferenceFromUrl(factory, baseUrl, fontFileUrl) {
        baseUrl := baseUrl is String ? StrPtr(baseUrl) : baseUrl
        fontFileUrl := fontFileUrl is String ? StrPtr(fontFileUrl) : fontFileUrl

        result := ComCall(6, this, "ptr", factory, "ptr", baseUrl, "ptr", fontFileUrl, "ptr*", &fontFile := 0, "HRESULT")
        return IDWriteFontFile(fontFile)
    }
}
