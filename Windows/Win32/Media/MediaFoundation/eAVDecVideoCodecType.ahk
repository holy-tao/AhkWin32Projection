#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class eAVDecVideoCodecType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static eAVDecVideoCodecType_NOTPLAYING => 0

    /**
     * @type {Integer (Int32)}
     */
    static eAVDecVideoCodecType_MPEG2 => 1

    /**
     * @type {Integer (Int32)}
     */
    static eAVDecVideoCodecType_H264 => 2
}
