#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class eAVDecVideoCodecType extends Win32Enum {

    /**
     * Native name: eAVDecVideoCodecType_NOTPLAYING
     * @type {Integer (Int32)}
     */
    static NOTPLAYING => 0

    /**
     * Native name: eAVDecVideoCodecType_MPEG2
     * @type {Integer (Int32)}
     */
    static MPEG2 => 1

    /**
     * Native name: eAVDecVideoCodecType_H264
     * @type {Integer (Int32)}
     */
    static H264 => 2
}
