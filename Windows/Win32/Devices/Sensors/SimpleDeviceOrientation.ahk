#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Sensors
 * @version v4.0.30319
 */
class SimpleDeviceOrientation extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SIMPLE_DEVICE_ORIENTATION_NOT_ROTATED => 0

    /**
     * @type {Integer (Int32)}
     */
    static SIMPLE_DEVICE_ORIENTATION_ROTATED_90 => 1

    /**
     * @type {Integer (Int32)}
     */
    static SIMPLE_DEVICE_ORIENTATION_ROTATED_180 => 2

    /**
     * @type {Integer (Int32)}
     */
    static SIMPLE_DEVICE_ORIENTATION_ROTATED_270 => 3

    /**
     * @type {Integer (Int32)}
     */
    static SIMPLE_DEVICE_ORIENTATION_ROTATED_FACE_UP => 4

    /**
     * @type {Integer (Int32)}
     */
    static SIMPLE_DEVICE_ORIENTATION_ROTATED_FACE_DOWN => 5
}
