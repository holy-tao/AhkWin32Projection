#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Snmp
 * @version v4.0.30319
 */
class SNMP_PDU_TYPE extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_PDU_GET => 160

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_PDU_GETNEXT => 161

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_PDU_RESPONSE => 162

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_PDU_SET => 163

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_PDU_GETBULK => 165

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_PDU_TRAP => 167
}
