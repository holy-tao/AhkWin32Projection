#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\WbemImpersonationLevelEnum.ahk" { WbemImpersonationLevelEnum }
#Import ".\ISWbemPrivilegeSet.ahk" { ISWbemPrivilegeSet }
#Import ".\WbemAuthenticationLevelEnum.ahk" { WbemAuthenticationLevelEnum }

/**
 * @namespace Windows.Win32.System.Wmi
 */
export default struct ISWbemSecurity extends IDispatch {
    /**
     * The interface identifier for ISWbemSecurity
     * @type {Guid}
     */
    static IID := Guid("{b54d66e6-2287-11d2-8b33-00600806d9b6}")

    /**
     * The class identifier for SWbemSecurity
     * @type {Guid}
     */
    static CLSID := Guid("{b54d66e9-2287-11d2-8b33-00600806d9b6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISWbemSecurity interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_ImpersonationLevel  : IntPtr
        put_ImpersonationLevel  : IntPtr
        get_AuthenticationLevel : IntPtr
        put_AuthenticationLevel : IntPtr
        get_Privileges          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISWbemSecurity.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {WbemImpersonationLevelEnum} 
     */
    ImpersonationLevel {
        get => this.get_ImpersonationLevel()
        set => this.put_ImpersonationLevel(value)
    }

    /**
     * @type {WbemAuthenticationLevelEnum} 
     */
    AuthenticationLevel {
        get => this.get_AuthenticationLevel()
        set => this.put_AuthenticationLevel(value)
    }

    /**
     * @type {ISWbemPrivilegeSet} 
     */
    Privileges {
        get => this.get_Privileges()
    }

    /**
     * 
     * @returns {WbemImpersonationLevelEnum} 
     */
    get_ImpersonationLevel() {
        result := ComCall(7, this, "int*", &iImpersonationLevel := 0, "HRESULT")
        return iImpersonationLevel
    }

    /**
     * 
     * @param {WbemImpersonationLevelEnum} iImpersonationLevel 
     * @returns {HRESULT} 
     */
    put_ImpersonationLevel(iImpersonationLevel) {
        result := ComCall(8, this, WbemImpersonationLevelEnum, iImpersonationLevel, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {WbemAuthenticationLevelEnum} 
     */
    get_AuthenticationLevel() {
        result := ComCall(9, this, "int*", &iAuthenticationLevel := 0, "HRESULT")
        return iAuthenticationLevel
    }

    /**
     * 
     * @param {WbemAuthenticationLevelEnum} iAuthenticationLevel 
     * @returns {HRESULT} 
     */
    put_AuthenticationLevel(iAuthenticationLevel) {
        result := ComCall(10, this, WbemAuthenticationLevelEnum, iAuthenticationLevel, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISWbemPrivilegeSet} 
     */
    get_Privileges() {
        result := ComCall(11, this, "ptr*", &objWbemPrivilegeSet := 0, "HRESULT")
        return ISWbemPrivilegeSet(objWbemPrivilegeSet)
    }

    Query(iid) {
        if (ISWbemSecurity.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_ImpersonationLevel := CallbackCreate(GetMethod(implObj, "get_ImpersonationLevel"), flags, 2)
        this.vtbl.put_ImpersonationLevel := CallbackCreate(GetMethod(implObj, "put_ImpersonationLevel"), flags, 2)
        this.vtbl.get_AuthenticationLevel := CallbackCreate(GetMethod(implObj, "get_AuthenticationLevel"), flags, 2)
        this.vtbl.put_AuthenticationLevel := CallbackCreate(GetMethod(implObj, "put_AuthenticationLevel"), flags, 2)
        this.vtbl.get_Privileges := CallbackCreate(GetMethod(implObj, "get_Privileges"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_ImpersonationLevel)
        CallbackFree(this.vtbl.put_ImpersonationLevel)
        CallbackFree(this.vtbl.get_AuthenticationLevel)
        CallbackFree(this.vtbl.put_AuthenticationLevel)
        CallbackFree(this.vtbl.get_Privileges)
    }
}
