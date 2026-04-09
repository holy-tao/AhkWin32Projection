#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class WHEA_THROTTLE_TYPE extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static WheaPcieThrottle => 0

    /**
     * @type {Integer (Int32)}
     */
    static WheaMemoryThrottle => 1
}
