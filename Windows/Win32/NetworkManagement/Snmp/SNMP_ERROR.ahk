#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Snmp
 */
class SNMP_ERROR extends Win32Enum {

    /**
     * Native name: SNMP_ERROR_NOERROR
     * @type {Integer (UInt32)}
     */
    static NOERROR => 0

    /**
     * Native name: SNMP_ERROR_TOOBIG
     * @type {Integer (UInt32)}
     */
    static TOOBIG => 1

    /**
     * Native name: SNMP_ERROR_NOSUCHNAME
     * @type {Integer (UInt32)}
     */
    static NOSUCHNAME => 2

    /**
     * Native name: SNMP_ERROR_BADVALUE
     * @type {Integer (UInt32)}
     */
    static BADVALUE => 3

    /**
     * Native name: SNMP_ERROR_READONLY
     * @type {Integer (UInt32)}
     */
    static READONLY => 4

    /**
     * Native name: SNMP_ERROR_GENERR
     * @type {Integer (UInt32)}
     */
    static GENERR => 5

    /**
     * Native name: SNMP_ERROR_NOACCESS
     * @type {Integer (UInt32)}
     */
    static NOACCESS => 6

    /**
     * Native name: SNMP_ERROR_WRONGTYPE
     * @type {Integer (UInt32)}
     */
    static WRONGTYPE => 7

    /**
     * Native name: SNMP_ERROR_WRONGLENGTH
     * @type {Integer (UInt32)}
     */
    static WRONGLENGTH => 8

    /**
     * Native name: SNMP_ERROR_WRONGENCODING
     * @type {Integer (UInt32)}
     */
    static WRONGENCODING => 9

    /**
     * Native name: SNMP_ERROR_WRONGVALUE
     * @type {Integer (UInt32)}
     */
    static WRONGVALUE => 10

    /**
     * Native name: SNMP_ERROR_NOCREATION
     * @type {Integer (UInt32)}
     */
    static NOCREATION => 11

    /**
     * Native name: SNMP_ERROR_INCONSISTENTVALUE
     * @type {Integer (UInt32)}
     */
    static INCONSISTENTVALUE => 12

    /**
     * Native name: SNMP_ERROR_RESOURCEUNAVAILABLE
     * @type {Integer (UInt32)}
     */
    static RESOURCEUNAVAILABLE => 13

    /**
     * Native name: SNMP_ERROR_COMMITFAILED
     * @type {Integer (UInt32)}
     */
    static COMMITFAILED => 14

    /**
     * Native name: SNMP_ERROR_UNDOFAILED
     * @type {Integer (UInt32)}
     */
    static UNDOFAILED => 15

    /**
     * Native name: SNMP_ERROR_AUTHORIZATIONERROR
     * @type {Integer (UInt32)}
     */
    static AUTHORIZATIONERROR => 16

    /**
     * Native name: SNMP_ERROR_NOTWRITABLE
     * @type {Integer (UInt32)}
     */
    static NOTWRITABLE => 17

    /**
     * Native name: SNMP_ERROR_INCONSISTENTNAME
     * @type {Integer (UInt32)}
     */
    static INCONSISTENTNAME => 18
}
