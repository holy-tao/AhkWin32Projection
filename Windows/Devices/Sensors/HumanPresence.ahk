#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the possible detection states supported by a [HumanPresenceSensor](humanpresencesensor.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.humanpresence
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class HumanPresence extends Win32Enum{

    /**
     * Human presence is unknown.
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * Human presence is detected.
     * @type {Integer (Int32)}
     */
    static Present => 1

    /**
     * Human presence is not detected.
     * @type {Integer (Int32)}
     */
    static NotPresent => 2
}
