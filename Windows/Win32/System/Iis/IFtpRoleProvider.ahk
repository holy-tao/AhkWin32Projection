#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Iis
 * @version v4.0.30319
 */
class IFtpRoleProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFtpRoleProvider
     * @type {Guid}
     */
    static IID => Guid("{909c850d-8ca0-4674-96b8-cc2941535725}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsUserInRole"]

    /**
     * 
     * @param {PWSTR} pszSessionId 
     * @param {PWSTR} pszSiteName 
     * @param {PWSTR} pszUserName 
     * @param {PWSTR} pszRole 
     * @param {Pointer<BOOL>} pfIsInRole 
     * @returns {HRESULT} 
     */
    IsUserInRole(pszSessionId, pszSiteName, pszUserName, pszRole, pfIsInRole) {
        pszSessionId := pszSessionId is String ? StrPtr(pszSessionId) : pszSessionId
        pszSiteName := pszSiteName is String ? StrPtr(pszSiteName) : pszSiteName
        pszUserName := pszUserName is String ? StrPtr(pszUserName) : pszUserName
        pszRole := pszRole is String ? StrPtr(pszRole) : pszRole

        result := ComCall(3, this, "ptr", pszSessionId, "ptr", pszSiteName, "ptr", pszUserName, "ptr", pszRole, "ptr", pfIsInRole, "HRESULT")
        return result
    }
}
