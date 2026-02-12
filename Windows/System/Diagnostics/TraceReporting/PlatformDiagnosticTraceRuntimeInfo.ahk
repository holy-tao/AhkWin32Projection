#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPlatformDiagnosticTraceRuntimeInfo.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides timestamp information about the trace.
 * @remarks
 * > [!IMPORTANT]
 * > Only first-party applications should use this class.
 * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.tracereporting.platformdiagnostictraceruntimeinfo
 * @namespace Windows.System.Diagnostics.TraceReporting
 * @version WindowsRuntime 1.4
 */
class PlatformDiagnosticTraceRuntimeInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPlatformDiagnosticTraceRuntimeInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPlatformDiagnosticTraceRuntimeInfo.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The timestamp (in ticks) for the trace.
     * @remarks
     * A Windows file time is a 64-bit value that represents the number of 100-nanosecond intervals that have elapsed since 12:00 midnight, January 1, 1601 A.D. (C.E.) Coordinated Universal Time (UTC). Windows uses a file time to record when an application creates, accesses, or writes to a file.
     * 
     * Convert the return value to a DateTime with DateTime.FromFileTimeUtc();
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.tracereporting.platformdiagnostictraceruntimeinfo.runtimefiletime
     * @type {Integer} 
     */
    RuntimeFileTime {
        get => this.get_RuntimeFileTime()
    }

    /**
     * The internal time stamp (in ticks) for the Event Tracing for Windows (ETW) file.
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.tracereporting.platformdiagnostictraceruntimeinfo.etwruntimefiletime
     * @type {Integer} 
     */
    EtwRuntimeFileTime {
        get => this.get_EtwRuntimeFileTime()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RuntimeFileTime() {
        if (!this.HasProp("__IPlatformDiagnosticTraceRuntimeInfo")) {
            if ((queryResult := this.QueryInterface(IPlatformDiagnosticTraceRuntimeInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlatformDiagnosticTraceRuntimeInfo := IPlatformDiagnosticTraceRuntimeInfo(outPtr)
        }

        return this.__IPlatformDiagnosticTraceRuntimeInfo.get_RuntimeFileTime()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_EtwRuntimeFileTime() {
        if (!this.HasProp("__IPlatformDiagnosticTraceRuntimeInfo")) {
            if ((queryResult := this.QueryInterface(IPlatformDiagnosticTraceRuntimeInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlatformDiagnosticTraceRuntimeInfo := IPlatformDiagnosticTraceRuntimeInfo(outPtr)
        }

        return this.__IPlatformDiagnosticTraceRuntimeInfo.get_EtwRuntimeFileTime()
    }

;@endregion Instance Methods
}
