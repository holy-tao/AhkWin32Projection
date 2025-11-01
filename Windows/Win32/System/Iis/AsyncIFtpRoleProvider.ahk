#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Iis
 * @version v4.0.30319
 */
class AsyncIFtpRoleProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for AsyncIFtpRoleProvider
     * @type {Guid}
     */
    static IID => Guid("{3e83bf99-70ec-41ca-84b6-aca7c7a62caf}")

    /**
     * The class identifier for AsyncIFtpRoleProvider
     * @type {Guid}
     */
    static CLSID => Guid("{3e83bf99-70ec-41ca-84b6-aca7c7a62caf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Begin_IsUserInRole", "Finish_IsUserInRole"]

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
     * @param {Pointer<BOOL>} pfIsInRole 
     * @returns {HRESULT} 
     */
    Finish_IsUserInRole(pfIsInRole) {
        result := ComCall(4, this, "ptr", pfIsInRole, "HRESULT")
        return result
    }
}
