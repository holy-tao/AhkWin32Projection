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
export default struct IFtpAuthorizationProvider extends IUnknown {
    /**
     * The interface identifier for IFtpAuthorizationProvider
     * @type {Guid}
     */
    static IID := Guid("{a50ae7a1-a35a-42b4-a4f3-f4f7057a05d1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFtpAuthorizationProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetUserAccessPermission : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFtpAuthorizationProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} pszSessionId 
     * @param {PWSTR} pszSiteName 
     * @param {PWSTR} pszVirtualPath 
     * @param {PWSTR} pszUserName 
     * @returns {FTP_ACCESS} 
     */
    GetUserAccessPermission(pszSessionId, pszSiteName, pszVirtualPath, pszUserName) {
        pszSessionId := pszSessionId is String ? StrPtr(pszSessionId) : pszSessionId
        pszSiteName := pszSiteName is String ? StrPtr(pszSiteName) : pszSiteName
        pszVirtualPath := pszVirtualPath is String ? StrPtr(pszVirtualPath) : pszVirtualPath
        pszUserName := pszUserName is String ? StrPtr(pszUserName) : pszUserName

        result := ComCall(3, this, "ptr", pszSessionId, "ptr", pszSiteName, "ptr", pszVirtualPath, "ptr", pszUserName, "int*", &pFtpAccess := 0, "HRESULT")
        return pFtpAccess
    }

    Query(iid) {
        if (IFtpAuthorizationProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetUserAccessPermission := CallbackCreate(GetMethod(implObj, "GetUserAccessPermission"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetUserAccessPermission)
    }
}
