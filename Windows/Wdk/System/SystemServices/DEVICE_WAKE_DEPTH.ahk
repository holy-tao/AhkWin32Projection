#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class DEVICE_WAKE_DEPTH extends Win32Enum {

    /**
     * Native name: DeviceWakeDepthNotWakeable
     * @type {Integer (Int32)}
     */
    static NotWakeable => 0

    /**
     * Native name: DeviceWakeDepthD0
     * @type {Integer (Int32)}
     */
    static DepthD0 => 1

    /**
     * Native name: DeviceWakeDepthD1
     * @type {Integer (Int32)}
     */
    static DepthD1 => 2

    /**
     * Native name: DeviceWakeDepthD2
     * @type {Integer (Int32)}
     */
    static DepthD2 => 3

    /**
     * Native name: DeviceWakeDepthD3hot
     * @type {Integer (Int32)}
     */
    static DepthD3hot => 4

    /**
     * Native name: DeviceWakeDepthD3cold
     * @type {Integer (Int32)}
     */
    static DepthD3cold => 5

    /**
     * Native name: DeviceWakeDepthMaximum
     * @type {Integer (Int32)}
     */
    static Maximum => 6
}
