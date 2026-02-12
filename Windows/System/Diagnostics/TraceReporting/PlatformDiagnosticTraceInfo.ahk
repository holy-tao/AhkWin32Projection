#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPlatformDiagnosticTraceInfo.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides information about the trace.
 * @remarks
 * > [!IMPORTANT]
 * > Only first-party applications should use this class.
 * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.tracereporting.platformdiagnostictraceinfo
 * @namespace Windows.System.Diagnostics.TraceReporting
 * @version WindowsRuntime 1.4
 */
class PlatformDiagnosticTraceInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPlatformDiagnosticTraceInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPlatformDiagnosticTraceInfo.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * A unique identifier for this scenario.
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.tracereporting.platformdiagnostictraceinfo.scenarioid
     * @type {Guid} 
     */
    ScenarioId {
        get => this.get_ScenarioId()
    }

    /**
     * An identifier for this trace.
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.tracereporting.platformdiagnostictraceinfo.profilehash
     * @type {Integer} 
     */
    ProfileHash {
        get => this.get_ProfileHash()
    }

    /**
     * Indicates whether the trace is exclusive.
     * @remarks
     * An exclusive trace can be the only trace running. All other traces will be throttled while an exclusive trace is running.
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.tracereporting.platformdiagnostictraceinfo.isexclusive
     * @type {Boolean} 
     */
    IsExclusive {
        get => this.get_IsExclusive()
    }

    /**
     * Indicates whether the trace is from an ETW AutoLogger session.
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.tracereporting.platformdiagnostictraceinfo.isautologger
     * @type {Boolean} 
     */
    IsAutoLogger {
        get => this.get_IsAutoLogger()
    }

    /**
     * Trace files are circular. This property reflects the amount of time that will pass before the trace file starts writing over itself--starting at the beginning of the file.
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.tracereporting.platformdiagnostictraceinfo.maxtracedurationfiletime
     * @type {Integer} 
     */
    MaxTraceDurationFileTime {
        get => this.get_MaxTraceDurationFileTime()
    }

    /**
     * The trace priority.
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.tracereporting.platformdiagnostictraceinfo.priority
     * @type {Integer} 
     */
    Priority {
        get => this.get_Priority()
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
    get_ScenarioId() {
        if (!this.HasProp("__IPlatformDiagnosticTraceInfo")) {
            if ((queryResult := this.QueryInterface(IPlatformDiagnosticTraceInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlatformDiagnosticTraceInfo := IPlatformDiagnosticTraceInfo(outPtr)
        }

        return this.__IPlatformDiagnosticTraceInfo.get_ScenarioId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ProfileHash() {
        if (!this.HasProp("__IPlatformDiagnosticTraceInfo")) {
            if ((queryResult := this.QueryInterface(IPlatformDiagnosticTraceInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlatformDiagnosticTraceInfo := IPlatformDiagnosticTraceInfo(outPtr)
        }

        return this.__IPlatformDiagnosticTraceInfo.get_ProfileHash()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsExclusive() {
        if (!this.HasProp("__IPlatformDiagnosticTraceInfo")) {
            if ((queryResult := this.QueryInterface(IPlatformDiagnosticTraceInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlatformDiagnosticTraceInfo := IPlatformDiagnosticTraceInfo(outPtr)
        }

        return this.__IPlatformDiagnosticTraceInfo.get_IsExclusive()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsAutoLogger() {
        if (!this.HasProp("__IPlatformDiagnosticTraceInfo")) {
            if ((queryResult := this.QueryInterface(IPlatformDiagnosticTraceInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlatformDiagnosticTraceInfo := IPlatformDiagnosticTraceInfo(outPtr)
        }

        return this.__IPlatformDiagnosticTraceInfo.get_IsAutoLogger()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxTraceDurationFileTime() {
        if (!this.HasProp("__IPlatformDiagnosticTraceInfo")) {
            if ((queryResult := this.QueryInterface(IPlatformDiagnosticTraceInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlatformDiagnosticTraceInfo := IPlatformDiagnosticTraceInfo(outPtr)
        }

        return this.__IPlatformDiagnosticTraceInfo.get_MaxTraceDurationFileTime()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Priority() {
        if (!this.HasProp("__IPlatformDiagnosticTraceInfo")) {
            if ((queryResult := this.QueryInterface(IPlatformDiagnosticTraceInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlatformDiagnosticTraceInfo := IPlatformDiagnosticTraceInfo(outPtr)
        }

        return this.__IPlatformDiagnosticTraceInfo.get_Priority()
    }

;@endregion Instance Methods
}
