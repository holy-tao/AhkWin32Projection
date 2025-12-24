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
     * Reads a fragment from a font file.
     * @param {Pointer<Pointer<Void>>} fragmentStart Type: <b>const void**</b>
     * 
     * When this method returns, contains an address of a  pointer to the start of the font file fragment.  This parameter is passed uninitialized.
     * @param {Integer} fileOffset Type: <b>UINT64</b>
     * 
     * The offset of the fragment, in bytes, from the beginning of the font file.
     * @param {Integer} fragmentSize Type: <b>UINT64</b>
     * 
     * The size of the file fragment, in bytes.
     * @param {Pointer<Pointer<Void>>} fragmentContext Type: <b>void**</b>
     * 
     * When this method returns, contains the address of a pointer to a pointer to the client-defined context to be passed to <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefontfilestream-releasefilefragment">ReleaseFileFragment</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritefontfilestream-readfilefragment
     */
    ReadFileFragment(fragmentStart, fileOffset, fragmentSize, fragmentContext) {
        fragmentStartMarshal := fragmentStart is VarRef ? "ptr*" : "ptr"
        fragmentContextMarshal := fragmentContext is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, fragmentStartMarshal, fragmentStart, "uint", fileOffset, "uint", fragmentSize, fragmentContextMarshal, fragmentContext, "HRESULT")
        return result
    }

    /**
     * Releases a fragment from a file.
     * @param {Pointer<Void>} fragmentContext Type: <b>void*</b>
     * 
     * A pointer to the client-defined context of a font fragment returned from <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefontfilestream-readfilefragment">ReadFileFragment</a>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritefontfilestream-releasefilefragment
     */
    ReleaseFileFragment(fragmentContext) {
        fragmentContextMarshal := fragmentContext is VarRef ? "ptr" : "ptr"

        ComCall(4, this, fragmentContextMarshal, fragmentContext)
    }

    /**
     * Obtains the total size of a file.
     * @returns {Integer} Type: <b>UINT64*</b>
     * 
     * When this method returns, contains the total size of the file.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritefontfilestream-getfilesize
     */
    GetFileSize() {
        result := ComCall(5, this, "uint*", &fileSize := 0, "HRESULT")
        return fileSize
    }

    /**
     * Obtains the last modified time of the file.
     * @returns {Integer} Type: <b>UINT64*</b>
     * 
     * When this method returns, contains  the last modified time of the file in the format that represents
     *      the number of 100-nanosecond intervals since January 1, 1601 (UTC).
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritefontfilestream-getlastwritetime
     */
    GetLastWriteTime() {
        result := ComCall(6, this, "uint*", &lastWriteTime := 0, "HRESULT")
        return lastWriteTime
    }
}
