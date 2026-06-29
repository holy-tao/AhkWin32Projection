#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISyncMgrSyncItem.ahk" { ISyncMgrSyncItem }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods that enumerate the sync item objects managed by the handler.
 * @remarks
 * A handler returns a pointer to an <b>IEnumSyncMgrSyncItems</b> interface from <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrsyncitemcontainer-getsyncitemenumerator">ISyncMgrSyncItemContainer::GetSyncItemEnumerator</a>.
 * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nn-syncmgr-ienumsyncmgrsyncitems
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IEnumSyncMgrSyncItems extends IUnknown {
    /**
     * The interface identifier for IEnumSyncMgrSyncItems
     * @type {Guid}
     */
    static IID := Guid("{54b3abf3-f085-4181-b546-e29c403c726b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEnumSyncMgrSyncItems interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Next  : IntPtr
        Skip  : IntPtr
        Reset : IntPtr
        Clone : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEnumSyncMgrSyncItems.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the next batch of sync items from the handler.
     * @param {Integer} celt Type: <b>ULONG</b>
     * 
     * This value must be 1.
     * @param {Pointer<ISyncMgrSyncItem>} rgelt Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-isyncmgrsyncitem">ISyncMgrSyncItem</a>**</b>
     * 
     * The address of an <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-isyncmgrsyncitem">ISyncMgrSyncItem</a> interface pointer.
     * @param {Pointer<Integer>} pceltFetched Type: <b>ULONG*</b>
     * 
     * A pointer to the number of items fetched.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-ienumsyncmgrsyncitems-next
     */
    Next(celt, rgelt, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, ISyncMgrSyncItem.Ptr, rgelt, pceltFetchedMarshal, pceltFetched, "HRESULT")
        return result
    }

    /**
     * Skips forward in the enumeration the specified number of items.
     * @param {Integer} celt Type: <b>ULONG</b>
     * 
     * The number of items to skip.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-ienumsyncmgrsyncitems-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * Resets the current position in the enumeration to 0.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-ienumsyncmgrsyncitems-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Not used. Clones an IEnumSyncMgrSyncItems object.
     * @returns {IEnumSyncMgrSyncItems} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-ienumsyncmgrsyncitems">IEnumSyncMgrSyncItems</a>**</b>
     * 
     * The address of the cloned <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-ienumsyncmgrsyncitems">IEnumSyncMgrSyncItems</a> interface pointer.
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-ienumsyncmgrsyncitems-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppenum := 0, "HRESULT")
        return IEnumSyncMgrSyncItems(ppenum)
    }

    Query(iid) {
        if (IEnumSyncMgrSyncItems.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Next := CallbackCreate(GetMethod(implObj, "Next"), flags, 4)
        this.vtbl.Skip := CallbackCreate(GetMethod(implObj, "Skip"), flags, 2)
        this.vtbl.Reset := CallbackCreate(GetMethod(implObj, "Reset"), flags, 1)
        this.vtbl.Clone := CallbackCreate(GetMethod(implObj, "Clone"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Next)
        CallbackFree(this.vtbl.Skip)
        CallbackFree(this.vtbl.Reset)
        CallbackFree(this.vtbl.Clone)
    }
}
