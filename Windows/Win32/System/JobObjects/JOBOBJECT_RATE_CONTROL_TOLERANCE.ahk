#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.JobObjects
 * @version v4.0.30319
 */
class JOBOBJECT_RATE_CONTROL_TOLERANCE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ToleranceLow => 1

    /**
     * @type {Integer (Int32)}
     */
    static ToleranceMedium => 2

    /**
     * @type {Integer (Int32)}
     */
    static ToleranceHigh => 3
}
