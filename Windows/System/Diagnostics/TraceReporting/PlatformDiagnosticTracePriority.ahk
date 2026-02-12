#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes the priority of a trace.
 * @remarks
 * > [!IMPORTANT]
 * > Only first-party applications should use this type.
 * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.tracereporting.platformdiagnostictracepriority
 * @namespace Windows.System.Diagnostics.TraceReporting
 * @version WindowsRuntime 1.4
 */
class PlatformDiagnosticTracePriority extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static Normal => 0

    /**
     * @type {Integer (Int32)}
     */
    static UserElevated => 1
}
