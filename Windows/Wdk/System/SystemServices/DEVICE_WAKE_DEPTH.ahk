#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class DEVICE_WAKE_DEPTH extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DeviceWakeDepthNotWakeable => 0

    /**
     * @type {Integer (Int32)}
     */
    static DeviceWakeDepthD0 => 1

    /**
     * @type {Integer (Int32)}
     */
    static DeviceWakeDepthD1 => 2

    /**
     * @type {Integer (Int32)}
     */
    static DeviceWakeDepthD2 => 3

    /**
     * @type {Integer (Int32)}
     */
    static DeviceWakeDepthD3hot => 4

    /**
     * @type {Integer (Int32)}
     */
    static DeviceWakeDepthD3cold => 5

    /**
     * @type {Integer (Int32)}
     */
    static DeviceWakeDepthMaximum => 6
}
