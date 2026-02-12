#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHttpDiagnosticProviderRequestSentEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for the [RequestSent](httpdiagnosticprovider_requestsent.md) event.
 * @remarks
 * The system generates this class and passes it as an argument to the application's [RequestSent](httpdiagnosticprovider_requestsent.md) event handler.
 * @see https://learn.microsoft.com/uwp/api/windows.web.http.diagnostics.httpdiagnosticproviderrequestsenteventargs
 * @namespace Windows.Web.Http.Diagnostics
 * @version WindowsRuntime 1.4
 */
class HttpDiagnosticProviderRequestSentEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHttpDiagnosticProviderRequestSentEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHttpDiagnosticProviderRequestSentEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the timestamp of when the [HttpRequestMessage](../windows.web.http/httprequestmessage.md) was sent.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.diagnostics.httpdiagnosticproviderrequestsenteventargs.timestamp
     * @type {DateTime} 
     */
    Timestamp {
        get => this.get_Timestamp()
    }

    /**
     * Gets a locally unique ID for this activity, for correlating with other events.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.diagnostics.httpdiagnosticproviderrequestsenteventargs.activityid
     * @type {Guid} 
     */
    ActivityId {
        get => this.get_ActivityId()
    }

    /**
     * Gets the [HttpRequestMessage](../windows.web.http/httprequestmessage.md) including headers.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.diagnostics.httpdiagnosticproviderrequestsenteventargs.message
     * @type {HttpRequestMessage} 
     */
    Message {
        get => this.get_Message()
    }

    /**
     * Gets the process ID.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.diagnostics.httpdiagnosticproviderrequestsenteventargs.processid
     * @type {Integer} 
     */
    ProcessId {
        get => this.get_ProcessId()
    }

    /**
     * Gets the thread ID.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.diagnostics.httpdiagnosticproviderrequestsenteventargs.threadid
     * @type {Integer} 
     */
    ThreadId {
        get => this.get_ThreadId()
    }

    /**
     * Gets the type of operation initiating this request.
     * @remarks
     * This is optionally set and is empty if not available.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.diagnostics.httpdiagnosticproviderrequestsenteventargs.initiator
     * @type {Integer} 
     */
    Initiator {
        get => this.get_Initiator()
    }

    /**
     * Gets the source location call stack.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.diagnostics.httpdiagnosticproviderrequestsenteventargs.sourcelocations
     * @type {IVectorView<HttpDiagnosticSourceLocation>} 
     */
    SourceLocations {
        get => this.get_SourceLocations()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_Timestamp() {
        if (!this.HasProp("__IHttpDiagnosticProviderRequestSentEventArgs")) {
            if ((queryResult := this.QueryInterface(IHttpDiagnosticProviderRequestSentEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpDiagnosticProviderRequestSentEventArgs := IHttpDiagnosticProviderRequestSentEventArgs(outPtr)
        }

        return this.__IHttpDiagnosticProviderRequestSentEventArgs.get_Timestamp()
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_ActivityId() {
        if (!this.HasProp("__IHttpDiagnosticProviderRequestSentEventArgs")) {
            if ((queryResult := this.QueryInterface(IHttpDiagnosticProviderRequestSentEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpDiagnosticProviderRequestSentEventArgs := IHttpDiagnosticProviderRequestSentEventArgs(outPtr)
        }

        return this.__IHttpDiagnosticProviderRequestSentEventArgs.get_ActivityId()
    }

    /**
     * 
     * @returns {HttpRequestMessage} 
     */
    get_Message() {
        if (!this.HasProp("__IHttpDiagnosticProviderRequestSentEventArgs")) {
            if ((queryResult := this.QueryInterface(IHttpDiagnosticProviderRequestSentEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpDiagnosticProviderRequestSentEventArgs := IHttpDiagnosticProviderRequestSentEventArgs(outPtr)
        }

        return this.__IHttpDiagnosticProviderRequestSentEventArgs.get_Message()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ProcessId() {
        if (!this.HasProp("__IHttpDiagnosticProviderRequestSentEventArgs")) {
            if ((queryResult := this.QueryInterface(IHttpDiagnosticProviderRequestSentEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpDiagnosticProviderRequestSentEventArgs := IHttpDiagnosticProviderRequestSentEventArgs(outPtr)
        }

        return this.__IHttpDiagnosticProviderRequestSentEventArgs.get_ProcessId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ThreadId() {
        if (!this.HasProp("__IHttpDiagnosticProviderRequestSentEventArgs")) {
            if ((queryResult := this.QueryInterface(IHttpDiagnosticProviderRequestSentEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpDiagnosticProviderRequestSentEventArgs := IHttpDiagnosticProviderRequestSentEventArgs(outPtr)
        }

        return this.__IHttpDiagnosticProviderRequestSentEventArgs.get_ThreadId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Initiator() {
        if (!this.HasProp("__IHttpDiagnosticProviderRequestSentEventArgs")) {
            if ((queryResult := this.QueryInterface(IHttpDiagnosticProviderRequestSentEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpDiagnosticProviderRequestSentEventArgs := IHttpDiagnosticProviderRequestSentEventArgs(outPtr)
        }

        return this.__IHttpDiagnosticProviderRequestSentEventArgs.get_Initiator()
    }

    /**
     * 
     * @returns {IVectorView<HttpDiagnosticSourceLocation>} 
     */
    get_SourceLocations() {
        if (!this.HasProp("__IHttpDiagnosticProviderRequestSentEventArgs")) {
            if ((queryResult := this.QueryInterface(IHttpDiagnosticProviderRequestSentEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpDiagnosticProviderRequestSentEventArgs := IHttpDiagnosticProviderRequestSentEventArgs(outPtr)
        }

        return this.__IHttpDiagnosticProviderRequestSentEventArgs.get_SourceLocations()
    }

;@endregion Instance Methods
}
