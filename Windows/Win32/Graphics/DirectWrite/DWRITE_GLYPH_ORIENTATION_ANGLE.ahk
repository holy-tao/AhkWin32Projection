#Requires AutoHotkey v2.0.0 64-bit

/**
 * The DWRITE_GLYPH_ORIENTATION_ANGLE enumeration contains values that specify how the glyph is oriented to the x-axis.
 * @remarks
 * The text analyzer outputs <b>DWRITE_GLYPH_ORIENTATION_ANGLE</b> values. The value that it outputs depends on the desired orientation, bidi level, and character properties.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/ne-dwrite_1-dwrite_glyph_orientation_angle
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_GLYPH_ORIENTATION_ANGLE{

    /**
     * Glyph orientation is upright.
     * @type {Integer (Int32)}
     */
    static DWRITE_GLYPH_ORIENTATION_ANGLE_0_DEGREES => 0

    /**
     * Glyph orientation is rotated 90 degrees clockwise.
     * @type {Integer (Int32)}
     */
    static DWRITE_GLYPH_ORIENTATION_ANGLE_90_DEGREES => 1

    /**
     * Glyph orientation is upside-down.
     * @type {Integer (Int32)}
     */
    static DWRITE_GLYPH_ORIENTATION_ANGLE_180_DEGREES => 2

    /**
     * Glyph orientation is rotated 270 degrees clockwise.
     * @type {Integer (Int32)}
     */
    static DWRITE_GLYPH_ORIENTATION_ANGLE_270_DEGREES => 3
}
