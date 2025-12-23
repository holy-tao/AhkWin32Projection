#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class SmoothingMode extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SmoothingModeInvalid => -1

    /**
     * @type {Integer (Int32)}
     */
    static SmoothingModeDefault => 0

    /**
     * @type {Integer (Int32)}
     */
    static SmoothingModeHighSpeed => 1

    /**
     * @type {Integer (Int32)}
     */
    static SmoothingModeHighQuality => 2

    /**
     * @type {Integer (Int32)}
     */
    static SmoothingModeNone => 3

    /**
     * @type {Integer (Int32)}
     */
    static SmoothingModeAntiAlias => 4

    /**
     * @type {Integer (Int32)}
     */
    static SmoothingModeAntiAlias8x4 => 4

    /**
     * @type {Integer (Int32)}
     */
    static SmoothingModeAntiAlias8x8 => 5
}
