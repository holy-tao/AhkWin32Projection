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
     * 
     * @returns {IDWriteFontFace3} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontfacereference-createfontface
     */
    CreateFontFace() {
        result := ComCall(3, this, "ptr*", &fontFace := 0, "HRESULT")
        return IDWriteFontFace3(fontFace)
    }

    /**
     * 
     * @param {Integer} fontFaceSimulationFlags 
     * @returns {IDWriteFontFace3} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontfacereference-createfontfacewithsimulations
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
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontfacereference-getfontfaceindex
     */
    GetFontFaceIndex() {
        result := ComCall(6, this, "uint")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontfacereference-getsimulations
     */
    GetSimulations() {
        result := ComCall(7, this, "int")
        return result
    }

    /**
     * 
     * @returns {IDWriteFontFile} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontfacereference-getfontfile
     */
    GetFontFile() {
        result := ComCall(8, this, "ptr*", &fontFile := 0, "HRESULT")
        return IDWriteFontFile(fontFile)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontfacereference-getlocalfilesize
     */
    GetLocalFileSize() {
        result := ComCall(9, this, "uint")
        return result
    }

    /**
     * Retrieves the size of the specified file, in bytes.
     * @returns {Integer} If the function succeeds, the return value is the low-order doubleword of the file size, and, if 
     *        <i>lpFileSizeHigh</i> is non-<b>NULL</b>, the function puts the 
     *        high-order doubleword of the file size into the variable pointed to by that parameter.
     * 
     * If the function fails and <i>lpFileSizeHigh</i> is <b>NULL</b>, the 
     *        return value is <b>INVALID_FILE_SIZE</b>. To get extended error information, call 
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. When 
     *        <i>lpFileSizeHigh</i> is <b>NULL</b>, the results returned for large 
     *        files are ambiguous, and you will not be able to determine the actual size of the file. It is recommended that 
     *        you use <a href="/windows/desktop/api/fileapi/nf-fileapi-getfilesizeex">GetFileSizeEx</a> instead.
     * 
     * If the function fails and <i>lpFileSizeHigh</i> is non-<b>NULL</b>, the 
     *        return value is <b>INVALID_FILE_SIZE</b> and 
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> will return a value other than 
     *        <b>NO_ERROR</b>.
     * @see https://docs.microsoft.com/windows/win32/api//fileapi/nf-fileapi-getfilesize
     */
    GetFileSize() {
        result := ComCall(10, this, "uint")
        return result
    }

    /**
     * Retrieves the date and time that a file or directory was created, last accessed, and last modified.
     * @returns {FILETIME} 
     * @see https://docs.microsoft.com/windows/win32/api//fileapi/nf-fileapi-getfiletime
     */
    GetFileTime() {
        lastWriteTime := FILETIME()
        result := ComCall(11, this, "ptr", lastWriteTime, "HRESULT")
        return lastWriteTime
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontfacereference-getlocality
     */
    GetLocality() {
        result := ComCall(12, this, "int")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontfacereference-enqueuefontdownloadrequest
     */
    EnqueueFontDownloadRequest() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} characters 
     * @param {Integer} characterCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontfacereference-enqueuecharacterdownloadrequest
     */
    EnqueueCharacterDownloadRequest(characters, characterCount) {
        characters := characters is String ? StrPtr(characters) : characters

        result := ComCall(14, this, "ptr", characters, "uint", characterCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} glyphIndices 
     * @param {Integer} glyphCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontfacereference-enqueueglyphdownloadrequest
     */
    EnqueueGlyphDownloadRequest(glyphIndices, glyphCount) {
        glyphIndicesMarshal := glyphIndices is VarRef ? "ushort*" : "ptr"

        result := ComCall(15, this, glyphIndicesMarshal, glyphIndices, "uint", glyphCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} fileOffset 
     * @param {Integer} fragmentSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontfacereference-enqueuefilefragmentdownloadrequest
     */
    EnqueueFileFragmentDownloadRequest(fileOffset, fragmentSize) {
        result := ComCall(16, this, "uint", fileOffset, "uint", fragmentSize, "HRESULT")
        return result
    }
}
