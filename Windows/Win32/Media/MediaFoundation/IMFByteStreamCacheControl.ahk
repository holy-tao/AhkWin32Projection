#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Controls how a network byte stream transfers data to a local cache. (IMFByteStreamCacheControl)
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfbytestreamcachecontrol
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFByteStreamCacheControl extends IUnknown {
    /**
     * The interface identifier for IMFByteStreamCacheControl
     * @type {Guid}
     */
    static IID := Guid("{f5042ea4-7a96-4a75-aa7b-2be1ef7f88d5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFByteStreamCacheControl interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        StopBackgroundTransfer : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFByteStreamCacheControl.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Stops the background transfer of data to the local cache.
     * @remarks
     * The byte stream resumes transferring data to the cache if the application does one of the following:
     * 
     * <ul>
     * <li>Reads data from the byte stream.</li>
     * <li>Calls the byte stream's <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfbytestreambuffering-enablebuffering">IMFByteStreamBuffering::EnableBuffering</a> method.</li>
     * </ul>
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfbytestreamcachecontrol-stopbackgroundtransfer
     */
    StopBackgroundTransfer() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFByteStreamCacheControl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.StopBackgroundTransfer := CallbackCreate(GetMethod(implObj, "StopBackgroundTransfer"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.StopBackgroundTransfer)
    }
}
