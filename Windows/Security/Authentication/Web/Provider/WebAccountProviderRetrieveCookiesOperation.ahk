#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWebAccountProviderRetrieveCookiesOperation.ahk
#Include .\IWebAccountProviderOperation.ahk
#Include .\IWebAccountProviderBaseReportOperation.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Represents a retrieve cookies operation made by a web account provider.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.webaccountproviderretrievecookiesoperation
 * @namespace Windows.Security.Authentication.Web.Provider
 * @version WindowsRuntime 1.4
 */
class WebAccountProviderRetrieveCookiesOperation extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWebAccountProviderRetrieveCookiesOperation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWebAccountProviderRetrieveCookiesOperation.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the context of the retrieve cookies operation.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.webaccountproviderretrievecookiesoperation.context
     * @type {Uri} 
     */
    Context {
        get => this.get_Context()
    }

    /**
     * Gets the cookies.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.webaccountproviderretrievecookiesoperation.cookies
     * @type {IVector<HttpCookie>} 
     */
    Cookies {
        get => this.get_Cookies()
    }

    /**
     * Gets or sets the Uri to retrieve cookies from.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.webaccountproviderretrievecookiesoperation.uri
     * @type {Uri} 
     */
    Uri {
        get => this.get_Uri()
        set => this.put_Uri(value)
    }

    /**
     * Gets the app callback Uri.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.webaccountproviderretrievecookiesoperation.applicationcallbackuri
     * @type {Uri} 
     */
    ApplicationCallbackUri {
        get => this.get_ApplicationCallbackUri()
    }

    /**
     * Gets the kind of web account provider operation.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.webaccountproviderretrievecookiesoperation.kind
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
     * @returns {Uri} 
     */
    get_Context() {
        if (!this.HasProp("__IWebAccountProviderRetrieveCookiesOperation")) {
            if ((queryResult := this.QueryInterface(IWebAccountProviderRetrieveCookiesOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebAccountProviderRetrieveCookiesOperation := IWebAccountProviderRetrieveCookiesOperation(outPtr)
        }

        return this.__IWebAccountProviderRetrieveCookiesOperation.get_Context()
    }

    /**
     * 
     * @returns {IVector<HttpCookie>} 
     */
    get_Cookies() {
        if (!this.HasProp("__IWebAccountProviderRetrieveCookiesOperation")) {
            if ((queryResult := this.QueryInterface(IWebAccountProviderRetrieveCookiesOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebAccountProviderRetrieveCookiesOperation := IWebAccountProviderRetrieveCookiesOperation(outPtr)
        }

        return this.__IWebAccountProviderRetrieveCookiesOperation.get_Cookies()
    }

    /**
     * 
     * @param {Uri} uri_ 
     * @returns {HRESULT} 
     */
    put_Uri(uri_) {
        if (!this.HasProp("__IWebAccountProviderRetrieveCookiesOperation")) {
            if ((queryResult := this.QueryInterface(IWebAccountProviderRetrieveCookiesOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebAccountProviderRetrieveCookiesOperation := IWebAccountProviderRetrieveCookiesOperation(outPtr)
        }

        return this.__IWebAccountProviderRetrieveCookiesOperation.put_Uri(uri_)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_Uri() {
        if (!this.HasProp("__IWebAccountProviderRetrieveCookiesOperation")) {
            if ((queryResult := this.QueryInterface(IWebAccountProviderRetrieveCookiesOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebAccountProviderRetrieveCookiesOperation := IWebAccountProviderRetrieveCookiesOperation(outPtr)
        }

        return this.__IWebAccountProviderRetrieveCookiesOperation.get_Uri()
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_ApplicationCallbackUri() {
        if (!this.HasProp("__IWebAccountProviderRetrieveCookiesOperation")) {
            if ((queryResult := this.QueryInterface(IWebAccountProviderRetrieveCookiesOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebAccountProviderRetrieveCookiesOperation := IWebAccountProviderRetrieveCookiesOperation(outPtr)
        }

        return this.__IWebAccountProviderRetrieveCookiesOperation.get_ApplicationCallbackUri()
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
     * Informs the activating app that the operation completed successfully.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.webaccountproviderretrievecookiesoperation.reportcompleted
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
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.webaccountproviderretrievecookiesoperation.reporterror
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
