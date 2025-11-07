#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Iis
 * @version v4.0.30319
 */
class IFtpAuthenticationProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFtpAuthenticationProvider
     * @type {Guid}
     */
    static IID => Guid("{4659f95c-d5a8-4707-b2fc-6fd5794246cf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AuthenticateUser"]

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
}
