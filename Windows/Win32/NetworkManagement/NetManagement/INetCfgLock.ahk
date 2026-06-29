#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct INetCfgLock extends IUnknown {
    /**
     * The interface identifier for INetCfgLock
     * @type {Guid}
     */
    static IID := Guid("{c0e8ae9f-306e-11d1-aacf-00805fc1270e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for INetCfgLock interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AcquireWriteLock : IntPtr
        ReleaseWriteLock : IntPtr
        IsWriteLocked    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := INetCfgLock.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} cmsTimeout 
     * @param {PWSTR} pszwClientDescription 
     * @returns {PWSTR} 
     */
    AcquireWriteLock(cmsTimeout, pszwClientDescription) {
        pszwClientDescription := pszwClientDescription is String ? StrPtr(pszwClientDescription) : pszwClientDescription

        result := ComCall(3, this, "uint", cmsTimeout, "ptr", pszwClientDescription, PWSTR.Ptr, &ppszwClientDescription := 0, "HRESULT")
        return ppszwClientDescription
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ReleaseWriteLock() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    IsWriteLocked() {
        result := ComCall(5, this, PWSTR.Ptr, &ppszwClientDescription := 0, "HRESULT")
        return ppszwClientDescription
    }

    Query(iid) {
        if (INetCfgLock.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AcquireWriteLock := CallbackCreate(GetMethod(implObj, "AcquireWriteLock"), flags, 4)
        this.vtbl.ReleaseWriteLock := CallbackCreate(GetMethod(implObj, "ReleaseWriteLock"), flags, 1)
        this.vtbl.IsWriteLocked := CallbackCreate(GetMethod(implObj, "IsWriteLocked"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AcquireWriteLock)
        CallbackFree(this.vtbl.ReleaseWriteLock)
        CallbackFree(this.vtbl.IsWriteLocked)
    }
}
