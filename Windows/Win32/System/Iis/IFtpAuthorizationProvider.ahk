#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Iis
 * @version v4.0.30319
 */
class IFtpAuthorizationProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFtpAuthorizationProvider
     * @type {Guid}
     */
    static IID => Guid("{a50ae7a1-a35a-42b4-a4f3-f4f7057a05d1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetUserAccessPermission"]

    /**
     * 
     * @param {PWSTR} pszSessionId 
     * @param {PWSTR} pszSiteName 
     * @param {PWSTR} pszVirtualPath 
     * @param {PWSTR} pszUserName 
     * @param {Pointer<Integer>} pFtpAccess 
     * @returns {HRESULT} 
     */
    GetUserAccessPermission(pszSessionId, pszSiteName, pszVirtualPath, pszUserName, pFtpAccess) {
        pszSessionId := pszSessionId is String ? StrPtr(pszSessionId) : pszSessionId
        pszSiteName := pszSiteName is String ? StrPtr(pszSiteName) : pszSiteName
        pszVirtualPath := pszVirtualPath is String ? StrPtr(pszVirtualPath) : pszVirtualPath
        pszUserName := pszUserName is String ? StrPtr(pszUserName) : pszUserName

        pFtpAccessMarshal := pFtpAccess is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", pszSessionId, "ptr", pszSiteName, "ptr", pszVirtualPath, "ptr", pszUserName, pFtpAccessMarshal, pFtpAccess, "HRESULT")
        return result
    }
}
