#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the action taken when an onlooker is detected by the human presence sensors.
 * @remarks
 * The action taken on onlooker detection can be disabled through the top level toggle for this feature. 
 * 
 * The user can specify their preferred onlooker detection behavior in the System settings (see [Launch Windows Settings](/windows/apps/develop/launch/launch-settings#system)).
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.onlookerdetectionaction
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class OnlookerDetectionAction extends Win32Enum{

    /**
     * Device screen will dim when onlooker is detected.
     * @type {Integer (Int32)}
     */
    static Dim => 0

    /**
     * When an onlooker is detected a windows notification will be displayed.
     * @type {Integer (Int32)}
     */
    static Notify => 1

    /**
     * When an onlooker is detected the screen will dim and a windows notification will be displayed.
     * @type {Integer (Int32)}
     */
    static DimAndNotify => 2
}
