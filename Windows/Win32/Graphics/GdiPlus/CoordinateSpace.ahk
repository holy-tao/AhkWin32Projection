#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
class CoordinateSpace extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static CoordinateSpaceWorld => 0

    /**
     * @type {Integer (Int32)}
     */
    static CoordinateSpacePage => 1

    /**
     * @type {Integer (Int32)}
     */
    static CoordinateSpaceDevice => 2
}
