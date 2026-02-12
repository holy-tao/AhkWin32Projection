#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppBroadcastBackgroundServiceSignInInfo.ahk
#Include .\IAppBroadcastBackgroundServiceSignInInfo2.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\AppBroadcastBackgroundServiceSignInInfo.ahk
#Include .\AppBroadcastSignInStateChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents the sign-in information for the app broadcast background service.
  * 
  * > [!NOTE]
  * > This API requires the **appBroadcast** and **appBroadcastSettings** capability which is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastbackgroundservicesignininfo
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class AppBroadcastBackgroundServiceSignInInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppBroadcastBackgroundServiceSignInInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppBroadcastBackgroundServiceSignInInfo.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets an object representing the sign-in state of the app broadcast background service.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastbackgroundservicesignininfo.signinstate
     * @type {Integer} 
     */
    SignInState {
        get => this.get_SignInState()
    }

    /**
     * Gets or sets the OAuth request URI.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastbackgroundservicesignininfo.oauthrequesturi
     * @type {Uri} 
     */
    OAuthRequestUri {
        get => this.get_OAuthRequestUri()
        set => this.put_OAuthRequestUri(value)
    }

    /**
     * Gets or sets the OAuth callback URI.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastbackgroundservicesignininfo.oauthcallbackuri
     * @type {Uri} 
     */
    OAuthCallbackUri {
        get => this.get_OAuthCallbackUri()
        set => this.put_OAuthCallbackUri(value)
    }

    /**
     * Gets an object that represents the result of a Web authentication operation.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastbackgroundservicesignininfo.authenticationresult
     * @type {WebAuthenticationResult} 
     */
    AuthenticationResult {
        get => this.get_AuthenticationResult()
    }

    /**
     * Gets or sets the username for app broadcast background service authentication.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastbackgroundservicesignininfo.username
     * @type {HSTRING} 
     */
    UserName {
        get => this.get_UserName()
        set => this.put_UserName(value)
    }

    /**
     * Occurs when the sign-in state of the app broadcast background service changes.
     * @type {TypedEventHandler<AppBroadcastBackgroundServiceSignInInfo, AppBroadcastSignInStateChangedEventArgs>}
    */
    OnSignInStateChanged {
        get {
            if(!this.HasProp("__OnSignInStateChanged")){
                this.__OnSignInStateChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{e2672c1a-a3d9-56f3-8a77-20d30873ce87}"),
                    AppBroadcastBackgroundServiceSignInInfo,
                    AppBroadcastSignInStateChangedEventArgs
                )
                this.__OnSignInStateChangedToken := this.add_SignInStateChanged(this.__OnSignInStateChanged.iface)
            }
            return this.__OnSignInStateChanged
        }
    }

    /**
     * Occurs when the [UserName](appbroadcastbackgroundservicesignininfo_username.md) property changes.
     * @type {TypedEventHandler<AppBroadcastBackgroundServiceSignInInfo, IInspectable>}
    */
    OnUserNameChanged {
        get {
            if(!this.HasProp("__OnUserNameChanged")){
                this.__OnUserNameChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{f8715188-efc7-575c-ad9d-695eb2044524}"),
                    AppBroadcastBackgroundServiceSignInInfo,
                    IInspectable
                )
                this.__OnUserNameChangedToken := this.add_UserNameChanged(this.__OnUserNameChanged.iface)
            }
            return this.__OnUserNameChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnSignInStateChangedToken")) {
            this.remove_SignInStateChanged(this.__OnSignInStateChangedToken)
            this.__OnSignInStateChanged.iface.Dispose()
        }

        if(this.HasProp("__OnUserNameChangedToken")) {
            this.remove_UserNameChanged(this.__OnUserNameChangedToken)
            this.__OnUserNameChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SignInState() {
        if (!this.HasProp("__IAppBroadcastBackgroundServiceSignInInfo")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastBackgroundServiceSignInInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastBackgroundServiceSignInInfo := IAppBroadcastBackgroundServiceSignInInfo(outPtr)
        }

        return this.__IAppBroadcastBackgroundServiceSignInInfo.get_SignInState()
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_OAuthRequestUri(value) {
        if (!this.HasProp("__IAppBroadcastBackgroundServiceSignInInfo")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastBackgroundServiceSignInInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastBackgroundServiceSignInInfo := IAppBroadcastBackgroundServiceSignInInfo(outPtr)
        }

        return this.__IAppBroadcastBackgroundServiceSignInInfo.put_OAuthRequestUri(value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_OAuthRequestUri() {
        if (!this.HasProp("__IAppBroadcastBackgroundServiceSignInInfo")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastBackgroundServiceSignInInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastBackgroundServiceSignInInfo := IAppBroadcastBackgroundServiceSignInInfo(outPtr)
        }

        return this.__IAppBroadcastBackgroundServiceSignInInfo.get_OAuthRequestUri()
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_OAuthCallbackUri(value) {
        if (!this.HasProp("__IAppBroadcastBackgroundServiceSignInInfo")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastBackgroundServiceSignInInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastBackgroundServiceSignInInfo := IAppBroadcastBackgroundServiceSignInInfo(outPtr)
        }

        return this.__IAppBroadcastBackgroundServiceSignInInfo.put_OAuthCallbackUri(value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_OAuthCallbackUri() {
        if (!this.HasProp("__IAppBroadcastBackgroundServiceSignInInfo")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastBackgroundServiceSignInInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastBackgroundServiceSignInInfo := IAppBroadcastBackgroundServiceSignInInfo(outPtr)
        }

        return this.__IAppBroadcastBackgroundServiceSignInInfo.get_OAuthCallbackUri()
    }

    /**
     * 
     * @returns {WebAuthenticationResult} 
     */
    get_AuthenticationResult() {
        if (!this.HasProp("__IAppBroadcastBackgroundServiceSignInInfo")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastBackgroundServiceSignInInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastBackgroundServiceSignInInfo := IAppBroadcastBackgroundServiceSignInInfo(outPtr)
        }

        return this.__IAppBroadcastBackgroundServiceSignInInfo.get_AuthenticationResult()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_UserName(value) {
        if (!this.HasProp("__IAppBroadcastBackgroundServiceSignInInfo")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastBackgroundServiceSignInInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastBackgroundServiceSignInInfo := IAppBroadcastBackgroundServiceSignInInfo(outPtr)
        }

        return this.__IAppBroadcastBackgroundServiceSignInInfo.put_UserName(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_UserName() {
        if (!this.HasProp("__IAppBroadcastBackgroundServiceSignInInfo")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastBackgroundServiceSignInInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastBackgroundServiceSignInInfo := IAppBroadcastBackgroundServiceSignInInfo(outPtr)
        }

        return this.__IAppBroadcastBackgroundServiceSignInInfo.get_UserName()
    }

    /**
     * 
     * @param {TypedEventHandler<AppBroadcastBackgroundServiceSignInInfo, AppBroadcastSignInStateChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SignInStateChanged(handler) {
        if (!this.HasProp("__IAppBroadcastBackgroundServiceSignInInfo")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastBackgroundServiceSignInInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastBackgroundServiceSignInInfo := IAppBroadcastBackgroundServiceSignInInfo(outPtr)
        }

        return this.__IAppBroadcastBackgroundServiceSignInInfo.add_SignInStateChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SignInStateChanged(token) {
        if (!this.HasProp("__IAppBroadcastBackgroundServiceSignInInfo")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastBackgroundServiceSignInInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastBackgroundServiceSignInInfo := IAppBroadcastBackgroundServiceSignInInfo(outPtr)
        }

        return this.__IAppBroadcastBackgroundServiceSignInInfo.remove_SignInStateChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<AppBroadcastBackgroundServiceSignInInfo, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_UserNameChanged(handler) {
        if (!this.HasProp("__IAppBroadcastBackgroundServiceSignInInfo2")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastBackgroundServiceSignInInfo2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastBackgroundServiceSignInInfo2 := IAppBroadcastBackgroundServiceSignInInfo2(outPtr)
        }

        return this.__IAppBroadcastBackgroundServiceSignInInfo2.add_UserNameChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_UserNameChanged(token) {
        if (!this.HasProp("__IAppBroadcastBackgroundServiceSignInInfo2")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastBackgroundServiceSignInInfo2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastBackgroundServiceSignInInfo2 := IAppBroadcastBackgroundServiceSignInInfo2(outPtr)
        }

        return this.__IAppBroadcastBackgroundServiceSignInInfo2.remove_UserNameChanged(token)
    }

;@endregion Instance Methods
}
