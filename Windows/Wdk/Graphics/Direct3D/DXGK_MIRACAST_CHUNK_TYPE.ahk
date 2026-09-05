#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class DXGK_MIRACAST_CHUNK_TYPE extends Win32Enum {

    /**
     * Native name: DXGK_MIRACAST_CHUNK_TYPE_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 0

    /**
     * Native name: DXGK_MIRACAST_CHUNK_TYPE_COLOR_CONVERT_COMPLETE
     * @type {Integer (Int32)}
     */
    static COLOR_CONVERT_COMPLETE => 1

    /**
     * Native name: DXGK_MIRACAST_CHUNK_TYPE_ENCODE_COMPLETE
     * @type {Integer (Int32)}
     */
    static ENCODE_COMPLETE => 2

    /**
     * Native name: DXGK_MIRACAST_CHUNK_TYPE_FRAME_START
     * @type {Integer (Int32)}
     */
    static FRAME_START => 3

    /**
     * Native name: DXGK_MIRACAST_CHUNK_TYPE_FRAME_DROPPED
     * @type {Integer (Int32)}
     */
    static FRAME_DROPPED => 4

    /**
     * Native name: DXGK_MIRACAST_CHUNK_TYPE_ENCODE_DRIVER_DEFINED_1
     * @type {Integer (Int32)}
     */
    static ENCODE_DRIVER_DEFINED_1 => -2147483648

    /**
     * Native name: DXGK_MIRACAST_CHUNK_TYPE_ENCODE_DRIVER_DEFINED_2
     * @type {Integer (Int32)}
     */
    static ENCODE_DRIVER_DEFINED_2 => -2147483647
}
