#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Represents the density of a typeface, in terms of the lightness or heaviness of the strokes.
 * @remarks
 * 
 * Weight differences are generally differentiated by an increased stroke or thickness that is associated with a given character in a typeface, as compared to a "normal" character from that same typeface. 
 * The following illustration shows an example of Normal and UltraBold weights for the Palatino Linotype typeface.
 * 
 * <img alt='Illustration of the letter "W" in Normal and UltraBold weights' src="./images/FontWeight_for_Palatino.png"/>
 * 
 * <div class="alert"><b>Note</b>  Not all weights are available for all typefaces. When a weight is not available for a typeface, the closest matching weight is returned.</div>
 * <div> </div>
 * Font weight values less than 1 or greater than 999 are considered invalid, and they are rejected by font API functions.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//dwrite/ne-dwrite-dwrite_font_weight
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_FONT_WEIGHT extends Win32Enum{

    /**
     * Predefined font weight : Thin (100).
     * @type {Integer (Int32)}
     */
    static DWRITE_FONT_WEIGHT_THIN => 100

    /**
     * Predefined font weight : Extra-light (200).
     * @type {Integer (Int32)}
     */
    static DWRITE_FONT_WEIGHT_EXTRA_LIGHT => 200

    /**
     * Predefined font weight : Ultra-light (200).
     * @type {Integer (Int32)}
     */
    static DWRITE_FONT_WEIGHT_ULTRA_LIGHT => 200

    /**
     * Predefined font weight : Light (300).
     * @type {Integer (Int32)}
     */
    static DWRITE_FONT_WEIGHT_LIGHT => 300

    /**
     * Predefined font weight : Semi-Light (350).
     * @type {Integer (Int32)}
     */
    static DWRITE_FONT_WEIGHT_SEMI_LIGHT => 350

    /**
     * Predefined font weight : Normal (400).
     * @type {Integer (Int32)}
     */
    static DWRITE_FONT_WEIGHT_NORMAL => 400

    /**
     * Predefined font weight : Regular (400).
     * @type {Integer (Int32)}
     */
    static DWRITE_FONT_WEIGHT_REGULAR => 400

    /**
     * Predefined font weight : Medium (500).
     * @type {Integer (Int32)}
     */
    static DWRITE_FONT_WEIGHT_MEDIUM => 500

    /**
     * Predefined font weight : Demi-bold (600).
     * @type {Integer (Int32)}
     */
    static DWRITE_FONT_WEIGHT_DEMI_BOLD => 600

    /**
     * Predefined font weight : Semi-bold (600).
     * @type {Integer (Int32)}
     */
    static DWRITE_FONT_WEIGHT_SEMI_BOLD => 600

    /**
     * Predefined font weight : Bold (700).
     * @type {Integer (Int32)}
     */
    static DWRITE_FONT_WEIGHT_BOLD => 700

    /**
     * Predefined font weight : Extra-bold (800).
     * @type {Integer (Int32)}
     */
    static DWRITE_FONT_WEIGHT_EXTRA_BOLD => 800

    /**
     * Predefined font weight : Ultra-bold (800).
     * @type {Integer (Int32)}
     */
    static DWRITE_FONT_WEIGHT_ULTRA_BOLD => 800

    /**
     * Predefined font weight : Black (900).
     * @type {Integer (Int32)}
     */
    static DWRITE_FONT_WEIGHT_BLACK => 900

    /**
     * Predefined font weight : Heavy (900).
     * @type {Integer (Int32)}
     */
    static DWRITE_FONT_WEIGHT_HEAVY => 900

    /**
     * Predefined font weight : Extra-black (950).
     * @type {Integer (Int32)}
     */
    static DWRITE_FONT_WEIGHT_EXTRA_BLACK => 950

    /**
     * Predefined font weight : Ultra-black (950).
     * @type {Integer (Int32)}
     */
    static DWRITE_FONT_WEIGHT_ULTRA_BLACK => 950
}
