#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Exposes methods that notify Remote Desktop Gateway (RD Gateway) about authentication events.
 * @see https://docs.microsoft.com/windows/win32/api//tsgauthenticationengine/nn-tsgauthenticationengine-itsgauthenticateusersink
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class ITSGAuthenticateUserSink extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITSGAuthenticateUserSink
     * @type {Guid}
     */
    static IID => Guid("{2c3e2e73-a782-47f9-8dfb-77ee1ed27a03}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnUserAuthenticated", "OnUserAuthenticationFailed", "ReauthenticateUser", "DisconnectUser"]

    /**
     * Notifies Remote Desktop Gateway (RD Gateway) that the authentication plug-in has successfully authenticated the user.
     * @param {BSTR} userName The name of the user who initiated the connection.
     * @param {BSTR} userDomain The domain of the user who initiated the connection.
     * @param {Pointer} context A pointer to  a <b>ULONG</b> that contains  a value that identifies this connection. Use the value that was passed by the <a href="https://docs.microsoft.com/windows/desktop/api/tsgauthenticationengine/nf-tsgauthenticationengine-itsgauthenticationengine-authenticateuser">AuthenticateUser</a> method.
     * @param {HANDLE_PTR} userToken A pointer to a <b>HANDLE</b> that specifies the user token of the user. If the user is not running Windows, set this parameter to <b>NULL</b>.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tsgauthenticationengine/nf-tsgauthenticationengine-itsgauthenticateusersink-onuserauthenticated
     */
    OnUserAuthenticated(userName, userDomain, context, userToken) {
        userName := userName is String ? BSTR.Alloc(userName).Value : userName
        userDomain := userDomain is String ? BSTR.Alloc(userDomain).Value : userDomain

        result := ComCall(3, this, "ptr", userName, "ptr", userDomain, "ptr", context, "ptr", userToken, "HRESULT")
        return result
    }

    /**
     * Notifies Remote Desktop Gateway (RD Gateway) that the authentication plug-in failed to authenticate the user.
     * @param {Pointer} context A pointer to  a <b>ULONG</b> that contains  a value that identifies this connection. Use the value that was passed by the <a href="https://docs.microsoft.com/windows/desktop/api/tsgauthenticationengine/nf-tsgauthenticationengine-itsgauthenticationengine-authenticateuser">AuthenticateUser</a> method.
     * @param {HRESULT} genericErrorCode A Windows error code that specifies the cause of the authentication failure.
     * @param {HRESULT} specificErrorCode This parameter is reserved. Always set this parameter to zero.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tsgauthenticationengine/nf-tsgauthenticationengine-itsgauthenticateusersink-onuserauthenticationfailed
     */
    OnUserAuthenticationFailed(context, genericErrorCode, specificErrorCode) {
        result := ComCall(4, this, "ptr", context, "int", genericErrorCode, "int", specificErrorCode, "HRESULT")
        return result
    }

    /**
     * Notifies Remote Desktop Gateway (RD Gateway) that it should silently reauthenticate and reauthorize the user.
     * @param {Pointer} context A pointer to  a <b>ULONG</b> that contains  a value specific to this connection. Use 
     *        the value that was passed by the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/tsgauthenticationengine/nf-tsgauthenticationengine-itsgauthenticationengine-authenticateuser">AuthenticateUser</a> 
     *        method.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tsgauthenticationengine/nf-tsgauthenticationengine-itsgauthenticateusersink-reauthenticateuser
     */
    ReauthenticateUser(context) {
        result := ComCall(5, this, "ptr", context, "HRESULT")
        return result
    }

    /**
     * Notifies Remote Desktop Gateway (RD Gateway) that it should disconnect the client.
     * @param {Pointer} context A pointer to  a <b>ULONG</b> that contains  a value that identifies the connection to disconnect. Use the value that was passed by the <a href="https://docs.microsoft.com/windows/desktop/api/tsgauthenticationengine/nf-tsgauthenticationengine-itsgauthenticationengine-authenticateuser">AuthenticateUser</a> method.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tsgauthenticationengine/nf-tsgauthenticationengine-itsgauthenticateusersink-disconnectuser
     */
    DisconnectUser(context) {
        result := ComCall(6, this, "ptr", context, "HRESULT")
        return result
    }
}
