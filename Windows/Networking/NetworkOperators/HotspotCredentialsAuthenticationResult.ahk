#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHotspotCredentialsAuthenticationResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the results of a Hotspot authentication request.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.hotspotcredentialsauthenticationresult
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class HotspotCredentialsAuthenticationResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHotspotCredentialsAuthenticationResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHotspotCredentialsAuthenticationResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Indicates if a network error has occurred that prevented the authentication attempt. If true, the other properties should not be examined.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.hotspotcredentialsauthenticationresult.hasnetworkerroroccurred
     * @type {Boolean} 
     */
    HasNetworkErrorOccurred {
        get => this.get_HasNetworkErrorOccurred()
    }

    /**
     * Provides the WISPr Response Code for the authentication attempt as returned from the server. Possible values are defined by [HotspotAuthenticationResponseCode](hotspotauthenticationresponsecode.md).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.hotspotcredentialsauthenticationresult.responsecode
     * @type {Integer} 
     */
    ResponseCode {
        get => this.get_ResponseCode()
    }

    /**
     * Provides the most recent Logoff URL as returned from the server in the authentication reply or from an earlier redirect message. If no Logoff URL was provided by the server, this property returns an empty URI.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.hotspotcredentialsauthenticationresult.logoffurl
     * @type {Uri} 
     */
    LogoffUrl {
        get => this.get_LogoffUrl()
    }

    /**
     * Provides the XML blob containing the WISPr authentication reply message from the server.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.hotspotcredentialsauthenticationresult.authenticationreplyxml
     * @type {XmlDocument} 
     */
    AuthenticationReplyXml {
        get => this.get_AuthenticationReplyXml()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasNetworkErrorOccurred() {
        if (!this.HasProp("__IHotspotCredentialsAuthenticationResult")) {
            if ((queryResult := this.QueryInterface(IHotspotCredentialsAuthenticationResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHotspotCredentialsAuthenticationResult := IHotspotCredentialsAuthenticationResult(outPtr)
        }

        return this.__IHotspotCredentialsAuthenticationResult.get_HasNetworkErrorOccurred()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ResponseCode() {
        if (!this.HasProp("__IHotspotCredentialsAuthenticationResult")) {
            if ((queryResult := this.QueryInterface(IHotspotCredentialsAuthenticationResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHotspotCredentialsAuthenticationResult := IHotspotCredentialsAuthenticationResult(outPtr)
        }

        return this.__IHotspotCredentialsAuthenticationResult.get_ResponseCode()
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_LogoffUrl() {
        if (!this.HasProp("__IHotspotCredentialsAuthenticationResult")) {
            if ((queryResult := this.QueryInterface(IHotspotCredentialsAuthenticationResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHotspotCredentialsAuthenticationResult := IHotspotCredentialsAuthenticationResult(outPtr)
        }

        return this.__IHotspotCredentialsAuthenticationResult.get_LogoffUrl()
    }

    /**
     * 
     * @returns {XmlDocument} 
     */
    get_AuthenticationReplyXml() {
        if (!this.HasProp("__IHotspotCredentialsAuthenticationResult")) {
            if ((queryResult := this.QueryInterface(IHotspotCredentialsAuthenticationResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHotspotCredentialsAuthenticationResult := IHotspotCredentialsAuthenticationResult(outPtr)
        }

        return this.__IHotspotCredentialsAuthenticationResult.get_AuthenticationReplyXml()
    }

;@endregion Instance Methods
}
