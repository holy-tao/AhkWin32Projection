#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The WrapMode enumeration specifies how repeated copies of an image are used to tile an area.
 * @see https://docs.microsoft.com/windows/win32/api//gdiplusenums/ne-gdiplusenums-wrapmode
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class WrapMode extends Win32Enum{

    /**
     * Specifies tiling without flipping.
     * @type {Integer (Int32)}
     */
    static WrapModeTile => 0

    /**
     * Specifies that tiles are flipped horizontally as you move from one tile to the next in a row.
     * @type {Integer (Int32)}
     */
    static WrapModeTileFlipX => 1

    /**
     * Specifies that tiles are flipped vertically as you move from one tile to the next in a column.
     * @type {Integer (Int32)}
     */
    static WrapModeTileFlipY => 2

    /**
     * Specifies that tiles are flipped horizontally as you move along a row and flipped vertically as you move along a column.
     * @type {Integer (Int32)}
     */
    static WrapModeTileFlipXY => 3

    /**
     * Specifies that no tiling takes place.
     * @type {Integer (Int32)}
     */
    static WrapModeClamp => 4
}
