#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHttpDiagnosticProviderRequestResponseTimestamps.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides all the timestamps for connection events.
 * @remarks
 * The system generates this class and is accessible through the [HttpDiagnosticProviderRequestResponseCompletedEventArgs.Timestamps](httpdiagnosticproviderrequestresponsecompletedeventargs_timestamps.md) property.
 * 
 * The [HttpDiagnosticProviderRequestResponseCompletedEventArgs](httpdiagnosticproviderrequestresponsecompletedeventargs.md) class is passed as an argument to the application's [ResponseCompleted](httpdiagnosticprovider_requestresponsecompleted.md) event handler.
 * @see https://learn.microsoft.com/uwp/api/windows.web.http.diagnostics.httpdiagnosticproviderrequestresponsetimestamps
 * @namespace Windows.Web.Http.Diagnostics
 * @version WindowsRuntime 1.4
 */
class HttpDiagnosticProviderRequestResponseTimestamps extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHttpDiagnosticProviderRequestResponseTimestamps

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHttpDiagnosticProviderRequestResponseTimestamps.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the last time local cache was checked.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.diagnostics.httpdiagnosticproviderrequestresponsetimestamps.cachecheckedtimestamp
     * @type {IReference<DateTime>} 
     */
    CacheCheckedTimestamp {
        get => this.get_CacheCheckedTimestamp()
    }

    /**
     * Gets the timestamp for the start of the TCP connection phase.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.diagnostics.httpdiagnosticproviderrequestresponsetimestamps.connectioninitiatedtimestamp
     * @type {IReference<DateTime>} 
     */
    ConnectionInitiatedTimestamp {
        get => this.get_ConnectionInitiatedTimestamp()
    }

    /**
     * Gets the time of the DNS name resolution.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.diagnostics.httpdiagnosticproviderrequestresponsetimestamps.nameresolvedtimestamp
     * @type {IReference<DateTime>} 
     */
    NameResolvedTimestamp {
        get => this.get_NameResolvedTimestamp()
    }

    /**
     * Gets the time of the SSL handshake negotiation.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.diagnostics.httpdiagnosticproviderrequestresponsetimestamps.sslnegotiatedtimestamp
     * @type {IReference<DateTime>} 
     */
    SslNegotiatedTimestamp {
        get => this.get_SslNegotiatedTimestamp()
    }

    /**
     * Gets the timestamp for the end of the TCP connection phase.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.diagnostics.httpdiagnosticproviderrequestresponsetimestamps.connectioncompletedtimestamp
     * @type {IReference<DateTime>} 
     */
    ConnectionCompletedTimestamp {
        get => this.get_ConnectionCompletedTimestamp()
    }

    /**
     * Gets the timestamp for the first byte sent.
     * @remarks
     * This property is equal to the [HttpDiagnosticsProviderRequestSentEventArgs.Timestamp](httpdiagnosticproviderrequestsenteventargs_timestamp.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.diagnostics.httpdiagnosticproviderrequestresponsetimestamps.requestsenttimestamp
     * @type {IReference<DateTime>} 
     */
    RequestSentTimestamp {
        get => this.get_RequestSentTimestamp()
    }

    /**
     * Gets the timestamp for the last byte sent.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.diagnostics.httpdiagnosticproviderrequestresponsetimestamps.requestcompletedtimestamp
     * @type {IReference<DateTime>} 
     */
    RequestCompletedTimestamp {
        get => this.get_RequestCompletedTimestamp()
    }

    /**
     * Gets the timestamp for the fir byte received.
     * @remarks
     * This property is equal to the [HttpDiagnosticsProviderResponseReceivedEventArgs.Timestamp](httpdiagnosticproviderrequestsenteventargs_timestamp.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.diagnostics.httpdiagnosticproviderrequestresponsetimestamps.responsereceivedtimestamp
     * @type {IReference<DateTime>} 
     */
    ResponseReceivedTimestamp {
        get => this.get_ResponseReceivedTimestamp()
    }

    /**
     * Gets the timestamp for the last byte received.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.diagnostics.httpdiagnosticproviderrequestresponsetimestamps.responsecompletedtimestamp
     * @type {IReference<DateTime>} 
     */
    ResponseCompletedTimestamp {
        get => this.get_ResponseCompletedTimestamp()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_CacheCheckedTimestamp() {
        if (!this.HasProp("__IHttpDiagnosticProviderRequestResponseTimestamps")) {
            if ((queryResult := this.QueryInterface(IHttpDiagnosticProviderRequestResponseTimestamps.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpDiagnosticProviderRequestResponseTimestamps := IHttpDiagnosticProviderRequestResponseTimestamps(outPtr)
        }

        return this.__IHttpDiagnosticProviderRequestResponseTimestamps.get_CacheCheckedTimestamp()
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_ConnectionInitiatedTimestamp() {
        if (!this.HasProp("__IHttpDiagnosticProviderRequestResponseTimestamps")) {
            if ((queryResult := this.QueryInterface(IHttpDiagnosticProviderRequestResponseTimestamps.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpDiagnosticProviderRequestResponseTimestamps := IHttpDiagnosticProviderRequestResponseTimestamps(outPtr)
        }

        return this.__IHttpDiagnosticProviderRequestResponseTimestamps.get_ConnectionInitiatedTimestamp()
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_NameResolvedTimestamp() {
        if (!this.HasProp("__IHttpDiagnosticProviderRequestResponseTimestamps")) {
            if ((queryResult := this.QueryInterface(IHttpDiagnosticProviderRequestResponseTimestamps.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpDiagnosticProviderRequestResponseTimestamps := IHttpDiagnosticProviderRequestResponseTimestamps(outPtr)
        }

        return this.__IHttpDiagnosticProviderRequestResponseTimestamps.get_NameResolvedTimestamp()
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_SslNegotiatedTimestamp() {
        if (!this.HasProp("__IHttpDiagnosticProviderRequestResponseTimestamps")) {
            if ((queryResult := this.QueryInterface(IHttpDiagnosticProviderRequestResponseTimestamps.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpDiagnosticProviderRequestResponseTimestamps := IHttpDiagnosticProviderRequestResponseTimestamps(outPtr)
        }

        return this.__IHttpDiagnosticProviderRequestResponseTimestamps.get_SslNegotiatedTimestamp()
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_ConnectionCompletedTimestamp() {
        if (!this.HasProp("__IHttpDiagnosticProviderRequestResponseTimestamps")) {
            if ((queryResult := this.QueryInterface(IHttpDiagnosticProviderRequestResponseTimestamps.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpDiagnosticProviderRequestResponseTimestamps := IHttpDiagnosticProviderRequestResponseTimestamps(outPtr)
        }

        return this.__IHttpDiagnosticProviderRequestResponseTimestamps.get_ConnectionCompletedTimestamp()
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_RequestSentTimestamp() {
        if (!this.HasProp("__IHttpDiagnosticProviderRequestResponseTimestamps")) {
            if ((queryResult := this.QueryInterface(IHttpDiagnosticProviderRequestResponseTimestamps.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpDiagnosticProviderRequestResponseTimestamps := IHttpDiagnosticProviderRequestResponseTimestamps(outPtr)
        }

        return this.__IHttpDiagnosticProviderRequestResponseTimestamps.get_RequestSentTimestamp()
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_RequestCompletedTimestamp() {
        if (!this.HasProp("__IHttpDiagnosticProviderRequestResponseTimestamps")) {
            if ((queryResult := this.QueryInterface(IHttpDiagnosticProviderRequestResponseTimestamps.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpDiagnosticProviderRequestResponseTimestamps := IHttpDiagnosticProviderRequestResponseTimestamps(outPtr)
        }

        return this.__IHttpDiagnosticProviderRequestResponseTimestamps.get_RequestCompletedTimestamp()
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_ResponseReceivedTimestamp() {
        if (!this.HasProp("__IHttpDiagnosticProviderRequestResponseTimestamps")) {
            if ((queryResult := this.QueryInterface(IHttpDiagnosticProviderRequestResponseTimestamps.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpDiagnosticProviderRequestResponseTimestamps := IHttpDiagnosticProviderRequestResponseTimestamps(outPtr)
        }

        return this.__IHttpDiagnosticProviderRequestResponseTimestamps.get_ResponseReceivedTimestamp()
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_ResponseCompletedTimestamp() {
        if (!this.HasProp("__IHttpDiagnosticProviderRequestResponseTimestamps")) {
            if ((queryResult := this.QueryInterface(IHttpDiagnosticProviderRequestResponseTimestamps.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpDiagnosticProviderRequestResponseTimestamps := IHttpDiagnosticProviderRequestResponseTimestamps(outPtr)
        }

        return this.__IHttpDiagnosticProviderRequestResponseTimestamps.get_ResponseCompletedTimestamp()
    }

;@endregion Instance Methods
}
