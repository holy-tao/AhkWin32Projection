#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes the state of a trace.
 * @remarks
 * > [!IMPORTANT]
 * > Only first-party applications should use this type.
 * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.tracereporting.platformdiagnostictraceslotstate
 * @namespace Windows.System.Diagnostics.TraceReporting
 * @version WindowsRuntime 1.4
 */
class PlatformDiagnosticTraceSlotState extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NotRunning => 0

    /**
     * @type {Integer (Int32)}
     */
    static Running => 1

    /**
     * @type {Integer (Int32)}
     */
    static Throttled => 2
}
