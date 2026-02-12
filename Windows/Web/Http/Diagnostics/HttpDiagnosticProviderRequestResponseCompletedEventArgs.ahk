#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHttpDiagnosticProviderRequestResponseCompletedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for the [RequestResponseCompleted](httpdiagnosticprovider_requestresponsecompleted.md) event.
 * @remarks
 * The system generates this class and passes it as an argument to the application's [ResponseCompleted](httpdiagnosticprovider_requestresponsecompleted.md) event handler.
 * @see https://learn.microsoft.com/uwp/api/windows.web.http.diagnostics.httpdiagnosticproviderrequestresponsecompletedeventargs
 * @namespace Windows.Web.Http.Diagnostics
 * @version WindowsRuntime 1.4
 */
class HttpDiagnosticProviderRequestResponseCompletedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHttpDiagnosticProviderRequestResponseCompletedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHttpDiagnosticProviderRequestResponseCompletedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a locally unique ID for this activity, for correlating with other events.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.diagnostics.httpdiagnosticproviderrequestresponsecompletedeventargs.activityid
     * @type {Guid} 
     */
    ActivityId {
        get => this.get_ActivityId()
    }

    /**
     * Gets the timestamp for connection events.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.diagnostics.httpdiagnosticproviderrequestresponsecompletedeventargs.timestamps
     * @type {HttpDiagnosticProviderRequestResponseTimestamps} 
     */
    Timestamps {
        get => this.get_Timestamps()
    }

    /**
     * Gets the URI of the requested response.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.diagnostics.httpdiagnosticproviderrequestresponsecompletedeventargs.requesteduri
     * @type {Uri} 
     */
    RequestedUri {
        get => this.get_RequestedUri()
    }

    /**
     * Gets the process ID.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.diagnostics.httpdiagnosticproviderrequestresponsecompletedeventargs.processid
     * @type {Integer} 
     */
    ProcessId {
        get => this.get_ProcessId()
    }

    /**
     * Gets the thread ID.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.diagnostics.httpdiagnosticproviderrequestresponsecompletedeventargs.threadid
     * @type {Integer} 
     */
    ThreadId {
        get => this.get_ThreadId()
    }

    /**
     * Gets the type of operation initiating this request.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.diagnostics.httpdiagnosticproviderrequestresponsecompletedeventargs.initiator
     * @type {Integer} 
     */
    Initiator {
        get => this.get_Initiator()
    }

    /**
     * Gets the source location call stack.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.diagnostics.httpdiagnosticproviderrequestresponsecompletedeventargs.sourcelocations
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
     * @returns {Guid} 
     */
    get_ActivityId() {
        if (!this.HasProp("__IHttpDiagnosticProviderRequestResponseCompletedEventArgs")) {
            if ((queryResult := this.QueryInterface(IHttpDiagnosticProviderRequestResponseCompletedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpDiagnosticProviderRequestResponseCompletedEventArgs := IHttpDiagnosticProviderRequestResponseCompletedEventArgs(outPtr)
        }

        return this.__IHttpDiagnosticProviderRequestResponseCompletedEventArgs.get_ActivityId()
    }

    /**
     * 
     * @returns {HttpDiagnosticProviderRequestResponseTimestamps} 
     */
    get_Timestamps() {
        if (!this.HasProp("__IHttpDiagnosticProviderRequestResponseCompletedEventArgs")) {
            if ((queryResult := this.QueryInterface(IHttpDiagnosticProviderRequestResponseCompletedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpDiagnosticProviderRequestResponseCompletedEventArgs := IHttpDiagnosticProviderRequestResponseCompletedEventArgs(outPtr)
        }

        return this.__IHttpDiagnosticProviderRequestResponseCompletedEventArgs.get_Timestamps()
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_RequestedUri() {
        if (!this.HasProp("__IHttpDiagnosticProviderRequestResponseCompletedEventArgs")) {
            if ((queryResult := this.QueryInterface(IHttpDiagnosticProviderRequestResponseCompletedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpDiagnosticProviderRequestResponseCompletedEventArgs := IHttpDiagnosticProviderRequestResponseCompletedEventArgs(outPtr)
        }

        return this.__IHttpDiagnosticProviderRequestResponseCompletedEventArgs.get_RequestedUri()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ProcessId() {
        if (!this.HasProp("__IHttpDiagnosticProviderRequestResponseCompletedEventArgs")) {
            if ((queryResult := this.QueryInterface(IHttpDiagnosticProviderRequestResponseCompletedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpDiagnosticProviderRequestResponseCompletedEventArgs := IHttpDiagnosticProviderRequestResponseCompletedEventArgs(outPtr)
        }

        return this.__IHttpDiagnosticProviderRequestResponseCompletedEventArgs.get_ProcessId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ThreadId() {
        if (!this.HasProp("__IHttpDiagnosticProviderRequestResponseCompletedEventArgs")) {
            if ((queryResult := this.QueryInterface(IHttpDiagnosticProviderRequestResponseCompletedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpDiagnosticProviderRequestResponseCompletedEventArgs := IHttpDiagnosticProviderRequestResponseCompletedEventArgs(outPtr)
        }

        return this.__IHttpDiagnosticProviderRequestResponseCompletedEventArgs.get_ThreadId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Initiator() {
        if (!this.HasProp("__IHttpDiagnosticProviderRequestResponseCompletedEventArgs")) {
            if ((queryResult := this.QueryInterface(IHttpDiagnosticProviderRequestResponseCompletedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpDiagnosticProviderRequestResponseCompletedEventArgs := IHttpDiagnosticProviderRequestResponseCompletedEventArgs(outPtr)
        }

        return this.__IHttpDiagnosticProviderRequestResponseCompletedEventArgs.get_Initiator()
    }

    /**
     * 
     * @returns {IVectorView<HttpDiagnosticSourceLocation>} 
     */
    get_SourceLocations() {
        if (!this.HasProp("__IHttpDiagnosticProviderRequestResponseCompletedEventArgs")) {
            if ((queryResult := this.QueryInterface(IHttpDiagnosticProviderRequestResponseCompletedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpDiagnosticProviderRequestResponseCompletedEventArgs := IHttpDiagnosticProviderRequestResponseCompletedEventArgs(outPtr)
        }

        return this.__IHttpDiagnosticProviderRequestResponseCompletedEventArgs.get_SourceLocations()
    }

;@endregion Instance Methods
}
