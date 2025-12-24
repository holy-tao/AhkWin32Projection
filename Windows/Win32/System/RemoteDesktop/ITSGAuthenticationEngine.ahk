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
     * Authenticates a user.
     * @param {Guid} mainSessionId A unique identifier assigned to the connection request by RD Gateway.
     * @param {Pointer<Integer>} cookieData A pointer to a <b>BYTE</b> that contains the cookie provided by the user.
     * @param {Integer} numCookieBytes The number of bytes referenced by the <i>cookieData</i> parameter.
     * @param {Pointer} context A pointer to  a <b>ULONG</b> that contains  a value specific to this connection. This 
     *       value should be passed back to RD Gateway by using the methods of the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/tsgauthenticationengine/nn-tsgauthenticationengine-itsgauthenticateusersink">ITSGAuthenticateUserSink</a> interface.
     * @param {ITSGAuthenticateUserSink} pSink A pointer to a 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/tsgauthenticationengine/nn-tsgauthenticationengine-itsgauthenticateusersink">ITSGAuthenticateUserSink</a> interface that 
     *       the authentication plug-in must use to notify RD Gateway about the result of authentication.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tsgauthenticationengine/nf-tsgauthenticationengine-itsgauthenticationengine-authenticateuser
     */
    AuthenticateUser(mainSessionId, cookieData, numCookieBytes, context, pSink) {
        cookieDataMarshal := cookieData is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, "ptr", mainSessionId, cookieDataMarshal, cookieData, "uint", numCookieBytes, "ptr", context, "ptr", pSink, "HRESULT")
        return result
    }

    /**
     * Cancels an existing authentication request.
     * @param {Guid} mainSessionId An identifier assigned to the connection request.
     * @param {Pointer} context A pointer to  a <b>ULONG</b> that contains  a value that identifies this connection. This value should be passed back to RD Gateway by using the methods of the  <a href="https://docs.microsoft.com/windows/desktop/api/tsgauthenticationengine/nn-tsgauthenticationengine-itsgauthenticateusersink">ITSGAuthenticateUserSink</a> interface.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tsgauthenticationengine/nf-tsgauthenticationengine-itsgauthenticationengine-cancelauthentication
     */
    CancelAuthentication(mainSessionId, context) {
        result := ComCall(4, this, "ptr", mainSessionId, "ptr", context, "HRESULT")
        return result
    }
}
