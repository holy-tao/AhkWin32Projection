#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class WHEA_THROTTLE_TYPE extends Win32Enum {

    /**
     * Native name: WheaPcieThrottle
     * @type {Integer (Int32)}
     */
    static PcieThrottle => 0

    /**
     * Native name: WheaMemoryThrottle
     * @type {Integer (Int32)}
     */
    static MemoryThrottle => 1
}
