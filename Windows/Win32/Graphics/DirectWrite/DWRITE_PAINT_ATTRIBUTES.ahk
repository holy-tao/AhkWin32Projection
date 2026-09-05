#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
class DWRITE_PAINT_ATTRIBUTES extends Win32BitflagEnum {

    /**
     * Native name: DWRITE_PAINT_ATTRIBUTES_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Native name: DWRITE_PAINT_ATTRIBUTES_USES_PALETTE
     * @type {Integer (Int32)}
     */
    static USES_PALETTE => 1

    /**
     * Native name: DWRITE_PAINT_ATTRIBUTES_USES_TEXT_COLOR
     * @type {Integer (Int32)}
     */
    static USES_TEXT_COLOR => 2
}
