#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Snmp
 */
class SNMP_STATUS extends Win32Enum {

    /**
     * @type {Integer (UInt32)}
     */
    static SNMPAPI_ON => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SNMPAPI_OFF => 0
}
