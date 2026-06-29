#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IRTCProfile.ahk" { IRTCProfile }

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 */
export default struct IRTCProfile2 extends IRTCProfile {
    /**
     * The interface identifier for IRTCProfile2
     * @type {Guid}
     */
    static IID := Guid("{4b81f84e-bdc7-4184-9154-3cb2dd7917fb}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRTCProfile2 interfaces
    */
    struct Vtbl extends IRTCProfile.Vtbl {
        get_Realm       : IntPtr
        put_Realm       : IntPtr
        get_AllowedAuth : IntPtr
        put_AllowedAuth : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRTCProfile2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    Realm {
        get => this.get_Realm()
        set => this.put_Realm(value)
    }

    /**
     * @type {Integer} 
     */
    AllowedAuth {
        get => this.get_AllowedAuth()
        set => this.put_AllowedAuth(value)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Realm() {
        pbstrRealm := BSTR.Owned()
        result := ComCall(21, this, BSTR.Ptr, pbstrRealm, "HRESULT")
        return pbstrRealm
    }

    /**
     * 
     * @param {BSTR} bstrRealm 
     * @returns {HRESULT} 
     */
    put_Realm(bstrRealm) {
        bstrRealm := bstrRealm is String ? BSTR.Alloc(bstrRealm).Value : bstrRealm

        result := ComCall(22, this, BSTR, bstrRealm, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AllowedAuth() {
        result := ComCall(23, this, "int*", &plAllowedAuth := 0, "HRESULT")
        return plAllowedAuth
    }

    /**
     * 
     * @param {Integer} lAllowedAuth 
     * @returns {HRESULT} 
     */
    put_AllowedAuth(lAllowedAuth) {
        result := ComCall(24, this, "int", lAllowedAuth, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRTCProfile2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Realm := CallbackCreate(GetMethod(implObj, "get_Realm"), flags, 2)
        this.vtbl.put_Realm := CallbackCreate(GetMethod(implObj, "put_Realm"), flags, 2)
        this.vtbl.get_AllowedAuth := CallbackCreate(GetMethod(implObj, "get_AllowedAuth"), flags, 2)
        this.vtbl.put_AllowedAuth := CallbackCreate(GetMethod(implObj, "put_AllowedAuth"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Realm)
        CallbackFree(this.vtbl.put_Realm)
        CallbackFree(this.vtbl.get_AllowedAuth)
        CallbackFree(this.vtbl.put_AllowedAuth)
    }
}
