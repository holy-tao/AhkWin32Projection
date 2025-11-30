#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class LIST_VIEW_BACKGROUND_IMAGE_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static LVBKIF_SOURCE_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static LVBKIF_SOURCE_HBITMAP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LVBKIF_SOURCE_URL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LVBKIF_SOURCE_MASK => 3

    /**
     * @type {Integer (UInt32)}
     */
    static LVBKIF_STYLE_NORMAL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static LVBKIF_STYLE_TILE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static LVBKIF_STYLE_MASK => 16

    /**
     * @type {Integer (UInt32)}
     */
    static LVBKIF_FLAG_TILEOFFSET => 256

    /**
     * @type {Integer (UInt32)}
     */
    static LVBKIF_TYPE_WATERMARK => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static LVBKIF_FLAG_ALPHABLEND => 536870912
}
