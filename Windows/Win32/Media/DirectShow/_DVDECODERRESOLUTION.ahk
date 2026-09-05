#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
class _DVDECODERRESOLUTION extends Win32Enum {

    /**
     * Native name: DVDECODERRESOLUTION_720x480
     * @type {Integer (Int32)}
     */
    static 720x480 => 1000

    /**
     * Native name: DVDECODERRESOLUTION_360x240
     * @type {Integer (Int32)}
     */
    static 360x240 => 1001

    /**
     * Native name: DVDECODERRESOLUTION_180x120
     * @type {Integer (Int32)}
     */
    static 180x120 => 1002

    /**
     * Native name: DVDECODERRESOLUTION_88x60
     * @type {Integer (Int32)}
     */
    static 88x60 => 1003
}
