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
export default struct IFtpAuthenticationProvider extends IUnknown {
    /**
     * The interface identifier for IFtpAuthenticationProvider
     * @type {Guid}
     */
    static IID := Guid("{4659f95c-d5a8-4707-b2fc-6fd5794246cf}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFtpAuthenticationProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AuthenticateUser : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFtpAuthenticationProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} pszSessionId 
     * @param {PWSTR} pszSiteName 
     * @param {PWSTR} pszUserName 
     * @param {PWSTR} pszPassword 
     * @param {Pointer<PWSTR>} ppszCanonicalUserName 
     * @param {Pointer<BOOL>} pfAuthenticated 
     * @returns {HRESULT} 
     */
    AuthenticateUser(pszSessionId, pszSiteName, pszUserName, pszPassword, ppszCanonicalUserName, pfAuthenticated) {
        pszSessionId := pszSessionId is String ? StrPtr(pszSessionId) : pszSessionId
        pszSiteName := pszSiteName is String ? StrPtr(pszSiteName) : pszSiteName
        pszUserName := pszUserName is String ? StrPtr(pszUserName) : pszUserName
        pszPassword := pszPassword is String ? StrPtr(pszPassword) : pszPassword

        ppszCanonicalUserNameMarshal := ppszCanonicalUserName is VarRef ? "ptr*" : "ptr"
        pfAuthenticatedMarshal := pfAuthenticated is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", pszSessionId, "ptr", pszSiteName, "ptr", pszUserName, "ptr", pszPassword, ppszCanonicalUserNameMarshal, ppszCanonicalUserName, pfAuthenticatedMarshal, pfAuthenticated, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFtpAuthenticationProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AuthenticateUser := CallbackCreate(GetMethod(implObj, "AuthenticateUser"), flags, 7)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AuthenticateUser)
    }
}
