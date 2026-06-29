#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IDWriteFontFileLoader.ahk" { IDWriteFontFileLoader }
#Import ".\IDWriteFactory.ahk" { IDWriteFactory }
#Import ".\IDWriteFontFile.ahk" { IDWriteFontFile }
#Import ".\DWRITE_LOCALITY.ahk" { DWRITE_LOCALITY }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDWriteRemoteFontFileStream.ahk" { IDWriteRemoteFontFileStream }

/**
 * Represents a font file loader that can access remote (i.e., downloadable) fonts.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwriteremotefontfileloader
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct IDWriteRemoteFontFileLoader extends IDWriteFontFileLoader {
    /**
     * The interface identifier for IDWriteRemoteFontFileLoader
     * @type {Guid}
     */
    static IID := Guid("{68648c83-6ede-46c0-ab46-20083a887fde}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDWriteRemoteFontFileLoader interfaces
    */
    struct Vtbl extends IDWriteFontFileLoader.Vtbl {
        CreateRemoteStreamFromKey      : IntPtr
        GetLocalityFromKey             : IntPtr
        CreateFontFileReferenceFromUrl : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDWriteRemoteFontFileLoader.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates a remote font file stream object that encapsulates an open file resource and can be used to download remote file data.
     * @remarks
     * Unlike <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefontfileloader-createstreamfromkey">CreateStreamFromKey</a>, this method can be used to create a stream for a remote file. 
     *         If the file is remote, the client must call <a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwriteremotefontfilestream-begindownload">IDWriteRemoteFontFileStream::BeginDownload</a> with an empty array 
     *         of file fragments before the stream can be used to get the file size or access data.
     * @param {Integer} fontFileReferenceKey Type: <b>void</b>
     * 
     * Font file reference key that uniquely identifies the font file resource within the scope of the font loader being used.
     * @param {Integer} fontFileReferenceKeySize Type: <b>UINT32</b>
     * 
     * Size of font file reference key in bytes.
     * @returns {IDWriteRemoteFontFileStream} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwriteremotefontfilestream">IDWriteRemoteFontFileStream</a>**</b>
     * 
     * Pointer to the newly created font file stream.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwriteremotefontfileloader-createremotestreamfromkey
     */
    CreateRemoteStreamFromKey(fontFileReferenceKey, fontFileReferenceKeySize) {
        result := ComCall(4, this, "ptr", fontFileReferenceKey, "uint", fontFileReferenceKeySize, "ptr*", &fontFileStream := 0, "HRESULT")
        return IDWriteRemoteFontFileStream(fontFileStream)
    }

    /**
     * Gets the locality of the file resource identified by the unique key.
     * @param {Integer} fontFileReferenceKey Type: <b>void</b>
     * 
     * Font file reference key that uniquely identifies the font file resource within the scope of the font loader being used.
     * @param {Integer} fontFileReferenceKeySize Type: <b>UINT32</b>
     * 
     * Size of font file reference key in bytes.
     * @returns {DWRITE_LOCALITY} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/ne-dwrite_3-dwrite_locality">DWRITE_LOCALITY</a>*</b>
     * 
     * Locality of the file.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwriteremotefontfileloader-getlocalityfromkey
     */
    GetLocalityFromKey(fontFileReferenceKey, fontFileReferenceKeySize) {
        result := ComCall(5, this, "ptr", fontFileReferenceKey, "uint", fontFileReferenceKeySize, "int*", &locality := 0, "HRESULT")
        return locality
    }

    /**
     * Creates a font file reference from a URL if the loader supports this capability.
     * @remarks
     * If baseUrl is a non-empty string, then baseUrl concatenated with fontFileUrl should form a valid URL, DirectWrite will not supply any additional delimiter.
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
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwriteremotefontfileloader-createfontfilereferencefromurl
     */
    CreateFontFileReferenceFromUrl(factory, baseUrl, fontFileUrl) {
        baseUrl := baseUrl is String ? StrPtr(baseUrl) : baseUrl
        fontFileUrl := fontFileUrl is String ? StrPtr(fontFileUrl) : fontFileUrl

        result := ComCall(6, this, "ptr", factory, "ptr", baseUrl, "ptr", fontFileUrl, "ptr*", &fontFile := 0, "HRESULT")
        return IDWriteFontFile(fontFile)
    }

    Query(iid) {
        if (IDWriteRemoteFontFileLoader.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateRemoteStreamFromKey := CallbackCreate(GetMethod(implObj, "CreateRemoteStreamFromKey"), flags, 4)
        this.vtbl.GetLocalityFromKey := CallbackCreate(GetMethod(implObj, "GetLocalityFromKey"), flags, 4)
        this.vtbl.CreateFontFileReferenceFromUrl := CallbackCreate(GetMethod(implObj, "CreateFontFileReferenceFromUrl"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateRemoteStreamFromKey)
        CallbackFree(this.vtbl.GetLocalityFromKey)
        CallbackFree(this.vtbl.CreateFontFileReferenceFromUrl)
    }
}
