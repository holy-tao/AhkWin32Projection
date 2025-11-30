#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the clock resolution to use when tracing events.
 * @remarks
 * 
 * For details, see the <b>ClientContext</b> member of the <a href="https://docs.microsoft.com/windows/desktop/ETW/wnode-header">WNODE_HEADER</a> structure.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//pla/ne-pla-clocktype
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class ClockType extends Win32Enum{

    /**
     * Use the raw (unconverted) time stamp.
     * @type {Integer (Int32)}
     */
    static plaTimeStamp => 0

    /**
     * Query performance counter. This counter provides a high-resolution (100 nanoseconds) time stamp but is more resource-intensive to retrieve than  system time.
     * @type {Integer (Int32)}
     */
    static plaPerformance => 1

    /**
     * System time. The system time provides a low-resolution (10 milliseconds) time stamp but is less resource-intensive to retrieve than the query performance counter.
     * @type {Integer (Int32)}
     */
    static plaSystem => 2

    /**
     * CPU cycle counter. The CPU counter provides the highest resolution time stamp and is the least resource-intensive to retrieve. However, the CPU counter is unreliable and should not be used in production.
     * @type {Integer (Int32)}
     */
    static plaCycle => 3
}
