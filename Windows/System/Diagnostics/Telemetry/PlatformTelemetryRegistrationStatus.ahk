#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Provides information about the status of registering a client with the Connected User Experience and Telemetry component.
 * @remarks
 * > [!IMPORTANT]
 * > Only first-party applications should use this type.
 * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.telemetry.platformtelemetryregistrationstatus
 * @namespace Windows.System.Diagnostics.Telemetry
 * @version WindowsRuntime 1.4
 */
class PlatformTelemetryRegistrationStatus extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * @type {Integer (Int32)}
     */
    static SettingsOutOfRange => 1

    /**
     * @type {Integer (Int32)}
     */
    static UnknownFailure => 2
}
