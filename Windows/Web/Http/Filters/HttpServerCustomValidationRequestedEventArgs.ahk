#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHttpServerCustomValidationRequestedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for the [ServerCustomValidationRequested](httpbaseprotocolfilter_servercustomvalidationrequested.md) event.
 * @remarks
 * This class is retrieved by the [ServerCustomValidationRequested](httpbaseprotocolfilter_servercustomvalidationrequested.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.web.http.filters.httpservercustomvalidationrequestedeventargs
 * @namespace Windows.Web.Http.Filters
 * @version WindowsRuntime 1.4
 */
class HttpServerCustomValidationRequestedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHttpServerCustomValidationRequestedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHttpServerCustomValidationRequestedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the HTTP request containing the destination URI, headers, and body.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.filters.httpservercustomvalidationrequestedeventargs.requestmessage
     * @type {HttpRequestMessage} 
     */
    RequestMessage {
        get => this.get_RequestMessage()
    }

    /**
     * Gets the X509Certificate provided by the server.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.filters.httpservercustomvalidationrequestedeventargs.servercertificate
     * @type {Certificate} 
     */
    ServerCertificate {
        get => this.get_ServerCertificate()
    }

    /**
     * Gets the severity level of errors encountered.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.filters.httpservercustomvalidationrequestedeventargs.servercertificateerrorseverity
     * @type {Integer} 
     */
    ServerCertificateErrorSeverity {
        get => this.get_ServerCertificateErrorSeverity()
    }

    /**
     * Gets the errors that the OS validation logic has found in this certificate or the chain.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.filters.httpservercustomvalidationrequestedeventargs.servercertificateerrors
     * @type {IVectorView<Integer>} 
     */
    ServerCertificateErrors {
        get => this.get_ServerCertificateErrors()
    }

    /**
     * Gets the chain of intermediate certificates, ending in the root CA associated with the remote certificate.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.filters.httpservercustomvalidationrequestedeventargs.serverintermediatecertificates
     * @type {IVectorView<Certificate>} 
     */
    ServerIntermediateCertificates {
        get => this.get_ServerIntermediateCertificates()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HttpRequestMessage} 
     */
    get_RequestMessage() {
        if (!this.HasProp("__IHttpServerCustomValidationRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IHttpServerCustomValidationRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpServerCustomValidationRequestedEventArgs := IHttpServerCustomValidationRequestedEventArgs(outPtr)
        }

        return this.__IHttpServerCustomValidationRequestedEventArgs.get_RequestMessage()
    }

    /**
     * 
     * @returns {Certificate} 
     */
    get_ServerCertificate() {
        if (!this.HasProp("__IHttpServerCustomValidationRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IHttpServerCustomValidationRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpServerCustomValidationRequestedEventArgs := IHttpServerCustomValidationRequestedEventArgs(outPtr)
        }

        return this.__IHttpServerCustomValidationRequestedEventArgs.get_ServerCertificate()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ServerCertificateErrorSeverity() {
        if (!this.HasProp("__IHttpServerCustomValidationRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IHttpServerCustomValidationRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpServerCustomValidationRequestedEventArgs := IHttpServerCustomValidationRequestedEventArgs(outPtr)
        }

        return this.__IHttpServerCustomValidationRequestedEventArgs.get_ServerCertificateErrorSeverity()
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_ServerCertificateErrors() {
        if (!this.HasProp("__IHttpServerCustomValidationRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IHttpServerCustomValidationRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpServerCustomValidationRequestedEventArgs := IHttpServerCustomValidationRequestedEventArgs(outPtr)
        }

        return this.__IHttpServerCustomValidationRequestedEventArgs.get_ServerCertificateErrors()
    }

    /**
     * 
     * @returns {IVectorView<Certificate>} 
     */
    get_ServerIntermediateCertificates() {
        if (!this.HasProp("__IHttpServerCustomValidationRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IHttpServerCustomValidationRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpServerCustomValidationRequestedEventArgs := IHttpServerCustomValidationRequestedEventArgs(outPtr)
        }

        return this.__IHttpServerCustomValidationRequestedEventArgs.get_ServerIntermediateCertificates()
    }

    /**
     * Reject the server's certificate. This will result in the client terminating the connection to the server.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.filters.httpservercustomvalidationrequestedeventargs.reject
     */
    Reject() {
        if (!this.HasProp("__IHttpServerCustomValidationRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IHttpServerCustomValidationRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpServerCustomValidationRequestedEventArgs := IHttpServerCustomValidationRequestedEventArgs(outPtr)
        }

        return this.__IHttpServerCustomValidationRequestedEventArgs.Reject()
    }

    /**
     * Requests that suspension of the event handler be delayed until the deferral is completed by calling the Complete method on the Deferral object.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.filters.httpservercustomvalidationrequestedeventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IHttpServerCustomValidationRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IHttpServerCustomValidationRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpServerCustomValidationRequestedEventArgs := IHttpServerCustomValidationRequestedEventArgs(outPtr)
        }

        return this.__IHttpServerCustomValidationRequestedEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
