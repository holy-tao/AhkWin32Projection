#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the constants that indicates the error severity.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.unifiedposerrorseverity
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class UnifiedPosErrorSeverity extends Win32Enum{

    /**
     * An unknown error severity.
     * @type {Integer (Int32)}
     */
    static UnknownErrorSeverity => 0

    /**
     * A warning.
     * @type {Integer (Int32)}
     */
    static Warning => 1

    /**
     * A recoverable error.
     * @type {Integer (Int32)}
     */
    static Recoverable => 2

    /**
     * An unrecoverable error.
     * @type {Integer (Int32)}
     */
    static Unrecoverable => 3

    /**
     * Requires assistance.
     * @type {Integer (Int32)}
     */
    static AssistanceRequired => 4

    /**
     * A fatal error.
     * @type {Integer (Int32)}
     */
    static Fatal => 5
}
