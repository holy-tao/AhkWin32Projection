#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWebAccountProviderTokenOperation.ahk
#Include .\IWebAccountProviderOperation.ahk
#Include .\IWebAccountProviderSilentReportOperation.ahk
#Include .\IWebAccountProviderBaseReportOperation.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Represents a get token silently operation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.webaccountprovidergettokensilentoperation
 * @namespace Windows.Security.Authentication.Web.Provider
 * @version WindowsRuntime 1.4
 */
class WebAccountProviderGetTokenSilentOperation extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWebAccountProviderTokenOperation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWebAccountProviderTokenOperation.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the web provider token request.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.webaccountprovidergettokensilentoperation.providerrequest
     * @type {WebProviderTokenRequest} 
     */
    ProviderRequest {
        get => this.get_ProviderRequest()
    }

    /**
     * Gets the web provider token responses.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.webaccountprovidergettokensilentoperation.providerresponses
     * @type {IVector<WebProviderTokenResponse>} 
     */
    ProviderResponses {
        get => this.get_ProviderResponses()
    }

    /**
     * Gets or sets the cache expiration time.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.webaccountprovidergettokensilentoperation.cacheexpirationtime
     * @type {DateTime} 
     */
    CacheExpirationTime {
        get => this.get_CacheExpirationTime()
        set => this.put_CacheExpirationTime(value)
    }

    /**
     * Gets the kind of web account provider operation.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.webaccountprovidergettokensilentoperation.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {WebProviderTokenRequest} 
     */
    get_ProviderRequest() {
        if (!this.HasProp("__IWebAccountProviderTokenOperation")) {
            if ((queryResult := this.QueryInterface(IWebAccountProviderTokenOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebAccountProviderTokenOperation := IWebAccountProviderTokenOperation(outPtr)
        }

        return this.__IWebAccountProviderTokenOperation.get_ProviderRequest()
    }

    /**
     * 
     * @returns {IVector<WebProviderTokenResponse>} 
     */
    get_ProviderResponses() {
        if (!this.HasProp("__IWebAccountProviderTokenOperation")) {
            if ((queryResult := this.QueryInterface(IWebAccountProviderTokenOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebAccountProviderTokenOperation := IWebAccountProviderTokenOperation(outPtr)
        }

        return this.__IWebAccountProviderTokenOperation.get_ProviderResponses()
    }

    /**
     * 
     * @param {DateTime} value 
     * @returns {HRESULT} 
     */
    put_CacheExpirationTime(value) {
        if (!this.HasProp("__IWebAccountProviderTokenOperation")) {
            if ((queryResult := this.QueryInterface(IWebAccountProviderTokenOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebAccountProviderTokenOperation := IWebAccountProviderTokenOperation(outPtr)
        }

        return this.__IWebAccountProviderTokenOperation.put_CacheExpirationTime(value)
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_CacheExpirationTime() {
        if (!this.HasProp("__IWebAccountProviderTokenOperation")) {
            if ((queryResult := this.QueryInterface(IWebAccountProviderTokenOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebAccountProviderTokenOperation := IWebAccountProviderTokenOperation(outPtr)
        }

        return this.__IWebAccountProviderTokenOperation.get_CacheExpirationTime()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Kind() {
        if (!this.HasProp("__IWebAccountProviderOperation")) {
            if ((queryResult := this.QueryInterface(IWebAccountProviderOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebAccountProviderOperation := IWebAccountProviderOperation(outPtr)
        }

        return this.__IWebAccountProviderOperation.get_Kind()
    }

    /**
     * Informs the activating app that user interaction is required to continue the operation.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.webaccountprovidergettokensilentoperation.reportuserinteractionrequired
     */
    ReportUserInteractionRequired() {
        if (!this.HasProp("__IWebAccountProviderSilentReportOperation")) {
            if ((queryResult := this.QueryInterface(IWebAccountProviderSilentReportOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebAccountProviderSilentReportOperation := IWebAccountProviderSilentReportOperation(outPtr)
        }

        return this.__IWebAccountProviderSilentReportOperation.ReportUserInteractionRequired()
    }

    /**
     * Informs the activating app that an error has occurred and user interaction is required to continue the operation.
     * @param {WebProviderError} value The error that has occurred.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.webaccountprovidergettokensilentoperation.reportuserinteractionrequired
     */
    ReportUserInteractionRequiredWithError(value) {
        if (!this.HasProp("__IWebAccountProviderSilentReportOperation")) {
            if ((queryResult := this.QueryInterface(IWebAccountProviderSilentReportOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebAccountProviderSilentReportOperation := IWebAccountProviderSilentReportOperation(outPtr)
        }

        return this.__IWebAccountProviderSilentReportOperation.ReportUserInteractionRequiredWithError(value)
    }

    /**
     * Informs the activating app that the operation completed successfully.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.webaccountprovidergettokensilentoperation.reportcompleted
     */
    ReportCompleted() {
        if (!this.HasProp("__IWebAccountProviderBaseReportOperation")) {
            if ((queryResult := this.QueryInterface(IWebAccountProviderBaseReportOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebAccountProviderBaseReportOperation := IWebAccountProviderBaseReportOperation(outPtr)
        }

        return this.__IWebAccountProviderBaseReportOperation.ReportCompleted()
    }

    /**
     * Informs the activating app that the operation encountered an error.
     * @param {WebProviderError} value The type of error encountered.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.webaccountprovidergettokensilentoperation.reporterror
     */
    ReportError(value) {
        if (!this.HasProp("__IWebAccountProviderBaseReportOperation")) {
            if ((queryResult := this.QueryInterface(IWebAccountProviderBaseReportOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebAccountProviderBaseReportOperation := IWebAccountProviderBaseReportOperation(outPtr)
        }

        return this.__IWebAccountProviderBaseReportOperation.ReportError(value)
    }

;@endregion Instance Methods
}
