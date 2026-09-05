#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
class LineJoin extends Win32Enum {

    /**
     * Native name: LineJoinMiter
     * @type {Integer (Int32)}
     */
    static Miter => 0

    /**
     * Native name: LineJoinBevel
     * @type {Integer (Int32)}
     */
    static Bevel => 1

    /**
     * Native name: LineJoinRound
     * @type {Integer (Int32)}
     */
    static Round => 2

    /**
     * Native name: LineJoinMiterClipped
     * @type {Integer (Int32)}
     */
    static MiterClipped => 3
}
