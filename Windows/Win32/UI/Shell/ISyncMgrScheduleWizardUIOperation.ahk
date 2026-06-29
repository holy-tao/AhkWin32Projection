#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISyncMgrUIOperation.ahk" { ISyncMgrUIOperation }

/**
 * Exposes a method that allows a handler to display the sync schedule wizard for the handler.
 * @remarks
 * The wizard can be invoked by CoCreating CLSID_SyncMgrScheduleWizard, which is typically done when Sync Center calls <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrhandler-getobject">ISyncMgrHandler::GetObject</a>, specifying SYNCMGR_OBJECTID_ShowSchedule for the object ID.
 * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nn-syncmgr-isyncmgrschedulewizarduioperation
 * @namespace Windows.Win32.UI.Shell
 */
export default struct ISyncMgrScheduleWizardUIOperation extends ISyncMgrUIOperation {
    /**
     * The interface identifier for ISyncMgrScheduleWizardUIOperation
     * @type {Guid}
     */
    static IID := Guid("{459a6c84-21d2-4ddc-8a53-f023a46066f2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISyncMgrScheduleWizardUIOperation interfaces
    */
    struct Vtbl extends ISyncMgrUIOperation.Vtbl {
        InitWizard : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISyncMgrScheduleWizardUIOperation.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Initializes the sync schedule wizard.
     * @param {PWSTR} pszHandlerID Type: <b>LPCWSTR</b>
     * 
     * A pointer to a handler ID as a Unicode string.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrschedulewizarduioperation-initwizard
     */
    InitWizard(pszHandlerID) {
        pszHandlerID := pszHandlerID is String ? StrPtr(pszHandlerID) : pszHandlerID

        result := ComCall(4, this, "ptr", pszHandlerID, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISyncMgrScheduleWizardUIOperation.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.InitWizard := CallbackCreate(GetMethod(implObj, "InitWizard"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.InitWizard)
    }
}
