#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Snmp
 */
export default struct SNMP_ERROR {
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
    static SNMP_ERROR_NOERROR => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_ERROR_TOOBIG => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_ERROR_NOSUCHNAME => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_ERROR_BADVALUE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_ERROR_READONLY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_ERROR_GENERR => 5

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_ERROR_NOACCESS => 6

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_ERROR_WRONGTYPE => 7

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_ERROR_WRONGLENGTH => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_ERROR_WRONGENCODING => 9

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_ERROR_WRONGVALUE => 10

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_ERROR_NOCREATION => 11

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_ERROR_INCONSISTENTVALUE => 12

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_ERROR_RESOURCEUNAVAILABLE => 13

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_ERROR_COMMITFAILED => 14

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_ERROR_UNDOFAILED => 15

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_ERROR_AUTHORIZATIONERROR => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_ERROR_NOTWRITABLE => 17

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_ERROR_INCONSISTENTNAME => 18
}
