#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the kinds of network connections that can be used to transfer diagnostic data.
 * @remarks
 * > [!IMPORTANT]
 * > Only first-party applications should use this type.
 * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.tracereporting.platformdiagnosticeventbufferlatencies
 * @namespace Windows.System.Diagnostics.TraceReporting
 * @version WindowsRuntime 1.4
 */
class PlatformDiagnosticEventBufferLatencies extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static Normal => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CostDeferred => 2

    /**
     * @type {Integer (UInt32)}
     */
    static Realtime => 4
}
