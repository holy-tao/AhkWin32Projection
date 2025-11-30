#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSEVENT_DEVICE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static KSEVENT_DEVICE_LOST => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSEVENT_DEVICE_PREEMPTED => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSEVENT_DEVICE_THERMAL_HIGH => 2

    /**
     * @type {Integer (Int32)}
     */
    static KSEVENT_DEVICE_THERMAL_LOW => 3
}
