#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * A pointer to the IGPMAsyncCancel interface is returned to the client by the Group Policy Management Console (GPMC) method that the client calls asynchronously.
 * @remarks
 * GPMC operations such as backup, restore, import, copy, and report generation can execute asynchronously. For more information about how to use this interface with asynchronous operations, see the "Remarks" section of 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmasyncprogress">IGPMAsyncProgress Interface</a>. The server calls 
 * the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nf-gpmgmt-igpmasyncprogress-status">IGPMAsyncProgress::Status</a> method to notify the client about the progress of the operation. The 
 * <b>Status</b> method also returns an interface pointer to the resultant object, for example, to a <b>GPMGPO</b> or to a <b>GPMBackup</b> object. The caller can then cancel the operation by calling the 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nf-gpmgmt-igpmasynccancel-cancel">IGPMAsyncCancel::Cancel</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nn-gpmgmt-igpmasynccancel
 * @namespace Windows.Win32.System.GroupPolicy
 */
export default struct IGPMAsyncCancel extends IDispatch {
    /**
     * The interface identifier for IGPMAsyncCancel
     * @type {Guid}
     */
    static IID := Guid("{ddc67754-be67-4541-8166-f48166868c9c}")

    /**
     * The class identifier for GPMAsyncCancel
     * @type {Guid}
     */
    static CLSID := Guid("{372796a9-76ec-479d-ad6c-556318ed5f9d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IGPMAsyncCancel interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        Cancel : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IGPMAsyncCancel.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The client calls this method to cancel an asynchronous Group Policy Management Console (GPMC) operation. GPMC operations such as backup, restore, import, copy, and report generation can execute asynchronously.
     * @returns {HRESULT} <h3>JScript</h3>
     * Returns <b>S_OK</b> if successful. Returns a failure code if an error occurs.
     * 
     * <h3>VB</h3>
     * Returns <b>S_OK</b> if successful. Returns a failure code if an error occurs.
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmasynccancel-cancel
     */
    Cancel() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IGPMAsyncCancel.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Cancel := CallbackCreate(GetMethod(implObj, "Cancel"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Cancel)
    }
}
