#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Performance
 */
class PDH_LOG_TYPE extends Win32Enum {

    /**
     * Native name: PDH_LOG_TYPE_UNDEFINED
     * @type {Integer (UInt32)}
     */
    static UNDEFINED => 0

    /**
     * Native name: PDH_LOG_TYPE_CSV
     * @type {Integer (UInt32)}
     */
    static CSV => 1

    /**
     * Native name: PDH_LOG_TYPE_SQL
     * @type {Integer (UInt32)}
     */
    static SQL => 7

    /**
     * Native name: PDH_LOG_TYPE_TSV
     * @type {Integer (UInt32)}
     */
    static TSV => 2

    /**
     * Native name: PDH_LOG_TYPE_BINARY
     * @type {Integer (UInt32)}
     */
    static BINARY => 8

    /**
     * Native name: PDH_LOG_TYPE_PERFMON
     * @type {Integer (UInt32)}
     */
    static PERFMON => 6
}
