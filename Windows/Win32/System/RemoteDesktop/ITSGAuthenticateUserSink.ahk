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
     * 
     * @param {BSTR} userName 
     * @param {BSTR} userDomain 
     * @param {Pointer} context 
     * @param {HANDLE_PTR} userToken 
     * @returns {HRESULT} 
     */
    OnUserAuthenticated(userName, userDomain, context, userToken) {
        userName := userName is String ? BSTR.Alloc(userName).Value : userName
        userDomain := userDomain is String ? BSTR.Alloc(userDomain).Value : userDomain

        result := ComCall(3, this, "ptr", userName, "ptr", userDomain, "ptr", context, "ptr", userToken, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} context 
     * @param {HRESULT} genericErrorCode 
     * @param {HRESULT} specificErrorCode 
     * @returns {HRESULT} 
     */
    OnUserAuthenticationFailed(context, genericErrorCode, specificErrorCode) {
        result := ComCall(4, this, "ptr", context, "int", genericErrorCode, "int", specificErrorCode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} context 
     * @returns {HRESULT} 
     */
    ReauthenticateUser(context) {
        result := ComCall(5, this, "ptr", context, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} context 
     * @returns {HRESULT} 
     */
    DisconnectUser(context) {
        result := ComCall(6, this, "ptr", context, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
