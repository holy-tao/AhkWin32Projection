#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Sensors
 */
class SIMPLE_DEVICE_ORIENTATION extends Win32Enum {

    /**
     * Native name: SimpleDeviceOrientation_NotRotated
     * @type {Integer (Int32)}
     */
    static NotRotated => 0

    /**
     * Native name: SimpleDeviceOrientation_Rotated90DegreesCounterclockwise
     * @type {Integer (Int32)}
     */
    static Rotated90DegreesCounterclockwise => 1

    /**
     * Native name: SimpleDeviceOrientation_Rotated180DegreesCounterclockwise
     * @type {Integer (Int32)}
     */
    static Rotated180DegreesCounterclockwise => 2

    /**
     * Native name: SimpleDeviceOrientation_Rotated270DegreesCounterclockwise
     * @type {Integer (Int32)}
     */
    static Rotated270DegreesCounterclockwise => 3

    /**
     * Native name: SimpleDeviceOrientation_Faceup
     * @type {Integer (Int32)}
     */
    static Faceup => 4

    /**
     * Native name: SimpleDeviceOrientation_Facedown
     * @type {Integer (Int32)}
     */
    static Facedown => 5
}
