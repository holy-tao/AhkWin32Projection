#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class BUTTON_IMAGELIST_ALIGN extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static BUTTON_IMAGELIST_ALIGN_LEFT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static BUTTON_IMAGELIST_ALIGN_RIGHT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static BUTTON_IMAGELIST_ALIGN_TOP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static BUTTON_IMAGELIST_ALIGN_BOTTOM => 3

    /**
     * @type {Integer (UInt32)}
     */
    static BUTTON_IMAGELIST_ALIGN_CENTER => 4
}
