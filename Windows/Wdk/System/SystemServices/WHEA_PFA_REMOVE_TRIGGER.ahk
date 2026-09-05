#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class WHEA_PFA_REMOVE_TRIGGER extends Win32Enum {

    /**
     * Native name: WheaPfaRemoveErrorThreshold
     * @type {Integer (Int32)}
     */
    static ErrorThreshold => 1

    /**
     * Native name: WheaPfaRemoveTimeout
     * @type {Integer (Int32)}
     */
    static Timeout => 2

    /**
     * Native name: WheaPfaRemoveCapacity
     * @type {Integer (Int32)}
     */
    static Capacity => 3
}
