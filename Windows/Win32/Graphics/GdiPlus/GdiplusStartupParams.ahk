#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class GdiplusStartupParams extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static GdiplusStartupDefault => 0

    /**
     * @type {Integer (Int32)}
     */
    static GdiplusStartupNoSetRound => 1

    /**
     * @type {Integer (Int32)}
     */
    static GdiplusStartupSetPSValue => 2

    /**
     * @type {Integer (Int32)}
     */
    static GdiplusStartupReserved0 => 4

    /**
     * @type {Integer (Int32)}
     */
    static GdiplusStartupReserved1 => 8

    /**
     * @type {Integer (Int32)}
     */
    static GdiplusStartupReserved2 => 16

    /**
     * @type {Integer (Int32)}
     */
    static GdiplusStartupTransparencyMask => -16777216
}
