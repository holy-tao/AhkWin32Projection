#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Indicates whether the device background task operation was allowed or denied, and if it was denied specifies the reason.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.devicetriggerresult
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class DeviceTriggerResult extends Win32Enum{

    /**
     * The device background task was triggered.
     * @type {Integer (Int32)}
     */
    static Allowed => 0

    /**
     * The device background task was denied by the user.
     * @type {Integer (Int32)}
     */
    static DeniedByUser => 1

    /**
     * The device background task was denied due to system policy.
     * @type {Integer (Int32)}
     */
    static DeniedBySystem => 2

    /**
     * The device background task cannot run because the battery is low.
     * @type {Integer (Int32)}
     */
    static LowBattery => 3
}
