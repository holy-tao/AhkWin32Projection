#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Uri.ahk
#Include ..\..\Security\Authentication\Web\WebAuthenticationResult.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class IAppBroadcastBackgroundServiceSignInInfo extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppBroadcastBackgroundServiceSignInInfo
     * @type {Guid}
     */
    static IID => Guid("{5e735275-88c8-4eca-89ba-4825985db880}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SignInState", "put_OAuthRequestUri", "get_OAuthRequestUri", "put_OAuthCallbackUri", "get_OAuthCallbackUri", "get_AuthenticationResult", "put_UserName", "get_UserName", "add_SignInStateChanged", "remove_SignInStateChanged"]

    /**
     * @type {Integer} 
     */
    SignInState {
        get => this.get_SignInState()
    }

    /**
     * @type {Uri} 
     */
    OAuthRequestUri {
        get => this.get_OAuthRequestUri()
        set => this.put_OAuthRequestUri(value)
    }

    /**
     * @type {Uri} 
     */
    OAuthCallbackUri {
        get => this.get_OAuthCallbackUri()
        set => this.put_OAuthCallbackUri(value)
    }

    /**
     * @type {WebAuthenticationResult} 
     */
    AuthenticationResult {
        get => this.get_AuthenticationResult()
    }

    /**
     * @type {HSTRING} 
     */
    UserName {
        get => this.get_UserName()
        set => this.put_UserName(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SignInState() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_OAuthRequestUri(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_OAuthRequestUri() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Uri(value)
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_OAuthCallbackUri(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_OAuthCallbackUri() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Uri(value)
    }

    /**
     * 
     * @returns {WebAuthenticationResult} 
     */
    get_AuthenticationResult() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WebAuthenticationResult(value)
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_UserName(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_UserName() {
        value := HSTRING()
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TypedEventHandler<AppBroadcastBackgroundServiceSignInInfo, AppBroadcastSignInStateChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SignInStateChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(14, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SignInStateChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(15, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
