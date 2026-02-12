#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the possible engagement states supported by a [HumanPresenceSensor](humanpresencesensor.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.humanengagement
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class HumanEngagement extends Win32Enum{

    /**
     * Human engagement with device is unknown.
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * Human is engaged with device.
     * @type {Integer (Int32)}
     */
    static Engaged => 1

    /**
     * Human is not engaged with device.
     * @type {Integer (Int32)}
     */
    static Unengaged => 2
}
