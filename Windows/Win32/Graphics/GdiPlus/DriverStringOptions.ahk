#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DriverStringOptions enumeration specifies the spacing, orientation, and quality of the rendering for driver strings.
 * @see https://docs.microsoft.com/windows/win32/api//gdiplusenums/ne-gdiplusenums-driverstringoptions
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class DriverStringOptions extends Win32Enum{

    /**
     * Specifies that the string array contains Unicode character values. 
     * 			If this flag is not set, each value in array is interpreted as an index to a font glyph that defines a character to be displayed.
     * @type {Integer (Int32)}
     */
    static DriverStringOptionsCmapLookup => 1

    /**
     * Specifies that the string is displayed vertically.
     * @type {Integer (Int32)}
     */
    static DriverStringOptionsVertical => 2

    /**
     * Specifies that the glyph positions are calculated from the position of the first glyph. If this flag is not set, the glyph positions are obtained from an array of coordinates.
     * @type {Integer (Int32)}
     */
    static DriverStringOptionsRealizedAdvance => 4

    /**
     * Specifies that less memory should be used for cache of antialiased glyphs. This also produces lower quality. If this flag isn't set, more memory is used, but the quality is higher.
     * @type {Integer (Int32)}
     */
    static DriverStringOptionsLimitSubpixel => 8
}
