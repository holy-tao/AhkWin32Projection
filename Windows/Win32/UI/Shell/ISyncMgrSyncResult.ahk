#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\SYNCMGR_PROGRESS_STATUS.ahk" { SYNCMGR_PROGRESS_STATUS }

/**
 * Exposes a method that applications calling ISyncMgrControl can use to get the result of a ISyncMgrControl::StartHandlerSync or ISyncMgrControl::StartItemSync call.
 * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nn-syncmgr-isyncmgrsyncresult
 * @namespace Windows.Win32.UI.Shell
 */
export default struct ISyncMgrSyncResult extends IUnknown {
    /**
     * The interface identifier for ISyncMgrSyncResult
     * @type {Guid}
     */
    static IID := Guid("{2b90f17e-5a3e-4b33-bb7f-1bc48056b94d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISyncMgrSyncResult interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Result : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISyncMgrSyncResult.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the result of a StartHandlerSync or StartItemSync call.
     * @param {SYNCMGR_PROGRESS_STATUS} nStatus Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_progress_status">SYNCMGR_PROGRESS_STATUS</a></b>
     * 
     * The current status of the progress report. See <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_progress_status">SYNCMGR_PROGRESS_STATUS</a>.
     * @param {Integer} cError Type: <b>UINT</b>
     * 
     * An error.
     * @param {Integer} cConflicts Type: <b>UINT</b>
     * 
     * Specifies conflicts.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrsyncresult-result
     */
    Result(nStatus, cError, cConflicts) {
        result := ComCall(3, this, SYNCMGR_PROGRESS_STATUS, nStatus, "uint", cError, "uint", cConflicts, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISyncMgrSyncResult.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Result := CallbackCreate(GetMethod(implObj, "Result"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Result)
    }
}
