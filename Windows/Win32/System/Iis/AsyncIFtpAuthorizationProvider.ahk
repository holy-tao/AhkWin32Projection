#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Iis
 * @version v4.0.30319
 */
class AsyncIFtpAuthorizationProvider extends IUnknown{
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

        result := ComCall(3, this, "ptr", pszSessionId, "ptr", pszSiteName, "ptr", pszVirtualPath, "ptr", pszUserName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pFtpAccess 
     * @returns {HRESULT} 
     */
    Finish_GetUserAccessPermission(pFtpAccess) {
        result := ComCall(4, this, "int*", pFtpAccess, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
