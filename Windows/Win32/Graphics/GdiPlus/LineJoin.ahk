#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class LineJoin extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static LineJoinMiter => 0

    /**
     * @type {Integer (Int32)}
     */
    static LineJoinBevel => 1

    /**
     * @type {Integer (Int32)}
     */
    static LineJoinRound => 2

    /**
     * @type {Integer (Int32)}
     */
    static LineJoinMiterClipped => 3
}
