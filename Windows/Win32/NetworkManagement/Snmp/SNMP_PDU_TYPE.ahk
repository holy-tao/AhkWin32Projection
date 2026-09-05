#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Snmp
 */
class SNMP_PDU_TYPE extends Win32Enum {

    /**
     * Native name: SNMP_PDU_GET
     * @type {Integer (UInt32)}
     */
    static GET => 160

    /**
     * Native name: SNMP_PDU_GETNEXT
     * @type {Integer (UInt32)}
     */
    static GETNEXT => 161

    /**
     * Native name: SNMP_PDU_RESPONSE
     * @type {Integer (UInt32)}
     */
    static RESPONSE => 162

    /**
     * Native name: SNMP_PDU_SET
     * @type {Integer (UInt32)}
     */
    static SET => 163

    /**
     * Native name: SNMP_PDU_GETBULK
     * @type {Integer (UInt32)}
     */
    static GETBULK => 165

    /**
     * Native name: SNMP_PDU_TRAP
     * @type {Integer (UInt32)}
     */
    static TRAP => 167
}
