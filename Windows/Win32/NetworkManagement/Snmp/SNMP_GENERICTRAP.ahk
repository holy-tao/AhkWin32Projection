#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Snmp
 */
class SNMP_GENERICTRAP extends Win32Enum {

    /**
     * Native name: SNMP_GENERICTRAP_COLDSTART
     * @type {Integer (UInt32)}
     */
    static COLDSTART => 0

    /**
     * Native name: SNMP_GENERICTRAP_WARMSTART
     * @type {Integer (UInt32)}
     */
    static WARMSTART => 1

    /**
     * Native name: SNMP_GENERICTRAP_LINKDOWN
     * @type {Integer (UInt32)}
     */
    static LINKDOWN => 2

    /**
     * Native name: SNMP_GENERICTRAP_LINKUP
     * @type {Integer (UInt32)}
     */
    static LINKUP => 3

    /**
     * Native name: SNMP_GENERICTRAP_AUTHFAILURE
     * @type {Integer (UInt32)}
     */
    static AUTHFAILURE => 4

    /**
     * Native name: SNMP_GENERICTRAP_EGPNEIGHLOSS
     * @type {Integer (UInt32)}
     */
    static EGPNEIGHLOSS => 5

    /**
     * Native name: SNMP_GENERICTRAP_ENTERSPECIFIC
     * @type {Integer (UInt32)}
     */
    static ENTERSPECIFIC => 6
}
