#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the constants that indicate the power status of a line display.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplaypowerstatus
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class LineDisplayPowerStatus extends Win32Enum{

    /**
     * The power state is unknown.
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * The line display is online.
     * @type {Integer (Int32)}
     */
    static Online => 1

    /**
     * The line display is off.
     * @type {Integer (Int32)}
     */
    static Off => 2

    /**
     * The line display is offline.
     * @type {Integer (Int32)}
     */
    static Offline => 3

    /**
     * The line display is either off or offline.
     * @type {Integer (Int32)}
     */
    static OffOrOffline => 4
}
