#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Snmp
 */
class SNMP_ERROR_STATUS extends Win32Enum {

    /**
     * Native name: SNMP_ERRORSTATUS_NOERROR
     * @type {Integer (UInt32)}
     */
    static ERRORSTATUS_NOERROR => 0

    /**
     * Native name: SNMP_ERRORSTATUS_TOOBIG
     * @type {Integer (UInt32)}
     */
    static ERRORSTATUS_TOOBIG => 1

    /**
     * Native name: SNMP_ERRORSTATUS_NOSUCHNAME
     * @type {Integer (UInt32)}
     */
    static ERRORSTATUS_NOSUCHNAME => 2

    /**
     * Native name: SNMP_ERRORSTATUS_BADVALUE
     * @type {Integer (UInt32)}
     */
    static ERRORSTATUS_BADVALUE => 3

    /**
     * Native name: SNMP_ERRORSTATUS_READONLY
     * @type {Integer (UInt32)}
     */
    static ERRORSTATUS_READONLY => 4

    /**
     * Native name: SNMP_ERRORSTATUS_GENERR
     * @type {Integer (UInt32)}
     */
    static ERRORSTATUS_GENERR => 5

    /**
     * Native name: SNMP_ERRORSTATUS_NOACCESS
     * @type {Integer (UInt32)}
     */
    static ERRORSTATUS_NOACCESS => 6

    /**
     * Native name: SNMP_ERRORSTATUS_WRONGTYPE
     * @type {Integer (UInt32)}
     */
    static ERRORSTATUS_WRONGTYPE => 7

    /**
     * Native name: SNMP_ERRORSTATUS_WRONGLENGTH
     * @type {Integer (UInt32)}
     */
    static ERRORSTATUS_WRONGLENGTH => 8

    /**
     * Native name: SNMP_ERRORSTATUS_WRONGENCODING
     * @type {Integer (UInt32)}
     */
    static ERRORSTATUS_WRONGENCODING => 9

    /**
     * Native name: SNMP_ERRORSTATUS_WRONGVALUE
     * @type {Integer (UInt32)}
     */
    static ERRORSTATUS_WRONGVALUE => 10

    /**
     * Native name: SNMP_ERRORSTATUS_NOCREATION
     * @type {Integer (UInt32)}
     */
    static ERRORSTATUS_NOCREATION => 11

    /**
     * Native name: SNMP_ERRORSTATUS_INCONSISTENTVALUE
     * @type {Integer (UInt32)}
     */
    static ERRORSTATUS_INCONSISTENTVALUE => 12

    /**
     * Native name: SNMP_ERRORSTATUS_RESOURCEUNAVAILABLE
     * @type {Integer (UInt32)}
     */
    static ERRORSTATUS_RESOURCEUNAVAILABLE => 13

    /**
     * Native name: SNMP_ERRORSTATUS_COMMITFAILED
     * @type {Integer (UInt32)}
     */
    static ERRORSTATUS_COMMITFAILED => 14

    /**
     * Native name: SNMP_ERRORSTATUS_UNDOFAILED
     * @type {Integer (UInt32)}
     */
    static ERRORSTATUS_UNDOFAILED => 15

    /**
     * Native name: SNMP_ERRORSTATUS_AUTHORIZATIONERROR
     * @type {Integer (UInt32)}
     */
    static ERRORSTATUS_AUTHORIZATIONERROR => 16

    /**
     * Native name: SNMP_ERRORSTATUS_NOTWRITABLE
     * @type {Integer (UInt32)}
     */
    static ERRORSTATUS_NOTWRITABLE => 17

    /**
     * Native name: SNMP_ERRORSTATUS_INCONSISTENTNAME
     * @type {Integer (UInt32)}
     */
    static ERRORSTATUS_INCONSISTENTNAME => 18
}
