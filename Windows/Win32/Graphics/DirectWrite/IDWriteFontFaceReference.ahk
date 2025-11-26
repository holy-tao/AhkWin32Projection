#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteFontFace3.ahk
#Include .\IDWriteFontFile.ahk
#Include ..\..\Foundation\FILETIME.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a reference to a font face.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nn-dwrite_3-idwritefontfacereference
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteFontFaceReference extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteFontFaceReference
     * @type {Guid}
     */
    static IID => Guid("{5e7fa7ca-dde3-424c-89f0-9fcd6fed58cd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateFontFace", "CreateFontFaceWithSimulations", "Equals", "GetFontFaceIndex", "GetSimulations", "GetFontFile", "GetLocalFileSize", "GetFileSize", "GetFileTime", "GetLocality", "EnqueueFontDownloadRequest", "EnqueueCharacterDownloadRequest", "EnqueueGlyphDownloadRequest", "EnqueueFileFragmentDownloadRequest"]

    /**
     * Creates a font face from the reference for use with layout, shaping, or rendering.
     * @returns {IDWriteFontFace3} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefontface3">IDWriteFontFace3</a>**</b>
     * 
     * Newly created font face object, or nullptr in the case of failure.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nf-dwrite_3-idwritefontfacereference-createfontface
     */
    CreateFontFace() {
        result := ComCall(3, this, "ptr*", &fontFace := 0, "HRESULT")
        return IDWriteFontFace3(fontFace)
    }

    /**
     * Creates a font face with alternate font simulations, for example, to explicitly simulate a bold font face out of a regular variant.
     * @param {Integer} fontFaceSimulationFlags Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_font_simulations">DWRITE_FONT_SIMULATIONS</a></b>
     * 
     * Font face simulation flags for algorithmic emboldening and italicization.
     * @returns {IDWriteFontFace3} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefontface3">IDWriteFontFace3</a>**</b>
     * 
     * Newly created font face object, or nullptr in the case of failure.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nf-dwrite_3-idwritefontfacereference-createfontfacewithsimulations
     */
    CreateFontFaceWithSimulations(fontFaceSimulationFlags) {
        result := ComCall(4, this, "int", fontFaceSimulationFlags, "ptr*", &fontFace := 0, "HRESULT")
        return IDWriteFontFace3(fontFace)
    }

    /**
     * 
     * @param {IDWriteFontFaceReference} fontFaceReference 
     * @returns {BOOL} 
     */
    Equals(fontFaceReference) {
        result := ComCall(5, this, "ptr", fontFaceReference, "int")
        return result
    }

    /**
     * Obtains the zero-based index of the font face in its font file or files. If the font files contain a single face, the return value is zero.
     * @returns {Integer} Type: <b>UINT32</b>
     * 
     *  the zero-based index of the font face in its font file or files. If the font files contain a single face,  
     *      the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nf-dwrite_3-idwritefontfacereference-getfontfaceindex
     */
    GetFontFaceIndex() {
        result := ComCall(6, this, "uint")
        return result
    }

    /**
     * Obtains the algorithmic style simulation flags of a font face.
     * @returns {Integer} Type: <b><a href="/windows/win32/api/dwrite/ne-dwrite-dwrite_font_simulations">DWRITE_FONT_SIMULATIONS</a></b>
     * 
     * Returns the algorithmic style simulation flags of a font face.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nf-dwrite_3-idwritefontfacereference-getsimulations
     */
    GetSimulations() {
        result := ComCall(7, this, "int")
        return result
    }

    /**
     * Obtains the font file representing a font face.
     * @returns {IDWriteFontFile} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefontfile">IDWriteFontFile</a>**</b>
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nf-dwrite_3-idwritefontfacereference-getfontfile
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
     *      value is zero. If full, this value will equal <a href="/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontfacereference-getfilesize">GetFileSize</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nf-dwrite_3-idwritefontfacereference-getlocalfilesize
     */
    GetLocalFileSize() {
        result := ComCall(9, this, "uint")
        return result
    }

    /**
     * Get the total size of the font face in bytes.
     * @returns {Integer} Type: <b>UINT64</b>
     * 
     * Returns the total size of the font face in bytes. If the locality is remote, this value is unknown and will be zero.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nf-dwrite_3-idwritefontfacereference-getfilesize
     */
    GetFileSize() {
        result := ComCall(10, this, "uint")
        return result
    }

    /**
     * Get the last modified date.
     * @returns {FILETIME} Type: <b>FILETIME*</b>
     * 
     * Returns the last modified date. The time may be zero if the font file loader does not expose file time.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nf-dwrite_3-idwritefontfacereference-getfiletime
     */
    GetFileTime() {
        lastWriteTime := FILETIME()
        result := ComCall(11, this, "ptr", lastWriteTime, "HRESULT")
        return lastWriteTime
    }

    /**
     * Get the locality of this font face reference.
     * @returns {Integer} Type: <b><a href="/windows/win32/api/dwrite_3/ne-dwrite_3-dwrite_locality">DWRITE_LOCALITY</a></b>
     * 
     * Returns the locality of this font face reference.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nf-dwrite_3-idwritefontfacereference-getlocality
     */
    GetLocality() {
        result := ComCall(12, this, "int")
        return result
    }

    /**
     * Adds a request to the font download queue (IDWriteFontDownloadQueue).
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nf-dwrite_3-idwritefontfacereference-enqueuefontdownloadrequest
     */
    EnqueueFontDownloadRequest() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * Adds a request to the font download queue (IDWriteFontDownloadQueue).
     * @param {PWSTR} characters Type: <b>const WCHAR*</b>
     * 
     * Array of characters to download.
     * @param {Integer} characterCount Type: <b>UINT32</b>
     * 
     * The number of elements in the character array.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nf-dwrite_3-idwritefontfacereference-enqueuecharacterdownloadrequest
     */
    EnqueueCharacterDownloadRequest(characters, characterCount) {
        characters := characters is String ? StrPtr(characters) : characters

        result := ComCall(14, this, "ptr", characters, "uint", characterCount, "HRESULT")
        return result
    }

    /**
     * Adds a request to the font download queue (IDWriteFontDownloadQueue).
     * @param {Pointer<Integer>} glyphIndices Type: <b>const UINT16*</b>
     * 
     * Array of glyph indices to download.
     * @param {Integer} glyphCount Type: <b>UINT32</b>
     * 
     * The number of elements in the glyph index array.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nf-dwrite_3-idwritefontfacereference-enqueueglyphdownloadrequest
     */
    EnqueueGlyphDownloadRequest(glyphIndices, glyphCount) {
        glyphIndicesMarshal := glyphIndices is VarRef ? "ushort*" : "ptr"

        result := ComCall(15, this, glyphIndicesMarshal, glyphIndices, "uint", glyphCount, "HRESULT")
        return result
    }

    /**
     * Adds a request to the font download queue (IDWriteFontDownloadQueue).
     * @param {Integer} fileOffset Type: <b>UINT64</b>
     * 
     * Offset of the fragment from the beginning of the font file.
     * @param {Integer} fragmentSize Type: <b>UINT64</b>
     * 
     * Size of the fragment in bytes.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nf-dwrite_3-idwritefontfacereference-enqueuefilefragmentdownloadrequest
     */
    EnqueueFileFragmentDownloadRequest(fileOffset, fragmentSize) {
        result := ComCall(16, this, "uint", fileOffset, "uint", fragmentSize, "HRESULT")
        return result
    }
}
