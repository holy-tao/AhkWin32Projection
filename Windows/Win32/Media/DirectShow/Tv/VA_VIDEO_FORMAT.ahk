#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
class VA_VIDEO_FORMAT extends Win32Enum {

    /**
     * Native name: VA_VIDEO_COMPONENT
     * @type {Integer (Int32)}
     */
    static COMPONENT => 0

    /**
     * Native name: VA_VIDEO_PAL
     * @type {Integer (Int32)}
     */
    static PAL => 1

    /**
     * Native name: VA_VIDEO_NTSC
     * @type {Integer (Int32)}
     */
    static NTSC => 2

    /**
     * Native name: VA_VIDEO_SECAM
     * @type {Integer (Int32)}
     */
    static SECAM => 3

    /**
     * Native name: VA_VIDEO_MAC
     * @type {Integer (Int32)}
     */
    static MAC => 4

    /**
     * Native name: VA_VIDEO_UNSPECIFIED
     * @type {Integer (Int32)}
     */
    static UNSPECIFIED => 5
}
