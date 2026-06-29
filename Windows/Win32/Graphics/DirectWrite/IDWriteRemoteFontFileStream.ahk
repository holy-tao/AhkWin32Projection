#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDWriteAsyncResult.ahk" { IDWriteAsyncResult }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\DWRITE_LOCALITY.ahk" { DWRITE_LOCALITY }
#Import ".\IDWriteFontFileStream.ahk" { IDWriteFontFileStream }
#Import ".\DWRITE_FILE_FRAGMENT.ahk" { DWRITE_FILE_FRAGMENT }

/**
 * Represents a font file stream, parts of which may be non-local.
 * @remarks
 * For more information, see the description of IDWriteRemoteFontFileLoader.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwriteremotefontfilestream
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct IDWriteRemoteFontFileStream extends IDWriteFontFileStream {
    /**
     * The interface identifier for IDWriteRemoteFontFileStream
     * @type {Guid}
     */
    static IID := Guid("{4db3757a-2c72-4ed9-b2b6-1ababe1aff9c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDWriteRemoteFontFileStream interfaces
    */
    struct Vtbl extends IDWriteFontFileStream.Vtbl {
        GetLocalFileSize        : IntPtr
        GetFileFragmentLocality : IntPtr
        GetLocality             : IntPtr
        BeginDownload           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDWriteRemoteFontFileStream.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * GetLocalFileSize returns the number of bytes of the font file that are currently local, which should always be less than or equal to the full file size returned by GetFileSize.
     * @returns {Integer} Type: <b>UINT64*</b>
     * 
     * Receives the local size of the file.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwriteremotefontfilestream-getlocalfilesize
     */
    GetLocalFileSize() {
        result := ComCall(7, this, "uint*", &localFileSize := 0, "HRESULT")
        return localFileSize
    }

    /**
     * Returns information about the locality of a byte range (i.e., font fragment) within the font file stream.
     * @param {Integer} fileOffset Type: <b>UINT64</b>
     * 
     * Offset of the fragment from the beginning of the font file.
     * @param {Integer} fragmentSize Type: <b>UINT64</b>
     * 
     * Size of the fragment in bytes.
     * @param {Pointer<Integer>} partialSize Type: <b>UINT64*</b>
     * 
     * Receives the number of contiguous bytes from the start of the fragment that have the same locality as the first byte.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * Receives TRUE if the first byte of the fragment is local, FALSE if not.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwriteremotefontfilestream-getfilefragmentlocality
     */
    GetFileFragmentLocality(fileOffset, fragmentSize, partialSize) {
        partialSizeMarshal := partialSize is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, "uint", fileOffset, "uint", fragmentSize, BOOL.Ptr, &isLocal := 0, partialSizeMarshal, partialSize, "HRESULT")
        return isLocal
    }

    /**
     * Gets the current locality of the file.
     * @returns {DWRITE_LOCALITY} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/ne-dwrite_3-dwrite_locality">DWRITE_LOCALITY</a></b>
     * 
     * Returns the current locality (i.e., remote, partial, or local).
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwriteremotefontfilestream-getlocality
     */
    GetLocality() {
        result := ComCall(9, this, DWRITE_LOCALITY)
        return result
    }

    /**
     * Begins downloading all or part of the font file.
     * @param {Pointer<Guid>} downloadOperationID Type: <b>UUID</b>
     * @param {Pointer<DWRITE_FILE_FRAGMENT>} fileFragments Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/ns-dwrite_3-dwrite_file_fragment">DWRITE_FILE_FRAGMENT</a></b>
     * 
     * Array of structures, each specifying a byte range to download.
     * @param {Integer} fragmentCount Type: <b>UINT32</b>
     * 
     * Number of elements in the fileFragments array. This can be zero to just download file information, such as the size.
     * @returns {IDWriteAsyncResult} Type: <b>_COM_Outptr_result_maybenull_</b>
     * 
     * Receives an object that can be used to wait for the asynchronous download to complete and to get the download result upon 
     *           completion. The result may be NULL if the download completes synchronously. For example, this can happen if method determines that the requested data
     *           is already local.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwriteremotefontfilestream-begindownload
     */
    BeginDownload(downloadOperationID, fileFragments, fragmentCount) {
        result := ComCall(10, this, Guid.Ptr, downloadOperationID, DWRITE_FILE_FRAGMENT.Ptr, fileFragments, "uint", fragmentCount, "ptr*", &asyncResult := 0, "HRESULT")
        return IDWriteAsyncResult(asyncResult)
    }

    Query(iid) {
        if (IDWriteRemoteFontFileStream.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetLocalFileSize := CallbackCreate(GetMethod(implObj, "GetLocalFileSize"), flags, 2)
        this.vtbl.GetFileFragmentLocality := CallbackCreate(GetMethod(implObj, "GetFileFragmentLocality"), flags, 5)
        this.vtbl.GetLocality := CallbackCreate(GetMethod(implObj, "GetLocality"), flags, 1)
        this.vtbl.BeginDownload := CallbackCreate(GetMethod(implObj, "BeginDownload"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetLocalFileSize)
        CallbackFree(this.vtbl.GetFileFragmentLocality)
        CallbackFree(this.vtbl.GetLocality)
        CallbackFree(this.vtbl.BeginDownload)
    }
}
