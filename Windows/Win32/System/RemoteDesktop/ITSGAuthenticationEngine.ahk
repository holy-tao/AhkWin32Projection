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
     * 
     * @param {Pointer<Guid>} mainSessionId 
     * @param {Pointer<Byte>} cookieData 
     * @param {Integer} numCookieBytes 
     * @param {Pointer} context 
     * @param {Pointer<ITSGAuthenticateUserSink>} pSink 
     * @returns {HRESULT} 
     */
    AuthenticateUser(mainSessionId, cookieData, numCookieBytes, context, pSink) {
        result := ComCall(3, this, "ptr", mainSessionId, "char*", cookieData, "uint", numCookieBytes, "ptr", context, "ptr", pSink, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} mainSessionId 
     * @param {Pointer} context 
     * @returns {HRESULT} 
     */
    CancelAuthentication(mainSessionId, context) {
        result := ComCall(4, this, "ptr", mainSessionId, "ptr", context, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
