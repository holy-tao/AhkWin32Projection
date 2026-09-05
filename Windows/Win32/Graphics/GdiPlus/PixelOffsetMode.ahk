#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
class PixelOffsetMode extends Win32Enum {

    /**
     * Native name: PixelOffsetModeInvalid
     * @type {Integer (Int32)}
     */
    static Invalid => -1

    /**
     * Native name: PixelOffsetModeDefault
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * Native name: PixelOffsetModeHighSpeed
     * @type {Integer (Int32)}
     */
    static HighSpeed => 1

    /**
     * Native name: PixelOffsetModeHighQuality
     * @type {Integer (Int32)}
     */
    static HighQuality => 2

    /**
     * Native name: PixelOffsetModeNone
     * @type {Integer (Int32)}
     */
    static None => 3

    /**
     * Native name: PixelOffsetModeHalf
     * @type {Integer (Int32)}
     */
    static Half => 4
}
