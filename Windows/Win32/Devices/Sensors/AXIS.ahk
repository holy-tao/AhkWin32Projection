#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Sensors
 */
class AXIS extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static AXIS_X => 0

    /**
     * @type {Integer (Int32)}
     */
    static AXIS_Y => 1

    /**
     * @type {Integer (Int32)}
     */
    static AXIS_Z => 2

    /**
     * @type {Integer (Int32)}
     */
    static AXIS_MAX => 3
}
