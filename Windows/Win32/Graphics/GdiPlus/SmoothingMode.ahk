#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
class SmoothingMode extends Win32Enum {

    /**
     * Native name: SmoothingModeInvalid
     * @type {Integer (Int32)}
     */
    static Invalid => -1

    /**
     * Native name: SmoothingModeDefault
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * Native name: SmoothingModeHighSpeed
     * @type {Integer (Int32)}
     */
    static HighSpeed => 1

    /**
     * Native name: SmoothingModeHighQuality
     * @type {Integer (Int32)}
     */
    static HighQuality => 2

    /**
     * Native name: SmoothingModeNone
     * @type {Integer (Int32)}
     */
    static None => 3

    /**
     * Native name: SmoothingModeAntiAlias
     * @type {Integer (Int32)}
     */
    static AntiAlias => 4

    /**
     * Native name: SmoothingModeAntiAlias8x4
     * @type {Integer (Int32)}
     */
    static AntiAlias8x4 => 4

    /**
     * Native name: SmoothingModeAntiAlias8x8
     * @type {Integer (Int32)}
     */
    static AntiAlias8x8 => 5
}
