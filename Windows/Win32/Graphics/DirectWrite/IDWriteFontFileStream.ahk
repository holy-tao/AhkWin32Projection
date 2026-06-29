#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Loads font file data from a custom font file loader.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefontfilestream
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct IDWriteFontFileStream extends IUnknown {
    /**
     * The interface identifier for IDWriteFontFileStream
     * @type {Guid}
     */
    static IID := Guid("{6d4865fe-0ab8-4d91-8f62-5dd6be34a3e0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDWriteFontFileStream interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ReadFileFragment    : IntPtr
        ReleaseFileFragment : IntPtr
        GetFileSize         : IntPtr
        GetLastWriteTime    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDWriteFontFileStream.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Reads a fragment from a font file.
     * @remarks
     * Note that <b>ReadFileFragment</b> implementations must check whether the requested font file fragment
     *      is within the file bounds. Otherwise, an error should be returned from <b>ReadFileFragment</b>.
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/win32/DirectWrite/direct-write-portal">DirectWrite</a> may invoke <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefontfilestream">IDWriteFontFileStream</a> methods on the same object from multiple threads simultaneously. Therefore, <b>ReadFileFragment</b> implementations that rely on internal mutable state must serialize access to such state across multiple threads. For example, an implementation that uses separate Seek and Read operations to read a file fragment must place the code block containing Seek and Read calls under a lock or a critical section.
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
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefontfilestream-readfilefragment
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
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefontfilestream-releasefilefragment
     */
    ReleaseFileFragment(fragmentContext) {
        fragmentContextMarshal := fragmentContext is VarRef ? "ptr" : "ptr"

        ComCall(4, this, fragmentContextMarshal, fragmentContext)
    }

    /**
     * Obtains the total size of a file.
     * @remarks
     * Implementing <b>GetFileSize</b>() for asynchronously loaded font files may require
     *      downloading the complete file contents. Therefore, this method should be used only for operations that
     *      either require a complete font file to be loaded (for example, copying a font file) or that need to make
     *      decisions based on the value of the file size (for example, validation against a persisted file size).
     * @returns {Integer} Type: <b>UINT64*</b>
     * 
     * When this method returns, contains the total size of the file.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefontfilestream-getfilesize
     */
    GetFileSize() {
        result := ComCall(5, this, "uint*", &fileSize := 0, "HRESULT")
        return fileSize
    }

    /**
     * Obtains the last modified time of the file.
     * @remarks
     * The "last modified time" is used by DirectWrite font selection algorithms
     *      to determine whether one font resource is more up to date than another one.
     * @returns {Integer} Type: <b>UINT64*</b>
     * 
     * When this method returns, contains  the last modified time of the file in the format that represents
     *      the number of 100-nanosecond intervals since January 1, 1601 (UTC).
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefontfilestream-getlastwritetime
     */
    GetLastWriteTime() {
        result := ComCall(6, this, "uint*", &lastWriteTime := 0, "HRESULT")
        return lastWriteTime
    }

    Query(iid) {
        if (IDWriteFontFileStream.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ReadFileFragment := CallbackCreate(GetMethod(implObj, "ReadFileFragment"), flags, 5)
        this.vtbl.ReleaseFileFragment := CallbackCreate(GetMethod(implObj, "ReleaseFileFragment"), flags, 2)
        this.vtbl.GetFileSize := CallbackCreate(GetMethod(implObj, "GetFileSize"), flags, 2)
        this.vtbl.GetLastWriteTime := CallbackCreate(GetMethod(implObj, "GetLastWriteTime"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ReadFileFragment)
        CallbackFree(this.vtbl.ReleaseFileFragment)
        CallbackFree(this.vtbl.GetFileSize)
        CallbackFree(this.vtbl.GetLastWriteTime)
    }
}
