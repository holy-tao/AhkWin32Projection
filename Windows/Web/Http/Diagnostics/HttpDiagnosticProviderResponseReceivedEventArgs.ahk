#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHttpDiagnosticProviderResponseReceivedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for the [ResponseReceived](httpdiagnosticprovider_responsereceived.md) event.
 * @remarks
 * The system generates this class and passes it as an argument to the application's [ResponseReceived](httpdiagnosticprovider_responsereceived.md) event handler.
 * @see https://learn.microsoft.com/uwp/api/windows.web.http.diagnostics.httpdiagnosticproviderresponsereceivedeventargs
 * @namespace Windows.Web.Http.Diagnostics
 * @version WindowsRuntime 1.4
 */
class HttpDiagnosticProviderResponseReceivedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHttpDiagnosticProviderResponseReceivedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHttpDiagnosticProviderResponseReceivedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the timestamp of when the [HttpResponseMessage](../windows.web.http/httpresponsemessage.md) was received.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.diagnostics.httpdiagnosticproviderresponsereceivedeventargs.timestamp
     * @type {DateTime} 
     */
    Timestamp {
        get => this.get_Timestamp()
    }

    /**
     * Gets a locally unique ID for this activity, for correlating with other events.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.diagnostics.httpdiagnosticproviderresponsereceivedeventargs.activityid
     * @type {Guid} 
     */
    ActivityId {
        get => this.get_ActivityId()
    }

    /**
     * Gets the [HttpResponseMessage](../windows.web.http/httpresponsemessage.md) including headers, the status code, and data.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.diagnostics.httpdiagnosticproviderresponsereceivedeventargs.message
     * @type {HttpResponseMessage} 
     */
    Message {
        get => this.get_Message()
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
        if (!this.HasProp("__IHttpDiagnosticProviderResponseReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IHttpDiagnosticProviderResponseReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpDiagnosticProviderResponseReceivedEventArgs := IHttpDiagnosticProviderResponseReceivedEventArgs(outPtr)
        }

        return this.__IHttpDiagnosticProviderResponseReceivedEventArgs.get_Timestamp()
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_ActivityId() {
        if (!this.HasProp("__IHttpDiagnosticProviderResponseReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IHttpDiagnosticProviderResponseReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpDiagnosticProviderResponseReceivedEventArgs := IHttpDiagnosticProviderResponseReceivedEventArgs(outPtr)
        }

        return this.__IHttpDiagnosticProviderResponseReceivedEventArgs.get_ActivityId()
    }

    /**
     * 
     * @returns {HttpResponseMessage} 
     */
    get_Message() {
        if (!this.HasProp("__IHttpDiagnosticProviderResponseReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IHttpDiagnosticProviderResponseReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpDiagnosticProviderResponseReceivedEventArgs := IHttpDiagnosticProviderResponseReceivedEventArgs(outPtr)
        }

        return this.__IHttpDiagnosticProviderResponseReceivedEventArgs.get_Message()
    }

;@endregion Instance Methods
}
