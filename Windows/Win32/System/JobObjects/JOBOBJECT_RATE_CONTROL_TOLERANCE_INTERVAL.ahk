#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.JobObjects
 */
class JOBOBJECT_RATE_CONTROL_TOLERANCE_INTERVAL extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static ToleranceIntervalShort => 1

    /**
     * @type {Integer (Int32)}
     */
    static ToleranceIntervalMedium => 2

    /**
     * @type {Integer (Int32)}
     */
    static ToleranceIntervalLong => 3
}
