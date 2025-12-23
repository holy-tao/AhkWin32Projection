#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Snmp
 * @version v4.0.30319
 */
class SNMP_EXTENSION_REQUEST_TYPE extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_EXTENSION_GET => 160

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_EXTENSION_GET_NEXT => 161

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_EXTENSION_SET_TEST => 224

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_EXTENSION_SET_COMMIT => 163

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_EXTENSION_SET_UNDO => 225

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_EXTENSION_SET_CLEANUP => 226
}
