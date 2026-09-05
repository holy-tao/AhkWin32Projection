#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSEVENT_DEVICE extends Win32Enum {

    /**
     * Native name: KSEVENT_DEVICE_LOST
     * @type {Integer (Int32)}
     */
    static LOST => 0

    /**
     * Native name: KSEVENT_DEVICE_PREEMPTED
     * @type {Integer (Int32)}
     */
    static PREEMPTED => 1

    /**
     * Native name: KSEVENT_DEVICE_THERMAL_HIGH
     * @type {Integer (Int32)}
     */
    static THERMAL_HIGH => 2

    /**
     * Native name: KSEVENT_DEVICE_THERMAL_LOW
     * @type {Integer (Int32)}
     */
    static THERMAL_LOW => 3
}
