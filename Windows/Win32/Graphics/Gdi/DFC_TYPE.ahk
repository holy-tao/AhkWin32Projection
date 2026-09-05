#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
class DFC_TYPE extends Win32Enum {

    /**
     * Native name: DFC_CAPTION
     * @type {Integer (UInt32)}
     */
    static CAPTION => 1

    /**
     * Native name: DFC_MENU
     * @type {Integer (UInt32)}
     */
    static MENU => 2

    /**
     * Native name: DFC_SCROLL
     * @type {Integer (UInt32)}
     */
    static SCROLL => 3

    /**
     * Native name: DFC_BUTTON
     * @type {Integer (UInt32)}
     */
    static BUTTON => 4

    /**
     * Native name: DFC_POPUPMENU
     * @type {Integer (UInt32)}
     */
    static POPUPMENU => 5
}
