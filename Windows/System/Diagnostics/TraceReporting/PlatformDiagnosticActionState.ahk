#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the outcome of a diagnostic trace operation.
 * @remarks
 * > [!IMPORTANT]
 * > Only first-party applications should use this type.
 * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.tracereporting.platformdiagnosticactionstate
 * @namespace Windows.System.Diagnostics.TraceReporting
 * @version WindowsRuntime 1.4
 */
class PlatformDiagnosticActionState extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * @type {Integer (Int32)}
     */
    static FreeNetworkNotAvailable => 1

    /**
     * @type {Integer (Int32)}
     */
    static ACPowerNotAvailable => 2
}
