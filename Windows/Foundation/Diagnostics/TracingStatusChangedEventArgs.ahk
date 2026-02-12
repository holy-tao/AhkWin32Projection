#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITracingStatusChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [TracingStatusChanged](asynccausalitytracer_tracingstatuschanged.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.tracingstatuschangedeventargs
 * @namespace Windows.Foundation.Diagnostics
 * @version WindowsRuntime 1.4
 */
class TracingStatusChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITracingStatusChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITracingStatusChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that indicates whether tracing is active.
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.tracingstatuschangedeventargs.enabled
     * @type {Boolean} 
     */
    Enabled {
        get => this.get_Enabled()
    }

    /**
     * Gets the trace level for the current tracing session.
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.tracingstatuschangedeventargs.tracelevel
     * @type {Integer} 
     */
    TraceLevel {
        get => this.get_TraceLevel()
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
    get_Enabled() {
        if (!this.HasProp("__ITracingStatusChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(ITracingStatusChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITracingStatusChangedEventArgs := ITracingStatusChangedEventArgs(outPtr)
        }

        return this.__ITracingStatusChangedEventArgs.get_Enabled()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TraceLevel() {
        if (!this.HasProp("__ITracingStatusChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(ITracingStatusChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITracingStatusChangedEventArgs := ITracingStatusChangedEventArgs(outPtr)
        }

        return this.__ITracingStatusChangedEventArgs.get_TraceLevel()
    }

;@endregion Instance Methods
}
