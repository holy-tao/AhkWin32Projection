#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents the result of an asynchronous operation. A client can use the interface to wait for the operation to complete and to get the result.
 * @remarks
 * IDWriteAsyncResult is returned by <a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwriteremotefontfilestream-begindownload">IDWriteRemoteFontFileStream::BeginDownload</a> for signaling completion of a font download operation.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwriteasyncresult
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct IDWriteAsyncResult extends IUnknown {
    /**
     * The interface identifier for IDWriteAsyncResult
     * @type {Guid}
     */
    static IID := Guid("{ce25f8fd-863b-4d13-9651-c1f88dc73fe2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDWriteAsyncResult interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetWaitHandle : IntPtr
        GetResult     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDWriteAsyncResult.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Returns a handle that can be used to wait for the asynchronous operation to complete. The handle remains valid until the interface is released.
     * @returns {HANDLE} Type: <b>HANDLE</b>
     * 
     * Returns a handle that can be used to wait for the asynchronous operation to complete. The handle remains valid until the interface is released.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwriteasyncresult-getwaithandle
     */
    GetWaitHandle() {
        result := ComCall(3, this, HANDLE.Owned)
        return result
    }

    /**
     * Returns the result of the asynchronous operation. The return value is E_PENDING if the operation has not yet completed.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns the result of the asynchronous operation. The return value is E_PENDING if the operation has not yet completed.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwriteasyncresult-getresult
     */
    GetResult() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDWriteAsyncResult.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetWaitHandle := CallbackCreate(GetMethod(implObj, "GetWaitHandle"), flags, 1)
        this.vtbl.GetResult := CallbackCreate(GetMethod(implObj, "GetResult"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetWaitHandle)
        CallbackFree(this.vtbl.GetResult)
    }
}
