#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
class CoordinateSpace extends Win32Enum {

    /**
     * Native name: CoordinateSpaceWorld
     * @type {Integer (Int32)}
     */
    static World => 0

    /**
     * Native name: CoordinateSpacePage
     * @type {Integer (Int32)}
     */
    static Page => 1

    /**
     * Native name: CoordinateSpaceDevice
     * @type {Integer (Int32)}
     */
    static Device => 2
}
