#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Snmp
 * @version v4.0.30319
 */
class SNMP_LOG extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SNMP_LOG_SILENT => 0

    /**
     * @type {Integer (Int32)}
     */
    static SNMP_LOG_FATAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static SNMP_LOG_ERROR => 2

    /**
     * @type {Integer (Int32)}
     */
    static SNMP_LOG_WARNING => 3

    /**
     * @type {Integer (Int32)}
     */
    static SNMP_LOG_TRACE => 4

    /**
     * @type {Integer (Int32)}
     */
    static SNMP_LOG_VERBOSE => 5
}
