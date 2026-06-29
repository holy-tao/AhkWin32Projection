#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Snmp
 */
export default struct SNMP_ERROR_STATUS {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_ERRORSTATUS_NOERROR => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_ERRORSTATUS_TOOBIG => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_ERRORSTATUS_NOSUCHNAME => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_ERRORSTATUS_BADVALUE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_ERRORSTATUS_READONLY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_ERRORSTATUS_GENERR => 5

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_ERRORSTATUS_NOACCESS => 6

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_ERRORSTATUS_WRONGTYPE => 7

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_ERRORSTATUS_WRONGLENGTH => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_ERRORSTATUS_WRONGENCODING => 9

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_ERRORSTATUS_WRONGVALUE => 10

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_ERRORSTATUS_NOCREATION => 11

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_ERRORSTATUS_INCONSISTENTVALUE => 12

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_ERRORSTATUS_RESOURCEUNAVAILABLE => 13

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_ERRORSTATUS_COMMITFAILED => 14

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_ERRORSTATUS_UNDOFAILED => 15

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_ERRORSTATUS_AUTHORIZATIONERROR => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_ERRORSTATUS_NOTWRITABLE => 17

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_ERRORSTATUS_INCONSISTENTNAME => 18
}
