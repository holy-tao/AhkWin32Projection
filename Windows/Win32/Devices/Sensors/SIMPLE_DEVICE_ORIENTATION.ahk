#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Devices.Sensors
 * @version v4.0.30319
 */
class SIMPLE_DEVICE_ORIENTATION{

    /**
     * @type {Integer (Int32)}
     */
    static SimpleDeviceOrientation_NotRotated => 0

    /**
     * @type {Integer (Int32)}
     */
    static SimpleDeviceOrientation_Rotated90DegreesCounterclockwise => 1

    /**
     * @type {Integer (Int32)}
     */
    static SimpleDeviceOrientation_Rotated180DegreesCounterclockwise => 2

    /**
     * @type {Integer (Int32)}
     */
    static SimpleDeviceOrientation_Rotated270DegreesCounterclockwise => 3

    /**
     * @type {Integer (Int32)}
     */
    static SimpleDeviceOrientation_Faceup => 4

    /**
     * @type {Integer (Int32)}
     */
    static SimpleDeviceOrientation_Facedown => 5
}
