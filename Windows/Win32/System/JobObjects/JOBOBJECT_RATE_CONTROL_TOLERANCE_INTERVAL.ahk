#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.JobObjects
 */
class JOBOBJECT_RATE_CONTROL_TOLERANCE_INTERVAL extends Win32Enum {

    /**
     * Native name: ToleranceIntervalShort
     * @type {Integer (Int32)}
     */
    static Short => 1

    /**
     * Native name: ToleranceIntervalMedium
     * @type {Integer (Int32)}
     */
    static Medium => 2

    /**
     * Native name: ToleranceIntervalLong
     * @type {Integer (Int32)}
     */
    static Long => 3
}
