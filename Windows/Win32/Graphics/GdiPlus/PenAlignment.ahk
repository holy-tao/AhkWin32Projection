#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
class PenAlignment extends Win32Enum {

    /**
     * Native name: PenAlignmentCenter
     * @type {Integer (Int32)}
     */
    static Center => 0

    /**
     * Native name: PenAlignmentInset
     * @type {Integer (Int32)}
     */
    static Inset => 1
}
