#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class WHEA_PFA_REMOVE_TRIGGER extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WheaPfaRemoveErrorThreshold => 1

    /**
     * @type {Integer (Int32)}
     */
    static WheaPfaRemoveTimeout => 2

    /**
     * @type {Integer (Int32)}
     */
    static WheaPfaRemoveCapacity => 3
}
