#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Exposes methods that authenticate users for Remote Desktop Gateway (RD Gateway).
 * @see https://docs.microsoft.com/windows/win32/api//tsgauthenticationengine/nn-tsgauthenticationengine-itsgauthenticationengine
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class ITSGAuthenticationEngine extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITSGAuthenticationEngine
     * @type {Guid}
     */
    static IID => Guid("{9ee3e5bf-04ab-4691-998c-d7f622321a56}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AuthenticateUser", "CancelAuthentication"]

    /**
     * 
     * @param {Guid} mainSessionId 
     * @param {Pointer<Integer>} cookieData 
     * @param {Integer} numCookieBytes 
     * @param {Pointer} context 
     * @param {ITSGAuthenticateUserSink} pSink 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tsgauthenticationengine/nf-tsgauthenticationengine-itsgauthenticationengine-authenticateuser
     */
    AuthenticateUser(mainSessionId, cookieData, numCookieBytes, context, pSink) {
        cookieDataMarshal := cookieData is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, "ptr", mainSessionId, cookieDataMarshal, cookieData, "uint", numCookieBytes, "ptr", context, "ptr", pSink, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} mainSessionId 
     * @param {Pointer} context 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tsgauthenticationengine/nf-tsgauthenticationengine-itsgauthenticationengine-cancelauthentication
     */
    CancelAuthentication(mainSessionId, context) {
        result := ComCall(4, this, "ptr", mainSessionId, "ptr", context, "HRESULT")
        return result
    }
}
