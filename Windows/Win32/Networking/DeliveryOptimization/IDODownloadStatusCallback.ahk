#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDODownload.ahk" { IDODownload }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DO_DOWNLOAD_STATUS.ahk" { DO_DOWNLOAD_STATUS }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Used to receive notifications about a download.
 * @see https://learn.microsoft.com/windows/win32/api/deliveryoptimization/nn-deliveryoptimization-idodownloadstatuscallback
 * @namespace Windows.Win32.Networking.DeliveryOptimization
 */
export default struct IDODownloadStatusCallback extends IUnknown {
    /**
     * The interface identifier for IDODownloadStatusCallback
     * @type {Guid}
     */
    static IID := Guid("{d166e8e3-a90e-4392-8e87-05e996d3747d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDODownloadStatusCallback interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnStatusChange : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDODownloadStatusCallback.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Delivery Optimization calls your implementation of this method any time a download status has changed.
     * @param {IDODownload} download An pointer to the **IDODownload** interface whose status changed.
     * @param {Pointer<DO_DOWNLOAD_STATUS>} _status A pointer to a **DO_DOWNLOAD_STATUS** structure containing the download's status.
     * @returns {HRESULT} If the function succeeds, it returns **S_OK**. Otherwise, it returns an [**HRESULT**](/windows/win32/com/structure-of-com-error-codes) [error code](/windows/win32/com/com-error-codes-10).
     * @see https://learn.microsoft.com/windows/win32/api/deliveryoptimization/nf-deliveryoptimization-idodownloadstatuscallback-onstatuschange
     */
    OnStatusChange(download, _status) {
        result := ComCall(3, this, "ptr", download, DO_DOWNLOAD_STATUS.Ptr, _status, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDODownloadStatusCallback.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnStatusChange := CallbackCreate(GetMethod(implObj, "OnStatusChange"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnStatusChange)
    }
}
