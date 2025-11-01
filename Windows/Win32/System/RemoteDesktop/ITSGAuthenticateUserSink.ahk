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
     * 
     * @param {BSTR} userName 
     * @param {BSTR} userDomain 
     * @param {Pointer} context 
     * @param {HANDLE_PTR} userToken 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tsgauthenticationengine/nf-tsgauthenticationengine-itsgauthenticateusersink-onuserauthenticated
     */
    OnUserAuthenticated(userName, userDomain, context, userToken) {
        userName := userName is String ? BSTR.Alloc(userName).Value : userName
        userDomain := userDomain is String ? BSTR.Alloc(userDomain).Value : userDomain

        result := ComCall(3, this, "ptr", userName, "ptr", userDomain, "ptr", context, "ptr", userToken, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} context 
     * @param {HRESULT} genericErrorCode 
     * @param {HRESULT} specificErrorCode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tsgauthenticationengine/nf-tsgauthenticationengine-itsgauthenticateusersink-onuserauthenticationfailed
     */
    OnUserAuthenticationFailed(context, genericErrorCode, specificErrorCode) {
        result := ComCall(4, this, "ptr", context, "int", genericErrorCode, "int", specificErrorCode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} context 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tsgauthenticationengine/nf-tsgauthenticationengine-itsgauthenticateusersink-reauthenticateuser
     */
    ReauthenticateUser(context) {
        result := ComCall(5, this, "ptr", context, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} context 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tsgauthenticationengine/nf-tsgauthenticationengine-itsgauthenticateusersink-disconnectuser
     */
    DisconnectUser(context) {
        result := ComCall(6, this, "ptr", context, "HRESULT")
        return result
    }
}
