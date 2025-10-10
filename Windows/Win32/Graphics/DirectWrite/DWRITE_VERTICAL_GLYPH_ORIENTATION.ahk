#Requires AutoHotkey v2.0.0 64-bit

/**
 * The DWRITE_VERTICAL_GLYPH_ORIENTATION enumeration contains values that specify the desired kind of glyph orientation for the text.
 * @remarks
 * 
  * The client specifies a <b>DWRITE_VERTICAL_GLYPH_ORIENTATION</b>-typed value to the analyzer as the desired orientation.
  * 
  * <div class="alert"><b>Note</b>  This is the client preference, and the constraints of the script determine the final presentation.</div>
  * <div> </div>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_1/ne-dwrite_1-dwrite_vertical_glyph_orientation
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_VERTICAL_GLYPH_ORIENTATION{

    /**
     * The default glyph orientation. In vertical layout, naturally horizontal scripts (Latin, Thai, Arabic, Devanagari) rotate 90 degrees clockwise, while ideographic scripts (Chinese, Japanese, Korean) remain upright, 0 degrees.
     * @type {Integer (Int32)}
     */
    static DWRITE_VERTICAL_GLYPH_ORIENTATION_DEFAULT => 0

    /**
     * Stacked glyph orientation. Ideographic scripts and scripts that permit stacking (Latin, Hebrew) are stacked in vertical reading layout. Connected scripts (Arabic, Syriac, 'Phags-pa, Ogham), which would otherwise look broken if glyphs were kept at 0 degrees, remain connected and rotate.
     * @type {Integer (Int32)}
     */
    static DWRITE_VERTICAL_GLYPH_ORIENTATION_STACKED => 1
}
