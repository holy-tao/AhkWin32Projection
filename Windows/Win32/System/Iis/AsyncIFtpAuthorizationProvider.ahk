#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\FTP_ACCESS.ahk" { FTP_ACCESS }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Iis
 */
export default struct AsyncIFtpAuthorizationProvider extends IUnknown {
    /**
     * The interface identifier for AsyncIFtpAuthorizationProvider
     * @type {Guid}
     */
    static IID := Guid("{860dc339-07e5-4a5c-9c61-8820cea012bc}")

    /**
     * The class identifier for AsyncIFtpAuthorizationProvider
     * @type {Guid}
     */
    static CLSID := Guid("{860dc339-07e5-4a5c-9c61-8820cea012bc}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for AsyncIFtpAuthorizationProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Begin_GetUserAccessPermission  : IntPtr
        Finish_GetUserAccessPermission : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := AsyncIFtpAuthorizationProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} pszSessionId 
     * @param {PWSTR} pszSiteName 
     * @param {PWSTR} pszVirtualPath 
     * @param {PWSTR} pszUserName 
     * @returns {HRESULT} 
     */
    Begin_GetUserAccessPermission(pszSessionId, pszSiteName, pszVirtualPath, pszUserName) {
        pszSessionId := pszSessionId is String ? StrPtr(pszSessionId) : pszSessionId
        pszSiteName := pszSiteName is String ? StrPtr(pszSiteName) : pszSiteName
        pszVirtualPath := pszVirtualPath is String ? StrPtr(pszVirtualPath) : pszVirtualPath
        pszUserName := pszUserName is String ? StrPtr(pszUserName) : pszUserName

        result := ComCall(3, this, "ptr", pszSessionId, "ptr", pszSiteName, "ptr", pszVirtualPath, "ptr", pszUserName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {FTP_ACCESS} 
     */
    Finish_GetUserAccessPermission() {
        result := ComCall(4, this, "int*", &pFtpAccess := 0, "HRESULT")
        return pFtpAccess
    }

    Query(iid) {
        if (AsyncIFtpAuthorizationProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Begin_GetUserAccessPermission := CallbackCreate(GetMethod(implObj, "Begin_GetUserAccessPermission"), flags, 5)
        this.vtbl.Finish_GetUserAccessPermission := CallbackCreate(GetMethod(implObj, "Finish_GetUserAccessPermission"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Begin_GetUserAccessPermission)
        CallbackFree(this.vtbl.Finish_GetUserAccessPermission)
    }
}
