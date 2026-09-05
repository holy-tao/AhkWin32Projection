#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Sensors
 */
class SimpleDeviceOrientation extends Win32Enum {

    /**
     * Native name: SIMPLE_DEVICE_ORIENTATION_NOT_ROTATED
     * @type {Integer (Int32)}
     */
    static NOT_ROTATED => 0

    /**
     * Native name: SIMPLE_DEVICE_ORIENTATION_ROTATED_90
     * @type {Integer (Int32)}
     */
    static ROTATED_90 => 1

    /**
     * Native name: SIMPLE_DEVICE_ORIENTATION_ROTATED_180
     * @type {Integer (Int32)}
     */
    static ROTATED_180 => 2

    /**
     * Native name: SIMPLE_DEVICE_ORIENTATION_ROTATED_270
     * @type {Integer (Int32)}
     */
    static ROTATED_270 => 3

    /**
     * Native name: SIMPLE_DEVICE_ORIENTATION_ROTATED_FACE_UP
     * @type {Integer (Int32)}
     */
    static ROTATED_FACE_UP => 4

    /**
     * Native name: SIMPLE_DEVICE_ORIENTATION_ROTATED_FACE_DOWN
     * @type {Integer (Int32)}
     */
    static ROTATED_FACE_DOWN => 5
}
