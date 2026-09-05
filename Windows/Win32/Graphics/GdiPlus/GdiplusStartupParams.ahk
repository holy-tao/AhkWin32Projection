#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
class GdiplusStartupParams extends Win32Enum {

    /**
     * Native name: GdiplusStartupDefault
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * Native name: GdiplusStartupNoSetRound
     * @type {Integer (Int32)}
     */
    static NoSetRound => 1

    /**
     * Native name: GdiplusStartupSetPSValue
     * @type {Integer (Int32)}
     */
    static SetPSValue => 2

    /**
     * Native name: GdiplusStartupReserved0
     * @type {Integer (Int32)}
     */
    static Reserved0 => 4

    /**
     * Native name: GdiplusStartupReserved1
     * @type {Integer (Int32)}
     */
    static Reserved1 => 8

    /**
     * Native name: GdiplusStartupReserved2
     * @type {Integer (Int32)}
     */
    static Reserved2 => 16

    /**
     * Native name: GdiplusStartupTransparencyMask
     * @type {Integer (Int32)}
     */
    static TransparencyMask => -16777216
}
