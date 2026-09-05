#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Bluetooth
 */
class SDP_TYPE extends Win32Enum {

    /**
     * Native name: SDP_TYPE_NIL
     * @type {Integer (Int32)}
     */
    static NIL => 0

    /**
     * Native name: SDP_TYPE_UINT
     * @type {Integer (Int32)}
     */
    static UINT => 1

    /**
     * Native name: SDP_TYPE_INT
     * @type {Integer (Int32)}
     */
    static INT => 2

    /**
     * Native name: SDP_TYPE_UUID
     * @type {Integer (Int32)}
     */
    static UUID => 3

    /**
     * Native name: SDP_TYPE_STRING
     * @type {Integer (Int32)}
     */
    static STRING => 4

    /**
     * Native name: SDP_TYPE_BOOLEAN
     * @type {Integer (Int32)}
     */
    static BOOLEAN => 5

    /**
     * Native name: SDP_TYPE_SEQUENCE
     * @type {Integer (Int32)}
     */
    static SEQUENCE => 6

    /**
     * Native name: SDP_TYPE_ALTERNATIVE
     * @type {Integer (Int32)}
     */
    static ALTERNATIVE => 7

    /**
     * Native name: SDP_TYPE_URL
     * @type {Integer (Int32)}
     */
    static URL => 8

    /**
     * Native name: SDP_TYPE_CONTAINER
     * @type {Integer (Int32)}
     */
    static CONTAINER => 32
}
