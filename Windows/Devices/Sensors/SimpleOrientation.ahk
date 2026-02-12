#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Indicates the orientation of the device.
 * @remarks
 * The **Faceup** and **Facedown** values are supported for tablet devices. You can use them to support power management: As long as the orientation is **Faceup**, your application will continue to run; but, once the orientation is **Facedown**, your application can pause or enter "sleep mode".
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.simpleorientation
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class SimpleOrientation extends Win32Enum{

    /**
     * The device is not rotated.
     * @type {Integer (Int32)}
     */
    static NotRotated => 0

    /**
     * The device is rotated 90-degrees counter-clockwise.
     * @type {Integer (Int32)}
     */
    static Rotated90DegreesCounterclockwise => 1

    /**
     * The device is rotated 180-degrees counter-clockwise.
     * @type {Integer (Int32)}
     */
    static Rotated180DegreesCounterclockwise => 2

    /**
     * The device is rotated 270-degrees counter-clockwise.
     * @type {Integer (Int32)}
     */
    static Rotated270DegreesCounterclockwise => 3

    /**
     * The device is face-up and the display is visible to the user.
     * @type {Integer (Int32)}
     */
    static Faceup => 4

    /**
     * The device is face-down and the display is hidden from the user.
     * @type {Integer (Int32)}
     */
    static Facedown => 5
}
