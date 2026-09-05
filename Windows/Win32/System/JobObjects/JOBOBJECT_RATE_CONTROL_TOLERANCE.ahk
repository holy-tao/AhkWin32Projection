#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.JobObjects
 */
class JOBOBJECT_RATE_CONTROL_TOLERANCE extends Win32Enum {

    /**
     * Native name: ToleranceLow
     * @type {Integer (Int32)}
     */
    static Low => 1

    /**
     * Native name: ToleranceMedium
     * @type {Integer (Int32)}
     */
    static Medium => 2

    /**
     * Native name: ToleranceHigh
     * @type {Integer (Int32)}
     */
    static High => 3
}
