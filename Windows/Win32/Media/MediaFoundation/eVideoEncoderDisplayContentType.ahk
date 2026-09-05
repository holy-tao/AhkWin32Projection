#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class eVideoEncoderDisplayContentType extends Win32Enum {

    /**
     * Native name: eVideoEncoderDisplayContent_Unknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * Native name: eVideoEncoderDisplayContent_FullScreenVideo
     * @type {Integer (Int32)}
     */
    static FullScreenVideo => 1
}
