#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\CONFIRM_CONFLICT_ITEM.ahk" { CONFIRM_CONFLICT_ITEM }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods that get conflict item data and item count.
 * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nn-syncmgr-isyncmgrconflictitems
 * @namespace Windows.Win32.UI.Shell
 */
export default struct ISyncMgrConflictItems extends IUnknown {
    /**
     * The interface identifier for ISyncMgrConflictItems
     * @type {Guid}
     */
    static IID := Guid("{9c7ead52-8023-4936-a4db-d2a9a99e436a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISyncMgrConflictItems interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetCount : IntPtr
        GetItem  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISyncMgrConflictItems.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the conflict item count.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * A pointer to the item count.
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrconflictitems-getcount
     */
    GetCount() {
        result := ComCall(3, this, "uint*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * Gets a specified conflict data item.
     * @param {Integer} iIndex Type: <b>UINT</b>
     * 
     * The index of the conflict item to retrieve.
     * @returns {CONFIRM_CONFLICT_ITEM} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ns-syncmgr-confirm_conflict_item">CONFIRM_CONFLICT_ITEM</a>*</b>
     * 
     * When this method returns successfully, contains a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ns-syncmgr-confirm_conflict_item">CONFIRM_CONFLICT_ITEM</a> structure that contains information about the conflict.
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrconflictitems-getitem
     */
    GetItem(iIndex) {
        pItemInfo := CONFIRM_CONFLICT_ITEM()
        result := ComCall(4, this, "uint", iIndex, CONFIRM_CONFLICT_ITEM.Ptr, pItemInfo, "HRESULT")
        return pItemInfo
    }

    Query(iid) {
        if (ISyncMgrConflictItems.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCount := CallbackCreate(GetMethod(implObj, "GetCount"), flags, 2)
        this.vtbl.GetItem := CallbackCreate(GetMethod(implObj, "GetItem"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCount)
        CallbackFree(this.vtbl.GetItem)
    }
}
