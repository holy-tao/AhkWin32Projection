#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class eAVEncVideoQPMapElementDataType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static CODEC_API_QP_MAP_INT8 => 0

    /**
     * @type {Integer (Int32)}
     */
    static CODEC_API_QP_MAP_INT16 => 1

    /**
     * @type {Integer (Int32)}
     */
    static CODEC_API_QP_MAP_INT32 => 2

    /**
     * @type {Integer (Int32)}
     */
    static CODEC_API_QP_MAP_UINT8 => -2147483648

    /**
     * @type {Integer (Int32)}
     */
    static CODEC_API_QP_MAP_UINT16 => -2147483647

    /**
     * @type {Integer (Int32)}
     */
    static CODEC_API_QP_MAP_UINT32 => -2147483646
}
