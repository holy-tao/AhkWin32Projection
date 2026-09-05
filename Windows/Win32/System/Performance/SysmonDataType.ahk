#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Determines the type of data to return from a given data point on the graph.
 * @see https://learn.microsoft.com/windows/win32/api/isysmon/ne-isysmon-sysmondatatype
 * @namespace Windows.Win32.System.Performance
 */
class SysmonDataType extends Win32Enum {

    /**
     * Average value of the counter.
     * Native name: sysmonDataAvg
     * @type {Integer (Int32)}
     */
    static Avg => 1

    /**
     * Minimum value of the counter.
     * Native name: sysmonDataMin
     * @type {Integer (Int32)}
     */
    static Min => 2

    /**
     * Maximum value of the counter.
     * Native name: sysmonDataMax
     * @type {Integer (Int32)}
     */
    static Max => 3

    /**
     * Date and time that the counter value was collected. If SYSMON compresses more than one sample into the counter value, the date and time are from the last sample.
     * Native name: sysmonDataTime
     * @type {Integer (Int32)}
     */
    static Time => 4

    /**
     * Number of samples that were compressed into the data point.
     * Native name: sysmonDataCount
     * @type {Integer (Int32)}
     */
    static Count => 5
}
