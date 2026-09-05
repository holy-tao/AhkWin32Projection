#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
class CurveChannel extends Win32Enum {

    /**
     * Native name: CurveChannelAll
     * @type {Integer (Int32)}
     */
    static All => 0

    /**
     * Native name: CurveChannelRed
     * @type {Integer (Int32)}
     */
    static Red => 1

    /**
     * Native name: CurveChannelGreen
     * @type {Integer (Int32)}
     */
    static Green => 2

    /**
     * Native name: CurveChannelBlue
     * @type {Integer (Int32)}
     */
    static Blue => 3
}
