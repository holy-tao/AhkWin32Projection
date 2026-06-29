#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IHostTask.ahk" { IHostTask }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
export default struct ICLRSyncManager extends IUnknown {
    /**
     * The interface identifier for ICLRSyncManager
     * @type {Guid}
     */
    static IID := Guid("{55ff199d-ad21-48f9-a16c-f24ebbb8727d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICLRSyncManager interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetMonitorOwner           : IntPtr
        CreateRWLockOwnerIterator : IntPtr
        GetRWLockOwnerNext        : IntPtr
        DeleteRWLockOwnerIterator : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICLRSyncManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer} Cookie 
     * @returns {IHostTask} 
     */
    GetMonitorOwner(Cookie) {
        result := ComCall(3, this, "ptr", Cookie, "ptr*", &ppOwnerHostTask := 0, "HRESULT")
        return IHostTask(ppOwnerHostTask)
    }

    /**
     * 
     * @param {Pointer} Cookie 
     * @returns {Pointer} 
     */
    CreateRWLockOwnerIterator(Cookie) {
        result := ComCall(4, this, "ptr", Cookie, "ptr*", &pIterator := 0, "HRESULT")
        return pIterator
    }

    /**
     * 
     * @param {Pointer} Iterator 
     * @returns {IHostTask} 
     */
    GetRWLockOwnerNext(Iterator) {
        result := ComCall(5, this, "ptr", Iterator, "ptr*", &ppOwnerHostTask := 0, "HRESULT")
        return IHostTask(ppOwnerHostTask)
    }

    /**
     * 
     * @param {Pointer} Iterator 
     * @returns {HRESULT} 
     */
    DeleteRWLockOwnerIterator(Iterator) {
        result := ComCall(6, this, "ptr", Iterator, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICLRSyncManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetMonitorOwner := CallbackCreate(GetMethod(implObj, "GetMonitorOwner"), flags, 3)
        this.vtbl.CreateRWLockOwnerIterator := CallbackCreate(GetMethod(implObj, "CreateRWLockOwnerIterator"), flags, 3)
        this.vtbl.GetRWLockOwnerNext := CallbackCreate(GetMethod(implObj, "GetRWLockOwnerNext"), flags, 3)
        this.vtbl.DeleteRWLockOwnerIterator := CallbackCreate(GetMethod(implObj, "DeleteRWLockOwnerIterator"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetMonitorOwner)
        CallbackFree(this.vtbl.CreateRWLockOwnerIterator)
        CallbackFree(this.vtbl.GetRWLockOwnerNext)
        CallbackFree(this.vtbl.DeleteRWLockOwnerIterator)
    }
}
