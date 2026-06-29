#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISyncMgrConflict.ahk" { ISyncMgrConflict }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\ISyncMgrConflictResolveInfo.ahk" { ISyncMgrConflictResolveInfo }

/**
 * Exposes a method that presents a conflict to the user.
 * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nn-syncmgr-isyncmgrconflictpresenter
 * @namespace Windows.Win32.UI.Shell
 */
export default struct ISyncMgrConflictPresenter extends IUnknown {
    /**
     * The interface identifier for ISyncMgrConflictPresenter
     * @type {Guid}
     */
    static IID := Guid("{0b4f5353-fd2b-42cd-8763-4779f2d508a3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISyncMgrConflictPresenter interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        PresentConflict : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISyncMgrConflictPresenter.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Presents the conflict to the user.
     * @param {ISyncMgrConflict} pConflict Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-isyncmgrconflict">ISyncMgrConflict</a>*</b>
     * 
     * Specifies the conflict. See <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-isyncmgrconflict">ISyncMgrConflict</a>.
     * @param {ISyncMgrConflictResolveInfo} pResolveInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-isyncmgrconflictresolveinfo">ISyncMgrConflictResolveInfo</a>*</b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrconflictpresenter-presentconflict
     */
    PresentConflict(pConflict, pResolveInfo) {
        result := ComCall(3, this, "ptr", pConflict, "ptr", pResolveInfo, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISyncMgrConflictPresenter.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.PresentConflict := CallbackCreate(GetMethod(implObj, "PresentConflict"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.PresentConflict)
    }
}
