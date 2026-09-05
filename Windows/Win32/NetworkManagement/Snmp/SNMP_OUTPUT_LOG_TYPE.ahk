#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Snmp
 */
class SNMP_OUTPUT_LOG_TYPE extends Win32Enum {

    /**
     * Native name: SNMP_OUTPUT_TO_CONSOLE
     * @type {Integer (UInt32)}
     */
    static TO_CONSOLE => 1

    /**
     * Native name: SNMP_OUTPUT_TO_LOGFILE
     * @type {Integer (UInt32)}
     */
    static TO_LOGFILE => 2

    /**
     * Native name: SNMP_OUTPUT_TO_DEBUGGER
     * @type {Integer (UInt32)}
     */
    static TO_DEBUGGER => 8
}
