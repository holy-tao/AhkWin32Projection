#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Snmp
 * @version v4.0.30319
 */
class SNMP_GENERICTRAP{

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_GENERICTRAP_COLDSTART => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_GENERICTRAP_WARMSTART => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_GENERICTRAP_LINKDOWN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_GENERICTRAP_LINKUP => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_GENERICTRAP_AUTHFAILURE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_GENERICTRAP_EGPNEIGHLOSS => 5

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_GENERICTRAP_ENTERSPECIFIC => 6
}
