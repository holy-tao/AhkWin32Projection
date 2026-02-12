#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Indicates whether the user has given permission for the app to set alarms.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.alarmaccessstatus
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class AlarmAccessStatus extends Win32Enum{

    /**
     * The user has not responded to a permission request for the app to set alarms.
     * @type {Integer (Int32)}
     */
    static Unspecified => 0

    /**
     * The user has given permission for the app to set alarms, and alarms can wake up the computer from standby.
     * @type {Integer (Int32)}
     */
    static AllowedWithWakeupCapability => 1

    /**
     * The user has given permission for the app to set alarms, but the alarms cannot wake up the computer from standby.
     * @type {Integer (Int32)}
     */
    static AllowedWithoutWakeupCapability => 2

    /**
     * The user has denied permission for the app to set alarms.
     * @type {Integer (Int32)}
     */
    static Denied => 3
}
