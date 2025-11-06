#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Iis
 * @version v4.0.30319
 */
class AsyncIFtpAuthorizationProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for AsyncIFtpAuthorizationProvider
     * @type {Guid}
     */
    static IID => Guid("{860dc339-07e5-4a5c-9c61-8820cea012bc}")

    /**
     * The class identifier for AsyncIFtpAuthorizationProvider
     * @type {Guid}
     */
    static CLSID => Guid("{860dc339-07e5-4a5c-9c61-8820cea012bc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Begin_GetUserAccessPermission", "Finish_GetUserAccessPermission"]

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
     * @returns {Integer} 
     */
    Finish_GetUserAccessPermission() {
        result := ComCall(4, this, "int*", &pFtpAccess := 0, "HRESULT")
        return pFtpAccess
    }
}
