#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the constants that indicate the cash drawer power status.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.cashdrawerstatuskind
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class CashDrawerStatusKind extends Win32Enum{

    /**
     * The device is powered on and ready to use.
     * @type {Integer (Int32)}
     */
    static Online => 0

    /**
     * The device is powered off or detached from the terminal.
     * @type {Integer (Int32)}
     */
    static Off => 1

    /**
     * The device is powered on but is not available to respond to requests.
     * @type {Integer (Int32)}
     */
    static Offline => 2

    /**
     * The device is either off or offline, but the current state can not be distinguished.
     * @type {Integer (Int32)}
     */
    static OffOrOffline => 3

    /**
     * The device status is not any of the above states. This is available so a POS driver can provide custom notifications to the app.
     * @type {Integer (Int32)}
     */
    static Extended => 4
}
