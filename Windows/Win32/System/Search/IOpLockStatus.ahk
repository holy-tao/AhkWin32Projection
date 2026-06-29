#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides methods to check the opportunistic lock that is used by Microsoft Windows Desktop Search (WDS) on items while indexing.
 * @see https://learn.microsoft.com/windows/win32/api/searchapi/nn-searchapi-ioplockstatus
 * @namespace Windows.Win32.System.Search
 */
export default struct IOpLockStatus extends IUnknown {
    /**
     * The interface identifier for IOpLockStatus
     * @type {Guid}
     */
    static IID := Guid("{c731065d-ac80-11d1-8df3-00c04fb6ef4f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IOpLockStatus interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        IsOplockValid        : IntPtr
        IsOplockBroken       : IntPtr
        GetOplockEventHandle : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IOpLockStatus.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Checks the status of the opportunistic lock (OpLock) on the item being indexed. (IOpLockStatus.IsOplockValid)
     * @remarks
     * An OpLock is an opportunistic lock that allows the indexer to lock the item when another process is not accessing it. The indexer releases the item, invalidating or breaking the lock, when another process requests an incompatible access mode. This enables the indexer to run in the background and not impede access to these items by other processes.
     * 
     * An OpLock is never taken after the underlying <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-iurlaccessor">IUrlAccessor</a> object is initialized, and any call to this method yields the same output value on the same object.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * Receives a pointer to a <b>BOOL</b> value that indicates whether the OpLock is successfully taken.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-ioplockstatus-isoplockvalid
     */
    IsOplockValid() {
        result := ComCall(3, this, BOOL.Ptr, &pfIsOplockValid := 0, "HRESULT")
        return pfIsOplockValid
    }

    /**
     * Checks the status of the opportunistic lock (OpLock) on the item being indexed. (IOpLockStatus.IsOplockBroken)
     * @remarks
     * An OpLock is an opportunistic lock that allows the indexer to lock the item when another process isn't accessing it. The indexer releases the item, invalidating or breaking the lock, when another process requests an incompatible access mode. This enables the indexer to run in the background and not impede access to these items by other processes.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * Receives a pointer to a <b>BOOL</b> value that indicates whether the OpLock is broken: <b>TRUE</b> if OpLock was taken and then broken, <b>FALSE</b> otherwise (including the case when OpLock was not taken).
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-ioplockstatus-isoplockbroken
     */
    IsOplockBroken() {
        result := ComCall(4, this, BOOL.Ptr, &pfIsOplockBroken := 0, "HRESULT")
        return pfIsOplockBroken
    }

    /**
     * Gets the event handle of the opportunistic lock (OpLock). The event object is set to the signaled state when the OpLock is broken, enabling the indexer to stop all operations on the underlying IUrlAccessor object.
     * @returns {HANDLE} Type: <b>HANDLE*</b>
     * 
     * Receives a pointer to the handle of the event associated with the OpLock, or <b>NULL</b> if no OpLock was taken.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-ioplockstatus-getoplockeventhandle
     */
    GetOplockEventHandle() {
        phOplockEv := HANDLE.Owned()
        result := ComCall(5, this, HANDLE.Ptr, phOplockEv, "HRESULT")
        return phOplockEv
    }

    Query(iid) {
        if (IOpLockStatus.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.IsOplockValid := CallbackCreate(GetMethod(implObj, "IsOplockValid"), flags, 2)
        this.vtbl.IsOplockBroken := CallbackCreate(GetMethod(implObj, "IsOplockBroken"), flags, 2)
        this.vtbl.GetOplockEventHandle := CallbackCreate(GetMethod(implObj, "GetOplockEventHandle"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.IsOplockValid)
        CallbackFree(this.vtbl.IsOplockBroken)
        CallbackFree(this.vtbl.GetOplockEventHandle)
    }
}
