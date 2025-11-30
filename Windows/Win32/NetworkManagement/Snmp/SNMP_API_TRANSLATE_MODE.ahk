#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Snmp
 * @version v4.0.30319
 */
class SNMP_API_TRANSLATE_MODE extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static SNMPAPI_TRANSLATED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SNMPAPI_UNTRANSLATED_V1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SNMPAPI_UNTRANSLATED_V2 => 2
}
