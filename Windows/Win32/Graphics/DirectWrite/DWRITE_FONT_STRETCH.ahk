#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Represents the degree to which a font has been stretched compared to a font's normal aspect ratio.
 * @remarks
 * A font stretch describes the degree to which a font form is stretched from its normal aspect ratio, which is the original width to height ratio specified for the glyphs in the font. 
 * The following illustration shows an example of Normal and Condensed stretches for the Rockwell Bold typeface.
 * 
 * <img alt="Illustration of “D2D” text in Normal and Condensed font stretch" src="./images/FontStretch_for_RockwellBold.png"/>
 * 
 * <div class="alert"><b>Note</b>  Values other than the ones defined in the enumeration are considered to be invalid, and are rejected by font API functions.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_font_stretch
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_FONT_STRETCH extends Win32Enum{

    /**
     * Predefined font stretch : Not known (0).
     * @type {Integer (Int32)}
     */
    static DWRITE_FONT_STRETCH_UNDEFINED => 0

    /**
     * Predefined font stretch : Ultra-condensed (1).
     * @type {Integer (Int32)}
     */
    static DWRITE_FONT_STRETCH_ULTRA_CONDENSED => 1

    /**
     * Predefined font stretch : Extra-condensed (2).
     * @type {Integer (Int32)}
     */
    static DWRITE_FONT_STRETCH_EXTRA_CONDENSED => 2

    /**
     * Predefined font stretch : Condensed (3).
     * @type {Integer (Int32)}
     */
    static DWRITE_FONT_STRETCH_CONDENSED => 3

    /**
     * Predefined font stretch : Semi-condensed (4).
     * @type {Integer (Int32)}
     */
    static DWRITE_FONT_STRETCH_SEMI_CONDENSED => 4

    /**
     * Predefined font stretch : Normal (5).
     * @type {Integer (Int32)}
     */
    static DWRITE_FONT_STRETCH_NORMAL => 5

    /**
     * Predefined font stretch : Medium (5).
     * @type {Integer (Int32)}
     */
    static DWRITE_FONT_STRETCH_MEDIUM => 5

    /**
     * Predefined font stretch : Semi-expanded (6).
     * @type {Integer (Int32)}
     */
    static DWRITE_FONT_STRETCH_SEMI_EXPANDED => 6

    /**
     * Predefined font stretch : Expanded (7).
     * @type {Integer (Int32)}
     */
    static DWRITE_FONT_STRETCH_EXPANDED => 7

    /**
     * Predefined font stretch : Extra-expanded (8).
     * @type {Integer (Int32)}
     */
    static DWRITE_FONT_STRETCH_EXTRA_EXPANDED => 8

    /**
     * Predefined font stretch : Ultra-expanded (9).
     * @type {Integer (Int32)}
     */
    static DWRITE_FONT_STRETCH_ULTRA_EXPANDED => 9
}
