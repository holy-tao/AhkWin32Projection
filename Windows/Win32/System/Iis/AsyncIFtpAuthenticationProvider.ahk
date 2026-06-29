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
export default struct AsyncIFtpAuthenticationProvider extends IUnknown {
    /**
     * The interface identifier for AsyncIFtpAuthenticationProvider
     * @type {Guid}
     */
    static IID := Guid("{c24efb65-9f3e-4996-8fb1-ce166916bab5}")

    /**
     * The class identifier for AsyncIFtpAuthenticationProvider
     * @type {Guid}
     */
    static CLSID := Guid("{c24efb65-9f3e-4996-8fb1-ce166916bab5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for AsyncIFtpAuthenticationProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Begin_AuthenticateUser  : IntPtr
        Finish_AuthenticateUser : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := AsyncIFtpAuthenticationProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} pszSessionId 
     * @param {PWSTR} pszSiteName 
     * @param {PWSTR} pszUserName 
     * @param {PWSTR} pszPassword 
     * @returns {HRESULT} 
     */
    Begin_AuthenticateUser(pszSessionId, pszSiteName, pszUserName, pszPassword) {
        pszSessionId := pszSessionId is String ? StrPtr(pszSessionId) : pszSessionId
        pszSiteName := pszSiteName is String ? StrPtr(pszSiteName) : pszSiteName
        pszUserName := pszUserName is String ? StrPtr(pszUserName) : pszUserName
        pszPassword := pszPassword is String ? StrPtr(pszPassword) : pszPassword

        result := ComCall(3, this, "ptr", pszSessionId, "ptr", pszSiteName, "ptr", pszUserName, "ptr", pszPassword, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszCanonicalUserName 
     * @param {Pointer<BOOL>} pfAuthenticated 
     * @returns {HRESULT} 
     */
    Finish_AuthenticateUser(ppszCanonicalUserName, pfAuthenticated) {
        ppszCanonicalUserNameMarshal := ppszCanonicalUserName is VarRef ? "ptr*" : "ptr"
        pfAuthenticatedMarshal := pfAuthenticated is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, ppszCanonicalUserNameMarshal, ppszCanonicalUserName, pfAuthenticatedMarshal, pfAuthenticated, "HRESULT")
        return result
    }

    Query(iid) {
        if (AsyncIFtpAuthenticationProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Begin_AuthenticateUser := CallbackCreate(GetMethod(implObj, "Begin_AuthenticateUser"), flags, 5)
        this.vtbl.Finish_AuthenticateUser := CallbackCreate(GetMethod(implObj, "Finish_AuthenticateUser"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Begin_AuthenticateUser)
        CallbackFree(this.vtbl.Finish_AuthenticateUser)
    }
}
