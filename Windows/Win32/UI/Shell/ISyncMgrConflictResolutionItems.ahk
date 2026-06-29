#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\CONFIRM_CONFLICT_RESULT_INFO.ahk" { CONFIRM_CONFLICT_RESULT_INFO }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods that get item info and item count.
 * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nn-syncmgr-isyncmgrconflictresolutionitems
 * @namespace Windows.Win32.UI.Shell
 */
export default struct ISyncMgrConflictResolutionItems extends IUnknown {
    /**
     * The interface identifier for ISyncMgrConflictResolutionItems
     * @type {Guid}
     */
    static IID := Guid("{458725b9-129d-4135-a998-9ceafec27007}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISyncMgrConflictResolutionItems interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetCount : IntPtr
        GetItem  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISyncMgrConflictResolutionItems.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets item count.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * A pointer to an item count.
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrconflictresolutionitems-getcount
     */
    GetCount() {
        result := ComCall(3, this, "uint*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * Gets result information for a specified item, when successful.
     * @param {Integer} iIndex Type: <b>UINT</b>
     * 
     * The index of the item.
     * @returns {CONFIRM_CONFLICT_RESULT_INFO} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ns-syncmgr-confirm_conflict_result_info">CONFIRM_CONFLICT_RESULT_INFO</a>*</b>
     * 
     * On success, contains a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ns-syncmgr-confirm_conflict_result_info">CONFIRM_CONFLICT_RESULT_INFO</a> structure.
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrconflictresolutionitems-getitem
     */
    GetItem(iIndex) {
        pItemInfo := CONFIRM_CONFLICT_RESULT_INFO()
        result := ComCall(4, this, "uint", iIndex, CONFIRM_CONFLICT_RESULT_INFO.Ptr, pItemInfo, "HRESULT")
        return pItemInfo
    }

    Query(iid) {
        if (ISyncMgrConflictResolutionItems.IID.Equals(iid)) {
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
