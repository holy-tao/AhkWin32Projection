#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity.Provider
 */
export default struct AsyncIIdentityStoreEx extends IUnknown {
    /**
     * The interface identifier for AsyncIIdentityStoreEx
     * @type {Guid}
     */
    static IID := Guid("{fca3af9a-8a07-4eae-8632-ec3de658a36a}")

    /**
     * The class identifier for AsyncIIdentityStoreEx
     * @type {Guid}
     */
    static CLSID := Guid("{fca3af9a-8a07-4eae-8632-ec3de658a36a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for AsyncIIdentityStoreEx interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Begin_CreateConnectedIdentity  : IntPtr
        Finish_CreateConnectedIdentity : IntPtr
        Begin_DeleteConnectedIdentity  : IntPtr
        Finish_DeleteConnectedIdentity : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := AsyncIIdentityStoreEx.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} LocalName 
     * @param {PWSTR} ConnectedName 
     * @param {Pointer<Guid>} ProviderGUID 
     * @returns {HRESULT} 
     */
    Begin_CreateConnectedIdentity(LocalName, ConnectedName, ProviderGUID) {
        LocalName := LocalName is String ? StrPtr(LocalName) : LocalName
        ConnectedName := ConnectedName is String ? StrPtr(ConnectedName) : ConnectedName

        result := ComCall(3, this, "ptr", LocalName, "ptr", ConnectedName, Guid.Ptr, ProviderGUID, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Finish_CreateConnectedIdentity() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} ConnectedName 
     * @param {Pointer<Guid>} ProviderGUID 
     * @returns {HRESULT} 
     */
    Begin_DeleteConnectedIdentity(ConnectedName, ProviderGUID) {
        ConnectedName := ConnectedName is String ? StrPtr(ConnectedName) : ConnectedName

        result := ComCall(5, this, "ptr", ConnectedName, Guid.Ptr, ProviderGUID, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Finish_DeleteConnectedIdentity() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (AsyncIIdentityStoreEx.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Begin_CreateConnectedIdentity := CallbackCreate(GetMethod(implObj, "Begin_CreateConnectedIdentity"), flags, 4)
        this.vtbl.Finish_CreateConnectedIdentity := CallbackCreate(GetMethod(implObj, "Finish_CreateConnectedIdentity"), flags, 1)
        this.vtbl.Begin_DeleteConnectedIdentity := CallbackCreate(GetMethod(implObj, "Begin_DeleteConnectedIdentity"), flags, 3)
        this.vtbl.Finish_DeleteConnectedIdentity := CallbackCreate(GetMethod(implObj, "Finish_DeleteConnectedIdentity"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Begin_CreateConnectedIdentity)
        CallbackFree(this.vtbl.Finish_CreateConnectedIdentity)
        CallbackFree(this.vtbl.Begin_DeleteConnectedIdentity)
        CallbackFree(this.vtbl.Finish_DeleteConnectedIdentity)
    }
}
