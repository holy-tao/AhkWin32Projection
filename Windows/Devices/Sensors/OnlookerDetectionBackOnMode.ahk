#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * If onlooker detection is turned off, the back on mode can automatically reenable the feature after a set period. The user can choose to manually re-enabled asdesired, or have the feature reactivate automatically after 1 hour, 4 hours, or 1 day.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.onlookerdetectionbackonmode
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class OnlookerDetectionBackOnMode extends Win32Enum{

    /**
     * User will manually renable the onlooker detection feature
     * @type {Integer (Int32)}
     */
    static Manually => 0

    /**
     * After one hour the onlooker detection feature will be activated again
     * @type {Integer (Int32)}
     */
    static OneHour => 1

    /**
     * After four hours the onlooker detection feature will be activated again
     * @type {Integer (Int32)}
     */
    static FourHours => 2

    /**
     * After one day the onlooker detection feature will be activated again
     * @type {Integer (Int32)}
     */
    static OneDay => 3
}
