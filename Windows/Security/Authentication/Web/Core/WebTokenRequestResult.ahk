#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWebTokenRequestResult.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Represents the results of a web token request to an identity provider.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.core.webtokenrequestresult
 * @namespace Windows.Security.Authentication.Web.Core
 * @version WindowsRuntime 1.4
 */
class WebTokenRequestResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWebTokenRequestResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWebTokenRequestResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the response data from the web token provider.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.core.webtokenrequestresult.responsedata
     * @type {IVectorView<WebTokenResponse>} 
     */
    ResponseData {
        get => this.get_ResponseData()
    }

    /**
     * Gets the status of the request.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.core.webtokenrequestresult.responsestatus
     * @type {Integer} 
     */
    ResponseStatus {
        get => this.get_ResponseStatus()
    }

    /**
     * Gets the error returned by the web provider, if any.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.core.webtokenrequestresult.responseerror
     * @type {WebProviderError} 
     */
    ResponseError {
        get => this.get_ResponseError()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVectorView<WebTokenResponse>} 
     */
    get_ResponseData() {
        if (!this.HasProp("__IWebTokenRequestResult")) {
            if ((queryResult := this.QueryInterface(IWebTokenRequestResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebTokenRequestResult := IWebTokenRequestResult(outPtr)
        }

        return this.__IWebTokenRequestResult.get_ResponseData()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ResponseStatus() {
        if (!this.HasProp("__IWebTokenRequestResult")) {
            if ((queryResult := this.QueryInterface(IWebTokenRequestResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebTokenRequestResult := IWebTokenRequestResult(outPtr)
        }

        return this.__IWebTokenRequestResult.get_ResponseStatus()
    }

    /**
     * 
     * @returns {WebProviderError} 
     */
    get_ResponseError() {
        if (!this.HasProp("__IWebTokenRequestResult")) {
            if ((queryResult := this.QueryInterface(IWebTokenRequestResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebTokenRequestResult := IWebTokenRequestResult(outPtr)
        }

        return this.__IWebTokenRequestResult.get_ResponseError()
    }

    /**
     * Invalidates the current cached [WebTokenRequestResult](webtokenrequestresult.md). See Remarks for proper usage.
     * @remarks
     * While the default behavior of the Web Account Manager is to automatically remove cached tokens that become stale, there are some scenarios in which a token will stay cached even when it is not valid. If the [WebTokenRequestResult](WebTokenRequestResult.md) indicates that the token was rejected by the server, then this method should be called to remove that token from the WAM cache and a new token should be requested.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.core.webtokenrequestresult.invalidatecacheasync
     */
    InvalidateCacheAsync() {
        if (!this.HasProp("__IWebTokenRequestResult")) {
            if ((queryResult := this.QueryInterface(IWebTokenRequestResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebTokenRequestResult := IWebTokenRequestResult(outPtr)
        }

        return this.__IWebTokenRequestResult.InvalidateCacheAsync()
    }

;@endregion Instance Methods
}
