#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Documentation varies per use. Refer to each: <see href="https://learn.microsoft.com/windows/win32/api//content/pdh/ns-pdh-pdh_raw_log_record">PDH_RAW_LOG_RECORD</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/pdh/nf-pdh-pdhopenloga">PdhOpenLog</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/pdh/nf-pdh-pdhopenlogw">PdhOpenLog</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/pdh/nf-pdh-pdhopenloga">PdhOpenLogA</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/pdh/nf-pdh-pdhopenlogw">PdhOpenLogA</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/pdh/nf-pdh-pdhopenloga">PdhOpenLogW</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/pdh/nf-pdh-pdhopenlogw">PdhOpenLogW</see>.
 * @see 
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class PDH_LOG_TYPE extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_LOG_TYPE_UNDEFINED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_LOG_TYPE_CSV => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_LOG_TYPE_SQL => 7

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_LOG_TYPE_TSV => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_LOG_TYPE_BINARY => 8

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_LOG_TYPE_PERFMON => 6
}
