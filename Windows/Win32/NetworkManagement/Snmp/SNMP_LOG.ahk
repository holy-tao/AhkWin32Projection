#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Snmp
 */
class SNMP_LOG extends Win32Enum {

    /**
     * Native name: SNMP_LOG_SILENT
     * @type {Integer (Int32)}
     */
    static SILENT => 0

    /**
     * Native name: SNMP_LOG_FATAL
     * @type {Integer (Int32)}
     */
    static FATAL => 1

    /**
     * Native name: SNMP_LOG_ERROR
     * @type {Integer (Int32)}
     */
    static ERROR => 2

    /**
     * Native name: SNMP_LOG_WARNING
     * @type {Integer (Int32)}
     */
    static WARNING => 3

    /**
     * Native name: SNMP_LOG_TRACE
     * @type {Integer (Int32)}
     */
    static TRACE => 4

    /**
     * Native name: SNMP_LOG_VERBOSE
     * @type {Integer (Int32)}
     */
    static VERBOSE => 5
}
