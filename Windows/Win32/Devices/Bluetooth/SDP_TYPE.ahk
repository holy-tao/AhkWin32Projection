#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Bluetooth
 * @version v4.0.30319
 */
class SDP_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SDP_TYPE_NIL => 0

    /**
     * @type {Integer (Int32)}
     */
    static SDP_TYPE_UINT => 1

    /**
     * @type {Integer (Int32)}
     */
    static SDP_TYPE_INT => 2

    /**
     * @type {Integer (Int32)}
     */
    static SDP_TYPE_UUID => 3

    /**
     * @type {Integer (Int32)}
     */
    static SDP_TYPE_STRING => 4

    /**
     * @type {Integer (Int32)}
     */
    static SDP_TYPE_BOOLEAN => 5

    /**
     * @type {Integer (Int32)}
     */
    static SDP_TYPE_SEQUENCE => 6

    /**
     * @type {Integer (Int32)}
     */
    static SDP_TYPE_ALTERNATIVE => 7

    /**
     * @type {Integer (Int32)}
     */
    static SDP_TYPE_URL => 8

    /**
     * @type {Integer (Int32)}
     */
    static SDP_TYPE_CONTAINER => 32
}
