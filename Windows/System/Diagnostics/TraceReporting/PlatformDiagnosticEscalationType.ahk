#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the categories of escalation actions.
 * @remarks
 * > [!IMPORTANT]
 * > Only first-party applications should use this type.
 * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.tracereporting.platformdiagnosticescalationtype
 * @namespace Windows.System.Diagnostics.TraceReporting
 * @version WindowsRuntime 1.4
 */
class PlatformDiagnosticEscalationType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static OnCompletion => 0

    /**
     * @type {Integer (Int32)}
     */
    static OnFailure => 1
}
