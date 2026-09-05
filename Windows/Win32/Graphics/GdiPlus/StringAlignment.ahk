#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
class StringAlignment extends Win32Enum {

    /**
     * Native name: StringAlignmentNear
     * @type {Integer (Int32)}
     */
    static Near => 0

    /**
     * Native name: StringAlignmentCenter
     * @type {Integer (Int32)}
     */
    static Center => 1

    /**
     * Native name: StringAlignmentFar
     * @type {Integer (Int32)}
     */
    static Far => 2
}
