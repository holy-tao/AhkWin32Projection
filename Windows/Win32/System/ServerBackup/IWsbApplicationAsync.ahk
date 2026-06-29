#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Defines methods to monitor and control the progress of an asynchronous operation.
 * @see https://learn.microsoft.com/windows/win32/api/wsbapp/nn-wsbapp-iwsbapplicationasync
 * @namespace Windows.Win32.System.ServerBackup
 */
export default struct IWsbApplicationAsync extends IUnknown {
    /**
     * The interface identifier for IWsbApplicationAsync
     * @type {Guid}
     */
    static IID := Guid("{0843f6f7-895c-44a6-b0c2-05a5022aa3a1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWsbApplicationAsync interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        QueryStatus : IntPtr
        Abort       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWsbApplicationAsync.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Queries the status of an asynchronous operation.
     * @remarks
     * Windows Server Backup calls this  method periodically to query the status of a pending asynchronous operation.
     * @returns {HRESULT} The address of an <b>HRESULT</b> value that receives the status of the current asynchronous operation. If the asynchronous operation fails, this parameter receives the failure status code. Possible values include the following.
     * @see https://learn.microsoft.com/windows/win32/api/wsbapp/nf-wsbapp-iwsbapplicationasync-querystatus
     */
    QueryStatus() {
        result := ComCall(3, this, "int*", &phrResult := 0, "HRESULT")
        return phrResult
    }

    /**
     * Cancels an incomplete asynchronous operation.
     * @remarks
     * Windows Server Backup calls this method to cancel an asynchronous operation. For example, if the overall backup operation is canceled while an asynchronous consistency-check operation is in progress, this method will be called to cancel the consistency-check operation.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful, or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/wsbapp/nf-wsbapp-iwsbapplicationasync-abort
     */
    Abort() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWsbApplicationAsync.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.QueryStatus := CallbackCreate(GetMethod(implObj, "QueryStatus"), flags, 2)
        this.vtbl.Abort := CallbackCreate(GetMethod(implObj, "Abort"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.QueryStatus)
        CallbackFree(this.vtbl.Abort)
    }
}
