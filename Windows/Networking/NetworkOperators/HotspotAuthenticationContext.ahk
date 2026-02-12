#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHotspotAuthenticationContext.ahk
#Include .\IHotspotAuthenticationContext2.ahk
#Include .\IHotspotAuthenticationContextStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides the authentication context that contains details of the current authentication attempt and provides methods to perform the authentication.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
  * > 
  * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.hotspotauthenticationcontext
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class HotspotAuthenticationContext extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHotspotAuthenticationContext

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHotspotAuthenticationContext.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets the context of an authentication attempt.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @param {HSTRING} evenToken The event token retrieved from the network operator hotspot authentication [event](hotspotauthenticationeventdetails.md). The token is a [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) in string format.
     * @param {Pointer<HotspotAuthenticationContext>} context_ The network operator hotspot authentication context.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.hotspotauthenticationcontext.trygetauthenticationcontext
     */
    static TryGetAuthenticationContext(evenToken, context_) {
        if (!HotspotAuthenticationContext.HasProp("__IHotspotAuthenticationContextStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.NetworkOperators.HotspotAuthenticationContext")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHotspotAuthenticationContextStatics.IID)
            HotspotAuthenticationContext.__IHotspotAuthenticationContextStatics := IHotspotAuthenticationContextStatics(factoryPtr)
        }

        return HotspotAuthenticationContext.__IHotspotAuthenticationContextStatics.TryGetAuthenticationContext(evenToken, context_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the SSID of the WLAN access point of the hotspot.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.hotspotauthenticationcontext.wirelessnetworkid
     */
    WirelessNetworkId {
        get => this.get_WirelessNetworkId()
    }

    /**
     * Gets the network interface that is connected to the WLAN access point of the hotspot.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.hotspotauthenticationcontext.networkadapter
     * @type {NetworkAdapter} 
     */
    NetworkAdapter {
        get => this.get_NetworkAdapter()
    }

    /**
     * Gets the URL of the web page where the Wireless Internet Service Provider roaming (WISPr) redirect message was found.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.hotspotauthenticationcontext.redirectmessageurl
     * @type {Uri} 
     */
    RedirectMessageUrl {
        get => this.get_RedirectMessageUrl()
    }

    /**
     * Gets the XML blob of the Wireless Internet Service Provider roaming (WISPr) redirect message of the hotspot.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.hotspotauthenticationcontext.redirectmessagexml
     * @type {XmlDocument} 
     */
    RedirectMessageXml {
        get => this.get_RedirectMessageXml()
    }

    /**
     * Gets the HTTPS URL specified in the Wireless Internet Service Provider roaming (WISPr) redirect message.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic. 
     * 
     * Applications must determine whether to trust this URL for providing credentials.
     * @remarks
     * Applications should not assume they are only invoked for authentication attempts for profiles they created themselves. An application from another operator could have mistakenly created a profile that invokes the application of another operator for issuing credentials. The authentication context contains all relevant parameters of the authentication attempt.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.hotspotauthenticationcontext.authenticationurl
     * @type {Uri} 
     */
    AuthenticationUrl {
        get => this.get_AuthenticationUrl()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @param {Pointer<Pointer>} value 
     * @returns {HRESULT} 
     */
    get_WirelessNetworkId(value) {
        if (!this.HasProp("__IHotspotAuthenticationContext")) {
            if ((queryResult := this.QueryInterface(IHotspotAuthenticationContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHotspotAuthenticationContext := IHotspotAuthenticationContext(outPtr)
        }

        return this.__IHotspotAuthenticationContext.get_WirelessNetworkId(value)
    }

    /**
     * 
     * @returns {NetworkAdapter} 
     */
    get_NetworkAdapter() {
        if (!this.HasProp("__IHotspotAuthenticationContext")) {
            if ((queryResult := this.QueryInterface(IHotspotAuthenticationContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHotspotAuthenticationContext := IHotspotAuthenticationContext(outPtr)
        }

        return this.__IHotspotAuthenticationContext.get_NetworkAdapter()
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_RedirectMessageUrl() {
        if (!this.HasProp("__IHotspotAuthenticationContext")) {
            if ((queryResult := this.QueryInterface(IHotspotAuthenticationContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHotspotAuthenticationContext := IHotspotAuthenticationContext(outPtr)
        }

        return this.__IHotspotAuthenticationContext.get_RedirectMessageUrl()
    }

    /**
     * 
     * @returns {XmlDocument} 
     */
    get_RedirectMessageXml() {
        if (!this.HasProp("__IHotspotAuthenticationContext")) {
            if ((queryResult := this.QueryInterface(IHotspotAuthenticationContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHotspotAuthenticationContext := IHotspotAuthenticationContext(outPtr)
        }

        return this.__IHotspotAuthenticationContext.get_RedirectMessageXml()
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_AuthenticationUrl() {
        if (!this.HasProp("__IHotspotAuthenticationContext")) {
            if ((queryResult := this.QueryInterface(IHotspotAuthenticationContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHotspotAuthenticationContext := IHotspotAuthenticationContext(outPtr)
        }

        return this.__IHotspotAuthenticationContext.get_AuthenticationUrl()
    }

    /**
     * Provides credentials to Windows for hotspot authentication
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic. 
     * 
     * Windows does not cache these credentials and another authentication event will be raised when the system connects to the same hotspot again.
     * @remarks
     * Once IssueCredentials is called, the authentication context is finalized and IssueCredentials, [AbortAuthentication](hotspotauthenticationcontext_abortauthentication_278660964.md), or [SkipAuthentication](hotspotauthenticationcontext_skipauthentication_1327264673.md) should not be called again.
     * @param {HSTRING} userName The *UserName* parameter of the Wireless Internet Service Provider roaming (WISPr) authentication protocol. IssueCredentials performs URL encoding before submitting the value to the server. If this string is empty, the corresponding authentication parameter is skipped.
     * @param {HSTRING} password The *Password* parameter of the WISPr authentication protocol. IssueCredentials performs URL encoding before submitting the value to the server. If this string is empty, the corresponding authentication parameter is skipped.
     * @param {HSTRING} extraParameters Additional parameters to be appended to the authentication string. IssueCredentials appends this parameter after an "&amp;" character to the HTTP POST string as is without any encoding. This can be used to add multiple parameters. The default for this parameter is an empty string.
     * @param {Boolean} markAsManualConnectOnFailure If **true**, an application permanently disables the auto-connect property on a connection. If authentication fails, the connection will be disconnected and not retried in the current user session. Otherwise, **false**.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.hotspotauthenticationcontext.issuecredentials
     */
    IssueCredentials(userName, password, extraParameters, markAsManualConnectOnFailure) {
        if (!this.HasProp("__IHotspotAuthenticationContext")) {
            if ((queryResult := this.QueryInterface(IHotspotAuthenticationContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHotspotAuthenticationContext := IHotspotAuthenticationContext(outPtr)
        }

        return this.__IHotspotAuthenticationContext.IssueCredentials(userName, password, extraParameters, markAsManualConnectOnFailure)
    }

    /**
     * Aborts the current authentication attempt and disconnects the WLAN interface from the hotspot.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @remarks
     * AbortAuthentication should be called when authentication credentials can not be provided through [IssueCredentials](hotspotauthenticationcontext_issuecredentials_808909449.md). Once AbortAuthentication is called, the authentication context is finalized and [IssueCredentials](hotspotauthenticationcontext_issuecredentials_808909449.md), AbortAuthentication, or [SkipAuthentication](hotspotauthenticationcontext_skipauthentication_1327264673.md) should not be called again.
     * @param {Boolean} markAsManual If **true**, Windows disables the auto-connect property for the corresponding WLAN profile and avoids future auto-connects to this hotspot. Otherwise, **false**.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.hotspotauthenticationcontext.abortauthentication
     */
    AbortAuthentication(markAsManual) {
        if (!this.HasProp("__IHotspotAuthenticationContext")) {
            if ((queryResult := this.QueryInterface(IHotspotAuthenticationContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHotspotAuthenticationContext := IHotspotAuthenticationContext(outPtr)
        }

        return this.__IHotspotAuthenticationContext.AbortAuthentication(markAsManual)
    }

    /**
     * Skips Wireless Internet Service Provider roaming (WISPr) Windows authentication.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @remarks
     * **SkipAuthentication** can be used to implement a proprietary authentication flow. When **SkipAuthentication** is called, Windows checks the current Internet connectivity status over the corresponding network interface. Thus, applications implementing their own authentication should call this API when their authentication sequence is completed.
     * 
     * Once [IssueCredentials](hotspotauthenticationcontext_issuecredentials_808909449.md) is called, the authentication context is finalized and [IssueCredentials](hotspotauthenticationcontext_issuecredentials_808909449.md), [AbortAuthentication](hotspotauthenticationcontext_abortauthentication_278660964.md), or **SkipAuthentication** should not be called again.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.hotspotauthenticationcontext.skipauthentication
     */
    SkipAuthentication() {
        if (!this.HasProp("__IHotspotAuthenticationContext")) {
            if ((queryResult := this.QueryInterface(IHotspotAuthenticationContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHotspotAuthenticationContext := IHotspotAuthenticationContext(outPtr)
        }

        return this.__IHotspotAuthenticationContext.SkipAuthentication()
    }

    /**
     * Called by a background task handler to launch the foreground application when there is an authentication attempt to complete.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic. 
     * 
     * Windows will launch the specified application.
     * @param {HSTRING} packageRelativeApplicationId The foreground application ID within its application package. The application must belong to the same package as the background task handler.
     * @param {HSTRING} applicationParameters Optional command line parameters that are passed to the application at launch.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.hotspotauthenticationcontext.triggerattentionrequired
     */
    TriggerAttentionRequired(packageRelativeApplicationId, applicationParameters) {
        if (!this.HasProp("__IHotspotAuthenticationContext")) {
            if ((queryResult := this.QueryInterface(IHotspotAuthenticationContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHotspotAuthenticationContext := IHotspotAuthenticationContext(outPtr)
        }

        return this.__IHotspotAuthenticationContext.TriggerAttentionRequired(packageRelativeApplicationId, applicationParameters)
    }

    /**
     * Asynchronously provides credentials to Windows for hotspot authentication Windows does not cache these credentials and another authentication event will be raised when the system connects to the same hotspot again.
     * 
     * It is an asynchronous version of [IssueCredentials](hotspotauthenticationcontext_issuecredentials_808909449.md). It takes the same parameters, but the asynchronous operation only completes when the authentication is completed. In contrast, the [IssueCredentials](hotspotauthenticationcontext_issuecredentials_808909449.md) API returns as soon as the authentication is started. On completion of this method, the results object may be examined to check the status of the authentication attempt.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @param {HSTRING} userName The *UserName* parameter of the Wireless Internet Service Provider roaming (WISPr) authentication protocol. [IssueCredentials](hotspotauthenticationcontext_issuecredentials_808909449.md) performs URL encoding before submitting the value to the server. If this string is empty, the corresponding authentication parameter is skipped.
     * @param {HSTRING} password The *Password* parameter of the WISPr authentication protocol. [IssueCredentials](hotspotauthenticationcontext_issuecredentials_808909449.md) performs URL encoding before submitting the value to the server. If this string is empty, the corresponding authentication parameter is skipped.
     * @param {HSTRING} extraParameters Additional parameters to be appended to the authentication string. [IssueCredentials](hotspotauthenticationcontext_issuecredentials_808909449.md) appends this parameter after an "&amp;" character to the HTTP POST string as is without any encoding. This can be used to add multiple parameters. The default for this parameter is an empty string.
     * @param {Boolean} markAsManualConnectOnFailure If **true**, an application permanently disables the auto-connect property on a connection. If authentication fails, the connection will be disconnected and not retried in the current user session. Otherwise, **false**.
     * @returns {IAsyncOperation<HotspotCredentialsAuthenticationResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.hotspotauthenticationcontext.issuecredentialsasync
     */
    IssueCredentialsAsync(userName, password, extraParameters, markAsManualConnectOnFailure) {
        if (!this.HasProp("__IHotspotAuthenticationContext2")) {
            if ((queryResult := this.QueryInterface(IHotspotAuthenticationContext2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHotspotAuthenticationContext2 := IHotspotAuthenticationContext2(outPtr)
        }

        return this.__IHotspotAuthenticationContext2.IssueCredentialsAsync(userName, password, extraParameters, markAsManualConnectOnFailure)
    }

;@endregion Instance Methods
}
