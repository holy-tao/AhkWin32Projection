#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IUnknown.ahk" { IUnknown }

/**
 * Provides a semaphore that can be used to provide temporarily exclusive access to a shared resource such as a file.
 * @see https://learn.microsoft.com/windows/win32/api/objidl/nn-objidl-iblockinglock
 * @namespace Windows.Win32.System.Com
 */
export default struct IBlockingLock extends IUnknown {
    /**
     * The interface identifier for IBlockingLock
     * @type {Guid}
     */
    static IID := Guid("{30f3d47a-6447-11d1-8e3c-00c04fb9386d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBlockingLock interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Lock   : IntPtr
        Unlock : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBlockingLock.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Requests a lock on a shared resource.
     * @param {Integer} dwTimeout The time interval after which the attempted lock operation fails.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-iblockinglock-lock
     */
    Lock(dwTimeout) {
        result := ComCall(3, this, "uint", dwTimeout, "HRESULT")
        return result
    }

    /**
     * Releases a lock on a shared resource.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-iblockinglock-unlock
     */
    Unlock() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IBlockingLock.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Lock := CallbackCreate(GetMethod(implObj, "Lock"), flags, 2)
        this.vtbl.Unlock := CallbackCreate(GetMethod(implObj, "Unlock"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Lock)
        CallbackFree(this.vtbl.Unlock)
    }
}
