#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISyncMgrConflict.ahk" { ISyncMgrConflict }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "Common\ITEMIDLIST.ahk" { ITEMIDLIST }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes a method that gets the conflict ID list for a conflict object.
 * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nn-syncmgr-isyncmgrconflictfolder
 * @namespace Windows.Win32.UI.Shell
 */
export default struct ISyncMgrConflictFolder extends IUnknown {
    /**
     * The interface identifier for ISyncMgrConflictFolder
     * @type {Guid}
     */
    static IID := Guid("{59287f5e-bc81-4fca-a7f1-e5a8ecdb1d69}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISyncMgrConflictFolder interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetConflictIDList : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISyncMgrConflictFolder.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Maps a conflict to its IShellItem.
     * @param {ISyncMgrConflict} pConflict Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-isyncmgrconflict">ISyncMgrConflict</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-isyncmgrconflict">ISyncMgrConflict</a> interface.
     * @returns {Pointer<ITEMIDLIST>} Type: <b>PIDLIST_RELATIVE*</b>
     * 
     * A pointer to a PIDL, specified relative to the folder.
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrconflictfolder-getconflictidlist
     */
    GetConflictIDList(pConflict) {
        result := ComCall(3, this, "ptr", pConflict, "ptr*", &ppidlConflict := 0, "HRESULT")
        return ppidlConflict
    }

    Query(iid) {
        if (ISyncMgrConflictFolder.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetConflictIDList := CallbackCreate(GetMethod(implObj, "GetConflictIDList"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetConflictIDList)
    }
}
