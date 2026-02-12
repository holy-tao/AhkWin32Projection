#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHttpDiagnosticSourceLocation.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains the source location of the HTTP activity.
 * @remarks
 * The system generates this class and is accessible through the [HttpDiagnosticProviderRequestSentEventArgs.SourceLocations](httpdiagnosticproviderrequestsenteventargs_sourcelocations.md) property.
 * 
 * The [HttpDiagnosticProviderRequestSentEventArgs](httpdiagnosticproviderrequestsenteventargs.md) class is passed as an argument to the application's [RequestSent](httpdiagnosticprovider_requestsent.md) event handler.
 * @see https://learn.microsoft.com/uwp/api/windows.web.http.diagnostics.httpdiagnosticsourcelocation
 * @namespace Windows.Web.Http.Diagnostics
 * @version WindowsRuntime 1.4
 */
class HttpDiagnosticSourceLocation extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHttpDiagnosticSourceLocation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHttpDiagnosticSourceLocation.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the source URI.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.diagnostics.httpdiagnosticsourcelocation.sourceuri
     * @type {Uri} 
     */
    SourceUri {
        get => this.get_SourceUri()
    }

    /**
     * Gets the line number.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.diagnostics.httpdiagnosticsourcelocation.linenumber
     * @type {Integer} 
     */
    LineNumber {
        get => this.get_LineNumber()
    }

    /**
     * Gets the column number.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.diagnostics.httpdiagnosticsourcelocation.columnnumber
     * @type {Integer} 
     */
    ColumnNumber {
        get => this.get_ColumnNumber()
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
    get_SourceUri() {
        if (!this.HasProp("__IHttpDiagnosticSourceLocation")) {
            if ((queryResult := this.QueryInterface(IHttpDiagnosticSourceLocation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpDiagnosticSourceLocation := IHttpDiagnosticSourceLocation(outPtr)
        }

        return this.__IHttpDiagnosticSourceLocation.get_SourceUri()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LineNumber() {
        if (!this.HasProp("__IHttpDiagnosticSourceLocation")) {
            if ((queryResult := this.QueryInterface(IHttpDiagnosticSourceLocation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpDiagnosticSourceLocation := IHttpDiagnosticSourceLocation(outPtr)
        }

        return this.__IHttpDiagnosticSourceLocation.get_LineNumber()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ColumnNumber() {
        if (!this.HasProp("__IHttpDiagnosticSourceLocation")) {
            if ((queryResult := this.QueryInterface(IHttpDiagnosticSourceLocation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpDiagnosticSourceLocation := IHttpDiagnosticSourceLocation(outPtr)
        }

        return this.__IHttpDiagnosticSourceLocation.get_ColumnNumber()
    }

;@endregion Instance Methods
}
