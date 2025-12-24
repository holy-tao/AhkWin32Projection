#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class DXGK_MIRACAST_CHUNK_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DXGK_MIRACAST_CHUNK_TYPE_UNKNOWN => 0

    /**
     * @type {Integer (Int32)}
     */
    static DXGK_MIRACAST_CHUNK_TYPE_COLOR_CONVERT_COMPLETE => 1

    /**
     * @type {Integer (Int32)}
     */
    static DXGK_MIRACAST_CHUNK_TYPE_ENCODE_COMPLETE => 2

    /**
     * @type {Integer (Int32)}
     */
    static DXGK_MIRACAST_CHUNK_TYPE_FRAME_START => 3

    /**
     * @type {Integer (Int32)}
     */
    static DXGK_MIRACAST_CHUNK_TYPE_FRAME_DROPPED => 4

    /**
     * @type {Integer (Int32)}
     */
    static DXGK_MIRACAST_CHUNK_TYPE_ENCODE_DRIVER_DEFINED_1 => -2147483648

    /**
     * @type {Integer (Int32)}
     */
    static DXGK_MIRACAST_CHUNK_TYPE_ENCODE_DRIVER_DEFINED_2 => -2147483647
}
