#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\UI\Shell\PropertiesSystem\IPropertyStore.ahk" { IPropertyStore }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity.Provider
 */
export default struct AsyncIIdentityAuthentication extends IUnknown {
    /**
     * The interface identifier for AsyncIIdentityAuthentication
     * @type {Guid}
     */
    static IID := Guid("{f9a2f918-feca-4e9c-9633-61cbf13ed34d}")

    /**
     * The class identifier for AsyncIIdentityAuthentication
     * @type {Guid}
     */
    static CLSID := Guid("{f9a2f918-feca-4e9c-9633-61cbf13ed34d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for AsyncIIdentityAuthentication interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Begin_SetIdentityCredential       : IntPtr
        Finish_SetIdentityCredential      : IntPtr
        Begin_ValidateIdentityCredential  : IntPtr
        Finish_ValidateIdentityCredential : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := AsyncIIdentityAuthentication.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Integer>} CredBuffer 
     * @param {Integer} CredBufferLength 
     * @returns {HRESULT} 
     */
    Begin_SetIdentityCredential(CredBuffer, CredBufferLength) {
        CredBufferMarshal := CredBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, CredBufferMarshal, CredBuffer, "uint", CredBufferLength, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Finish_SetIdentityCredential() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} CredBuffer 
     * @param {Integer} CredBufferLength 
     * @param {Pointer<IPropertyStore>} ppIdentityProperties 
     * @returns {HRESULT} 
     */
    Begin_ValidateIdentityCredential(CredBuffer, CredBufferLength, ppIdentityProperties) {
        CredBufferMarshal := CredBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(5, this, CredBufferMarshal, CredBuffer, "uint", CredBufferLength, IPropertyStore.Ptr, ppIdentityProperties, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IPropertyStore>} ppIdentityProperties 
     * @returns {HRESULT} 
     */
    Finish_ValidateIdentityCredential(ppIdentityProperties) {
        result := ComCall(6, this, IPropertyStore.Ptr, ppIdentityProperties, "HRESULT")
        return result
    }

    Query(iid) {
        if (AsyncIIdentityAuthentication.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Begin_SetIdentityCredential := CallbackCreate(GetMethod(implObj, "Begin_SetIdentityCredential"), flags, 3)
        this.vtbl.Finish_SetIdentityCredential := CallbackCreate(GetMethod(implObj, "Finish_SetIdentityCredential"), flags, 1)
        this.vtbl.Begin_ValidateIdentityCredential := CallbackCreate(GetMethod(implObj, "Begin_ValidateIdentityCredential"), flags, 4)
        this.vtbl.Finish_ValidateIdentityCredential := CallbackCreate(GetMethod(implObj, "Finish_ValidateIdentityCredential"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Begin_SetIdentityCredential)
        CallbackFree(this.vtbl.Finish_SetIdentityCredential)
        CallbackFree(this.vtbl.Begin_ValidateIdentityCredential)
        CallbackFree(this.vtbl.Finish_ValidateIdentityCredential)
    }
}
