#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDWriteFontFace3.ahk" { IDWriteFontFace3 }
#Import ".\IDWriteFontFile.ahk" { IDWriteFontFile }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\DWRITE_LOCALITY.ahk" { DWRITE_LOCALITY }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\DWRITE_FONT_SIMULATIONS.ahk" { DWRITE_FONT_SIMULATIONS }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }

/**
 * Represents a reference to a font face.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefontfacereference
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct IDWriteFontFaceReference extends IUnknown {
    /**
     * The interface identifier for IDWriteFontFaceReference
     * @type {Guid}
     */
    static IID := Guid("{5e7fa7ca-dde3-424c-89f0-9fcd6fed58cd}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDWriteFontFaceReference interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateFontFace                     : IntPtr
        CreateFontFaceWithSimulations      : IntPtr
        Equals                             : IntPtr
        GetFontFaceIndex                   : IntPtr
        GetSimulations                     : IntPtr
        GetFontFile                        : IntPtr
        GetLocalFileSize                   : IntPtr
        GetFileSize                        : IntPtr
        GetFileTime                        : IntPtr
        GetLocality                        : IntPtr
        EnqueueFontDownloadRequest         : IntPtr
        EnqueueCharacterDownloadRequest    : IntPtr
        EnqueueGlyphDownloadRequest        : IntPtr
        EnqueueFileFragmentDownloadRequest : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDWriteFontFaceReference.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates a font face from the reference for use with layout, shaping, or rendering.
     * @remarks
     * This function can fail with DWRITE_E_REMOTEFONT if the font is not local.
     * @returns {IDWriteFontFace3} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefontface3">IDWriteFontFace3</a>**</b>
     * 
     * Newly created font face object, or nullptr in the case of failure.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontfacereference-createfontface
     */
    CreateFontFace() {
        result := ComCall(3, this, "ptr*", &fontFace := 0, "HRESULT")
        return IDWriteFontFace3(fontFace)
    }

    /**
     * Creates a font face with alternate font simulations, for example, to explicitly simulate a bold font face out of a regular variant.
     * @remarks
     * This function can fail with DWRITE_E_REMOTEFONT if the font is not local.
     * @param {DWRITE_FONT_SIMULATIONS} fontFaceSimulationFlags Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_font_simulations">DWRITE_FONT_SIMULATIONS</a></b>
     * 
     * Font face simulation flags for algorithmic emboldening and italicization.
     * @returns {IDWriteFontFace3} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefontface3">IDWriteFontFace3</a>**</b>
     * 
     * Newly created font face object, or nullptr in the case of failure.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontfacereference-createfontfacewithsimulations
     */
    CreateFontFaceWithSimulations(fontFaceSimulationFlags) {
        result := ComCall(4, this, DWRITE_FONT_SIMULATIONS, fontFaceSimulationFlags, "ptr*", &fontFace := 0, "HRESULT")
        return IDWriteFontFace3(fontFace)
    }

    /**
     * 
     * @param {IDWriteFontFaceReference} fontFaceReference 
     * @returns {BOOL} 
     */
    Equals(fontFaceReference) {
        result := ComCall(5, this, "ptr", fontFaceReference, BOOL)
        return result
    }

    /**
     * Obtains the zero-based index of the font face in its font file or files. If the font files contain a single face, the return value is zero.
     * @returns {Integer} Type: <b>UINT32</b>
     * 
     *  the zero-based index of the font face in its font file or files. If the font files contain a single face,  
     *      the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontfacereference-getfontfaceindex
     */
    GetFontFaceIndex() {
        result := ComCall(6, this, UInt32)
        return result
    }

    /**
     * Obtains the algorithmic style simulation flags of a font face. (IDWriteFontFaceReference.GetSimulations)
     * @returns {DWRITE_FONT_SIMULATIONS} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_font_simulations">DWRITE_FONT_SIMULATIONS</a></b>
     * 
     * Returns the algorithmic style simulation flags of a font face.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontfacereference-getsimulations
     */
    GetSimulations() {
        result := ComCall(7, this, DWRITE_FONT_SIMULATIONS)
        return result
    }

    /**
     * Obtains the font file representing a font face.
     * @returns {IDWriteFontFile} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefontfile">IDWriteFontFile</a>**</b>
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontfacereference-getfontfile
     */
    GetFontFile() {
        result := ComCall(8, this, "ptr*", &fontFile := 0, "HRESULT")
        return IDWriteFontFile(fontFile)
    }

    /**
     * Get the local size of the font face in bytes, which will always be less than or equal to GetFullSize. If the locality is remote, this value is zero. If full, this value will equal GetFileSize.
     * @returns {Integer} Type: <b>UINT64</b>
     * 
     * the local size of the font face in bytes, which will always be   
     *      less than or equal to GetFullSize. If the locality is remote, this     
     *      value is zero. If full, this value will equal <a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontfacereference-getfilesize">GetFileSize</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontfacereference-getlocalfilesize
     */
    GetLocalFileSize() {
        result := ComCall(9, this, Int64)
        return result
    }

    /**
     * Get the total size of the font face in bytes.
     * @returns {Integer} Type: <b>UINT64</b>
     * 
     * Returns the total size of the font face in bytes. If the locality is remote, this value is unknown and will be zero.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontfacereference-getfilesize
     */
    GetFileSize() {
        result := ComCall(10, this, Int64)
        return result
    }

    /**
     * Get the last modified date.
     * @returns {FILETIME} Type: <b>FILETIME*</b>
     * 
     * Returns the last modified date. The time may be zero if the font file loader does not expose file time.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontfacereference-getfiletime
     */
    GetFileTime() {
        lastWriteTime := FILETIME()
        result := ComCall(11, this, FILETIME.Ptr, lastWriteTime, "HRESULT")
        return lastWriteTime
    }

    /**
     * Get the locality of this font face reference.
     * @remarks
     * You can always successfully  
     *      create a font face from a fully local font. Attempting to create a font     
     *      face on a remote or partially local font may fail with DWRITE_E_REMOTEFONT.    
     *      This function may change between calls depending on background downloads    
     *      and whether cached data expires.
     * @returns {DWRITE_LOCALITY} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/ne-dwrite_3-dwrite_locality">DWRITE_LOCALITY</a></b>
     * 
     * Returns the locality of this font face reference.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontfacereference-getlocality
     */
    GetLocality() {
        result := ComCall(12, this, DWRITE_LOCALITY)
        return result
    }

    /**
     * Adds a request to the font download queue (IDWriteFontDownloadQueue). (IDWriteFontFaceReference.EnqueueFontDownloadRequest)
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontfacereference-enqueuefontdownloadrequest
     */
    EnqueueFontDownloadRequest() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * Adds a request to the font download queue (IDWriteFontDownloadQueue). (IDWriteFontFaceReference.EnqueueCharacterDownloadRequest)
     * @remarks
     * Downloading a character involves downloading every glyph it depends on directly or indirectly, via font tables (cmap, GSUB, COLR, glyf).
     * @param {PWSTR} characters Type: <b>const WCHAR*</b>
     * 
     * Array of characters to download.
     * @param {Integer} characterCount Type: <b>UINT32</b>
     * 
     * The number of elements in the character array.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontfacereference-enqueuecharacterdownloadrequest
     */
    EnqueueCharacterDownloadRequest(characters, characterCount) {
        characters := characters is String ? StrPtr(characters) : characters

        result := ComCall(14, this, "ptr", characters, "uint", characterCount, "HRESULT")
        return result
    }

    /**
     * Adds a request to the font download queue (IDWriteFontDownloadQueue). (IDWriteFontFaceReference.EnqueueGlyphDownloadRequest)
     * @remarks
     * Downloading a glyph involves downloading any other glyphs it depends on from the font tables (GSUB, COLR, glyf).
     * @param {Pointer<Integer>} glyphIndices Type: <b>const UINT16*</b>
     * 
     * Array of glyph indices to download.
     * @param {Integer} glyphCount Type: <b>UINT32</b>
     * 
     * The number of elements in the glyph index array.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontfacereference-enqueueglyphdownloadrequest
     */
    EnqueueGlyphDownloadRequest(glyphIndices, glyphCount) {
        glyphIndicesMarshal := glyphIndices is VarRef ? "ushort*" : "ptr"

        result := ComCall(15, this, glyphIndicesMarshal, glyphIndices, "uint", glyphCount, "HRESULT")
        return result
    }

    /**
     * Adds a request to the font download queue (IDWriteFontDownloadQueue). (IDWriteFontFaceReference.EnqueueFileFragmentDownloadRequest)
     * @param {Integer} fileOffset Type: <b>UINT64</b>
     * 
     * Offset of the fragment from the beginning of the font file.
     * @param {Integer} fragmentSize Type: <b>UINT64</b>
     * 
     * Size of the fragment in bytes.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontfacereference-enqueuefilefragmentdownloadrequest
     */
    EnqueueFileFragmentDownloadRequest(fileOffset, fragmentSize) {
        result := ComCall(16, this, "uint", fileOffset, "uint", fragmentSize, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDWriteFontFaceReference.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateFontFace := CallbackCreate(GetMethod(implObj, "CreateFontFace"), flags, 2)
        this.vtbl.CreateFontFaceWithSimulations := CallbackCreate(GetMethod(implObj, "CreateFontFaceWithSimulations"), flags, 3)
        this.vtbl.Equals := CallbackCreate(GetMethod(implObj, "Equals"), flags, 2)
        this.vtbl.GetFontFaceIndex := CallbackCreate(GetMethod(implObj, "GetFontFaceIndex"), flags, 1)
        this.vtbl.GetSimulations := CallbackCreate(GetMethod(implObj, "GetSimulations"), flags, 1)
        this.vtbl.GetFontFile := CallbackCreate(GetMethod(implObj, "GetFontFile"), flags, 2)
        this.vtbl.GetLocalFileSize := CallbackCreate(GetMethod(implObj, "GetLocalFileSize"), flags, 1)
        this.vtbl.GetFileSize := CallbackCreate(GetMethod(implObj, "GetFileSize"), flags, 1)
        this.vtbl.GetFileTime := CallbackCreate(GetMethod(implObj, "GetFileTime"), flags, 2)
        this.vtbl.GetLocality := CallbackCreate(GetMethod(implObj, "GetLocality"), flags, 1)
        this.vtbl.EnqueueFontDownloadRequest := CallbackCreate(GetMethod(implObj, "EnqueueFontDownloadRequest"), flags, 1)
        this.vtbl.EnqueueCharacterDownloadRequest := CallbackCreate(GetMethod(implObj, "EnqueueCharacterDownloadRequest"), flags, 3)
        this.vtbl.EnqueueGlyphDownloadRequest := CallbackCreate(GetMethod(implObj, "EnqueueGlyphDownloadRequest"), flags, 3)
        this.vtbl.EnqueueFileFragmentDownloadRequest := CallbackCreate(GetMethod(implObj, "EnqueueFileFragmentDownloadRequest"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateFontFace)
        CallbackFree(this.vtbl.CreateFontFaceWithSimulations)
        CallbackFree(this.vtbl.Equals)
        CallbackFree(this.vtbl.GetFontFaceIndex)
        CallbackFree(this.vtbl.GetSimulations)
        CallbackFree(this.vtbl.GetFontFile)
        CallbackFree(this.vtbl.GetLocalFileSize)
        CallbackFree(this.vtbl.GetFileSize)
        CallbackFree(this.vtbl.GetFileTime)
        CallbackFree(this.vtbl.GetLocality)
        CallbackFree(this.vtbl.EnqueueFontDownloadRequest)
        CallbackFree(this.vtbl.EnqueueCharacterDownloadRequest)
        CallbackFree(this.vtbl.EnqueueGlyphDownloadRequest)
        CallbackFree(this.vtbl.EnqueueFileFragmentDownloadRequest)
    }
}
