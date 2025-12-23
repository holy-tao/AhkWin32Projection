#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class RGN_COMBINE_MODE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static RGN_AND => 1

    /**
     * @type {Integer (Int32)}
     */
    static RGN_OR => 2

    /**
     * @type {Integer (Int32)}
     */
    static RGN_XOR => 3

    /**
     * @type {Integer (Int32)}
     */
    static RGN_DIFF => 4

    /**
     * @type {Integer (Int32)}
     */
    static RGN_COPY => 5

    /**
     * @type {Integer (Int32)}
     */
    static RGN_MIN => 1

    /**
     * @type {Integer (Int32)}
     */
    static RGN_MAX => 5
}
