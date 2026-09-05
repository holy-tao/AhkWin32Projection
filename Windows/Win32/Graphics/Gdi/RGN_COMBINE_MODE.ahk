#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
class RGN_COMBINE_MODE extends Win32Enum {

    /**
     * Native name: RGN_AND
     * @type {Integer (Int32)}
     */
    static AND => 1

    /**
     * Native name: RGN_OR
     * @type {Integer (Int32)}
     */
    static OR => 2

    /**
     * Native name: RGN_XOR
     * @type {Integer (Int32)}
     */
    static XOR => 3

    /**
     * Native name: RGN_DIFF
     * @type {Integer (Int32)}
     */
    static DIFF => 4

    /**
     * Native name: RGN_COPY
     * @type {Integer (Int32)}
     */
    static COPY => 5

    /**
     * Native name: RGN_MIN
     * @type {Integer (Int32)}
     */
    static MIN => 1

    /**
     * Native name: RGN_MAX
     * @type {Integer (Int32)}
     */
    static MAX => 5
}
