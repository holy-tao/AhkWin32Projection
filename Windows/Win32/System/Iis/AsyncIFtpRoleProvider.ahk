#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Iis
 */
export default struct AsyncIFtpRoleProvider extends IUnknown {
    /**
     * The interface identifier for AsyncIFtpRoleProvider
     * @type {Guid}
     */
    static IID := Guid("{3e83bf99-70ec-41ca-84b6-aca7c7a62caf}")

    /**
     * The class identifier for AsyncIFtpRoleProvider
     * @type {Guid}
     */
    static CLSID := Guid("{3e83bf99-70ec-41ca-84b6-aca7c7a62caf}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for AsyncIFtpRoleProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Begin_IsUserInRole  : IntPtr
        Finish_IsUserInRole : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := AsyncIFtpRoleProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} pszSessionId 
     * @param {PWSTR} pszSiteName 
     * @param {PWSTR} pszUserName 
     * @param {PWSTR} pszRole 
     * @returns {HRESULT} 
     */
    Begin_IsUserInRole(pszSessionId, pszSiteName, pszUserName, pszRole) {
        pszSessionId := pszSessionId is String ? StrPtr(pszSessionId) : pszSessionId
        pszSiteName := pszSiteName is String ? StrPtr(pszSiteName) : pszSiteName
        pszUserName := pszUserName is String ? StrPtr(pszUserName) : pszUserName
        pszRole := pszRole is String ? StrPtr(pszRole) : pszRole

        result := ComCall(3, this, "ptr", pszSessionId, "ptr", pszSiteName, "ptr", pszUserName, "ptr", pszRole, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    Finish_IsUserInRole() {
        result := ComCall(4, this, BOOL.Ptr, &pfIsInRole := 0, "HRESULT")
        return pfIsInRole
    }

    Query(iid) {
        if (AsyncIFtpRoleProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Begin_IsUserInRole := CallbackCreate(GetMethod(implObj, "Begin_IsUserInRole"), flags, 5)
        this.vtbl.Finish_IsUserInRole := CallbackCreate(GetMethod(implObj, "Finish_IsUserInRole"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Begin_IsUserInRole)
        CallbackFree(this.vtbl.Finish_IsUserInRole)
    }
}
