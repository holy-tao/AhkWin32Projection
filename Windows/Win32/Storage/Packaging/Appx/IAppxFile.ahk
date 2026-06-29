#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\APPX_COMPRESSION_OPTION.ahk" { APPX_COMPRESSION_OPTION }
#Import "..\..\..\System\Com\IStream.ahk" { IStream }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Retrieves information about a payload or footprint file in a package.
 * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nn-appxpackaging-iappxfile
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
export default struct IAppxFile extends IUnknown {
    /**
     * The interface identifier for IAppxFile
     * @type {Guid}
     */
    static IID := Guid("{91df827b-94fd-468f-827b-57f41b2f6f2e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAppxFile interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetCompressionOption : IntPtr
        GetContentType       : IntPtr
        GetName              : IntPtr
        GetSize              : IntPtr
        GetStream            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAppxFile.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the compression option that is used to store the file in the package.
     * @returns {APPX_COMPRESSION_OPTION} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/ne-appxpackaging-appx_compression_option">APPX_COMPRESSION_OPTION</a>*</b>
     * 
     * A compression option that describes how the file is stored in the package.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxfile-getcompressionoption
     */
    GetCompressionOption() {
        result := ComCall(3, this, "int*", &compressionOption := 0, "HRESULT")
        return compressionOption
    }

    /**
     * Retrieves the content type of the file.
     * @remarks
     * The caller is responsible for deallocating the memory used by <i>contentType</i>. Use the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function to deallocate the string's memory.
     * @returns {PWSTR} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPWSTR</a>*</b>
     * 
     * The content type of the file.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxfile-getcontenttype
     */
    GetContentType() {
        result := ComCall(4, this, PWSTR.Ptr, &contentType := 0, "HRESULT")
        return contentType
    }

    /**
     * Retrieves the name of the file, including its path relative to the package root directory.
     * @remarks
     * The string returned in <i>fileName</i> is identical to the file name listed in the block map.
     * 
     * The caller is responsible for deallocating the memory used by <i>fileName</i>. Use the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function to deallocate the string's memory.
     * @returns {PWSTR} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPWSTR</a>*</b>
     * 
     * A string that contains the name and relative path of the file.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxfile-getname
     */
    GetName() {
        result := ComCall(5, this, PWSTR.Ptr, &fileName := 0, "HRESULT")
        return fileName
    }

    /**
     * Retrieves the uncompressed size of the file.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT64</a>*</b>
     * 
     * The uncompressed size, in bytes.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxfile-getsize
     */
    GetSize() {
        result := ComCall(6, this, "uint*", &_size := 0, "HRESULT")
        return _size
    }

    /**
     * Gets a read-only stream that contains the uncompressed content of the file.
     * @remarks
     * The <i>stream</i> returned is read-only and cloneable.
     * 
     * Validation of payload files is "lazy."  On the first call to the file’s <b>GetStream</b> method, the corresponding zip file item’s local file header and data descriptor is validated and might cause <b>GetStream</b> to fail.  Subsequent calls to <b>GetStream</b> on the same file don't repeat these validations.  The zip file item’s CRC checksum is only validated if the stream is read in its entirety in sequential order.
     * 
     * 
     * Instances of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> that are returned for payload files are optimized for sequential access.  While random access to the stream is supported, that random access might be slower and more CPU-intensive.  We recommend a single sequential read of these streams whenever possible.  Reading the same range multiple times is supported but not recommended for performance; consider caching such ranges if their usage scenario demands it.
     * @returns {IStream} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>**</b>
     * 
     * A read-only stream that contains the uncompressed content of the file.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxfile-getstream
     */
    GetStream() {
        result := ComCall(7, this, "ptr*", &stream := 0, "HRESULT")
        return IStream(stream)
    }

    Query(iid) {
        if (IAppxFile.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCompressionOption := CallbackCreate(GetMethod(implObj, "GetCompressionOption"), flags, 2)
        this.vtbl.GetContentType := CallbackCreate(GetMethod(implObj, "GetContentType"), flags, 2)
        this.vtbl.GetName := CallbackCreate(GetMethod(implObj, "GetName"), flags, 2)
        this.vtbl.GetSize := CallbackCreate(GetMethod(implObj, "GetSize"), flags, 2)
        this.vtbl.GetStream := CallbackCreate(GetMethod(implObj, "GetStream"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCompressionOption)
        CallbackFree(this.vtbl.GetContentType)
        CallbackFree(this.vtbl.GetName)
        CallbackFree(this.vtbl.GetSize)
        CallbackFree(this.vtbl.GetStream)
    }
}
