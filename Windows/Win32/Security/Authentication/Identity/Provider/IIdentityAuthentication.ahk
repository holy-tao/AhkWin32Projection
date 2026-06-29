#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\UI\Shell\PropertiesSystem\IPropertyStore.ahk" { IPropertyStore }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity.Provider
 */
export default struct IIdentityAuthentication extends IUnknown {
    /**
     * The interface identifier for IIdentityAuthentication
     * @type {Guid}
     */
    static IID := Guid("{5e7ef254-979f-43b5-b74e-06e4eb7df0f9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IIdentityAuthentication interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetIdentityCredential      : IntPtr
        ValidateIdentityCredential : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IIdentityAuthentication.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Integer>} CredBuffer 
     * @param {Integer} CredBufferLength 
     * @returns {HRESULT} 
     */
    SetIdentityCredential(CredBuffer, CredBufferLength) {
        CredBufferMarshal := CredBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, CredBufferMarshal, CredBuffer, "uint", CredBufferLength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} CredBuffer 
     * @param {Integer} CredBufferLength 
     * @param {Pointer<IPropertyStore>} ppIdentityProperties 
     * @returns {HRESULT} 
     */
    ValidateIdentityCredential(CredBuffer, CredBufferLength, ppIdentityProperties) {
        CredBufferMarshal := CredBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, CredBufferMarshal, CredBuffer, "uint", CredBufferLength, IPropertyStore.Ptr, ppIdentityProperties, "HRESULT")
        return result
    }

    Query(iid) {
        if (IIdentityAuthentication.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetIdentityCredential := CallbackCreate(GetMethod(implObj, "SetIdentityCredential"), flags, 3)
        this.vtbl.ValidateIdentityCredential := CallbackCreate(GetMethod(implObj, "ValidateIdentityCredential"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetIdentityCredential)
        CallbackFree(this.vtbl.ValidateIdentityCredential)
    }
}
