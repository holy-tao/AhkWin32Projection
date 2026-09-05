#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 */
class BUTTON_IMAGELIST_ALIGN extends Win32Enum {

    /**
     * Native name: BUTTON_IMAGELIST_ALIGN_LEFT
     * @type {Integer (UInt32)}
     */
    static LEFT => 0

    /**
     * Native name: BUTTON_IMAGELIST_ALIGN_RIGHT
     * @type {Integer (UInt32)}
     */
    static RIGHT => 1

    /**
     * Native name: BUTTON_IMAGELIST_ALIGN_TOP
     * @type {Integer (UInt32)}
     */
    static TOP => 2

    /**
     * Native name: BUTTON_IMAGELIST_ALIGN_BOTTOM
     * @type {Integer (UInt32)}
     */
    static BOTTOM => 3

    /**
     * Native name: BUTTON_IMAGELIST_ALIGN_CENTER
     * @type {Integer (UInt32)}
     */
    static CENTER => 4
}
