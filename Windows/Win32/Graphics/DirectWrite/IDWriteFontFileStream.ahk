#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Loads font file data from a custom font file loader.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite/nn-dwrite-idwritefontfilestream
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteFontFileStream extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteFontFileStream
     * @type {Guid}
     */
    static IID => Guid("{6d4865fe-0ab8-4d91-8f62-5dd6be34a3e0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ReadFileFragment", "ReleaseFileFragment", "GetFileSize", "GetLastWriteTime"]

    /**
     * 
     * @param {Pointer<Pointer<Void>>} fragmentStart 
     * @param {Integer} fileOffset 
     * @param {Integer} fragmentSize 
     * @param {Pointer<Pointer<Void>>} fragmentContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefontfilestream-readfilefragment
     */
    ReadFileFragment(fragmentStart, fileOffset, fragmentSize, fragmentContext) {
        fragmentStartMarshal := fragmentStart is VarRef ? "ptr*" : "ptr"
        fragmentContextMarshal := fragmentContext is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, fragmentStartMarshal, fragmentStart, "uint", fileOffset, "uint", fragmentSize, fragmentContextMarshal, fragmentContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} fragmentContext 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefontfilestream-releasefilefragment
     */
    ReleaseFileFragment(fragmentContext) {
        fragmentContextMarshal := fragmentContext is VarRef ? "ptr" : "ptr"

        ComCall(4, this, fragmentContextMarshal, fragmentContext)
    }

    /**
     * Retrieves the size of the specified file, in bytes.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//fileapi/nf-fileapi-getfilesize
     */
    GetFileSize() {
        result := ComCall(5, this, "uint*", &fileSize := 0, "HRESULT")
        return fileSize
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefontfilestream-getlastwritetime
     */
    GetLastWriteTime() {
        result := ComCall(6, this, "uint*", &lastWriteTime := 0, "HRESULT")
        return lastWriteTime
    }
}
