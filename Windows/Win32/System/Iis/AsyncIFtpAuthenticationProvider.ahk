#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Iis
 * @version v4.0.30319
 */
class AsyncIFtpAuthenticationProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for AsyncIFtpAuthenticationProvider
     * @type {Guid}
     */
    static IID => Guid("{c24efb65-9f3e-4996-8fb1-ce166916bab5}")

    /**
     * The class identifier for AsyncIFtpAuthenticationProvider
     * @type {Guid}
     */
    static CLSID => Guid("{c24efb65-9f3e-4996-8fb1-ce166916bab5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Begin_AuthenticateUser", "Finish_AuthenticateUser"]

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
        result := ComCall(4, this, "ptr", ppszCanonicalUserName, "ptr", pfAuthenticated, "HRESULT")
        return result
    }
}
