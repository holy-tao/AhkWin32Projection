#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Snmp
 */
class SNMP_EXTENSION_REQUEST_TYPE extends Win32Enum {

    /**
     * Native name: SNMP_EXTENSION_GET
     * @type {Integer (UInt32)}
     */
    static GET => 160

    /**
     * Native name: SNMP_EXTENSION_GET_NEXT
     * @type {Integer (UInt32)}
     */
    static GET_NEXT => 161

    /**
     * Native name: SNMP_EXTENSION_SET_TEST
     * @type {Integer (UInt32)}
     */
    static SET_TEST => 224

    /**
     * Native name: SNMP_EXTENSION_SET_COMMIT
     * @type {Integer (UInt32)}
     */
    static SET_COMMIT => 163

    /**
     * Native name: SNMP_EXTENSION_SET_UNDO
     * @type {Integer (UInt32)}
     */
    static SET_UNDO => 225

    /**
     * Native name: SNMP_EXTENSION_SET_CLEANUP
     * @type {Integer (UInt32)}
     */
    static SET_CLEANUP => 226
}
