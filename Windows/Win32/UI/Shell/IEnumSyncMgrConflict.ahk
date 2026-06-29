#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISyncMgrConflict.ahk" { ISyncMgrConflict }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes conflict enumeration methods.
 * @remarks
 * A conflict store returns a pointer to an <b>IEnumSyncMgrConflict</b> interface from <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrconflictstore-enumconflicts">ISyncMgrConflictStore::EnumConflicts</a>.
 * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nn-syncmgr-ienumsyncmgrconflict
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IEnumSyncMgrConflict extends IUnknown {
    /**
     * The interface identifier for IEnumSyncMgrConflict
     * @type {Guid}
     */
    static IID := Guid("{82705914-dda3-4893-ba99-49de6c8c8036}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEnumSyncMgrConflict interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Next  : IntPtr
        Skip  : IntPtr
        Reset : IntPtr
        Clone : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEnumSyncMgrConflict.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the next batch of conflicts from the conflicts store.
     * @param {Integer} celt Type: <b>ULONG</b>
     * 
     * The value must be 1.
     * @param {Pointer<ISyncMgrConflict>} rgelt Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-isyncmgrconflict">ISyncMgrConflict</a>**</b>
     * 
     * The address of an <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-isyncmgrconflict">ISyncMgrConflict</a> interface pointer.
     * @param {Pointer<Integer>} pceltFetched Type: <b>ULONG*</b>
     * 
     * A pointer to the number of conflicts fetched.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-ienumsyncmgrconflict-next
     */
    Next(celt, rgelt, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, ISyncMgrConflict.Ptr, rgelt, pceltFetchedMarshal, pceltFetched, "HRESULT")
        return result
    }

    /**
     * Skips forward the specified number of conflicts in the enumeration.
     * @param {Integer} celt Type: <b>ULONG</b>
     * 
     * The number of conflicts to skip.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-ienumsyncmgrconflict-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * Resets the current position in the enumeration to zero.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-ienumsyncmgrconflict-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Not used. Clones an IEnumSyncMgrConflict object.
     * @returns {IEnumSyncMgrConflict} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-ienumsyncmgrconflict">IEnumSyncMgrConflict</a>**</b>
     * 
     * The address of the cloned <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-ienumsyncmgrconflict">IEnumSyncMgrConflict</a> interface pointer.
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-ienumsyncmgrconflict-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppenum := 0, "HRESULT")
        return IEnumSyncMgrConflict(ppenum)
    }

    Query(iid) {
        if (IEnumSyncMgrConflict.IID.Equals(iid)) {
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
