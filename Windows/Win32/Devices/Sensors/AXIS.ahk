#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Sensors
 */
class AXIS extends Win32Enum {

    /**
     * Native name: AXIS_X
     * @type {Integer (Int32)}
     */
    static X => 0

    /**
     * Native name: AXIS_Y
     * @type {Integer (Int32)}
     */
    static Y => 1

    /**
     * Native name: AXIS_Z
     * @type {Integer (Int32)}
     */
    static Z => 2

    /**
     * Native name: AXIS_MAX
     * @type {Integer (Int32)}
     */
    static MAX => 3
}
