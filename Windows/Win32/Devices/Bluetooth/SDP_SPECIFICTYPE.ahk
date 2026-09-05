#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Bluetooth
 */
class SDP_SPECIFICTYPE extends Win32Enum {

    /**
     * Native name: SDP_ST_NONE
     * @type {Integer (Int32)}
     */
    static ST_NONE => 0

    /**
     * Native name: SDP_ST_UINT8
     * @type {Integer (Int32)}
     */
    static ST_UINT8 => 16

    /**
     * Native name: SDP_ST_UINT16
     * @type {Integer (Int32)}
     */
    static ST_UINT16 => 272

    /**
     * Native name: SDP_ST_UINT32
     * @type {Integer (Int32)}
     */
    static ST_UINT32 => 528

    /**
     * Native name: SDP_ST_UINT64
     * @type {Integer (Int32)}
     */
    static ST_UINT64 => 784

    /**
     * Native name: SDP_ST_UINT128
     * @type {Integer (Int32)}
     */
    static ST_UINT128 => 1040

    /**
     * Native name: SDP_ST_INT8
     * @type {Integer (Int32)}
     */
    static ST_INT8 => 32

    /**
     * Native name: SDP_ST_INT16
     * @type {Integer (Int32)}
     */
    static ST_INT16 => 288

    /**
     * Native name: SDP_ST_INT32
     * @type {Integer (Int32)}
     */
    static ST_INT32 => 544

    /**
     * Native name: SDP_ST_INT64
     * @type {Integer (Int32)}
     */
    static ST_INT64 => 800

    /**
     * Native name: SDP_ST_INT128
     * @type {Integer (Int32)}
     */
    static ST_INT128 => 1056

    /**
     * Native name: SDP_ST_UUID16
     * @type {Integer (Int32)}
     */
    static ST_UUID16 => 304

    /**
     * Native name: SDP_ST_UUID32
     * @type {Integer (Int32)}
     */
    static ST_UUID32 => 544

    /**
     * Native name: SDP_ST_UUID128
     * @type {Integer (Int32)}
     */
    static ST_UUID128 => 1072
}
