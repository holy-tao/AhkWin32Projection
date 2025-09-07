#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies which formats are supported in the font, either at a font-wide level or per glyph.
 * @see https://learn.microsoft.com/windows/win32/api/dcommon/ne-dcommon-dwrite_glyph_image_formats
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_GLYPH_IMAGE_FORMATS{

    /**
     * Indicates no data is available for this glyph.
     * @type {Integer (Int32)}
     */
    static DWRITE_GLYPH_IMAGE_FORMATS_NONE => 0

    /**
     * The glyph has TrueType outlines.
     * @type {Integer (Int32)}
     */
    static DWRITE_GLYPH_IMAGE_FORMATS_TRUETYPE => 1

    /**
     * The glyph has CFF outlines.
     * @type {Integer (Int32)}
     */
    static DWRITE_GLYPH_IMAGE_FORMATS_CFF => 2

    /**
     * The glyph has multilayered COLR data.
     * @type {Integer (Int32)}
     */
    static DWRITE_GLYPH_IMAGE_FORMATS_COLR => 4

    /**
     * The glyph has SVG outlines as standard XML.  Fonts may store the content gzip'd rather than plain text, indicated by the first two bytes as gzip header {0x1F 0x8B}.
     * @type {Integer (Int32)}
     */
    static DWRITE_GLYPH_IMAGE_FORMATS_SVG => 8

    /**
     * The glyph has PNG image data, with standard PNG IHDR.
     * @type {Integer (Int32)}
     */
    static DWRITE_GLYPH_IMAGE_FORMATS_PNG => 16

    /**
     * The glyph has JPEG image data, with standard JIFF SOI header.
     * @type {Integer (Int32)}
     */
    static DWRITE_GLYPH_IMAGE_FORMATS_JPEG => 32

    /**
     * The glyph has TIFF image data.
     * @type {Integer (Int32)}
     */
    static DWRITE_GLYPH_IMAGE_FORMATS_TIFF => 64

    /**
     * The glyph has raw 32-bit premultiplied BGRA data.
     * @type {Integer (Int32)}
     */
    static DWRITE_GLYPH_IMAGE_FORMATS_PREMULTIPLIED_B8G8R8A8 => 128

    /**
     * @type {Integer (Int32)}
     */
    static DWRITE_GLYPH_IMAGE_FORMATS_COLR_PAINT_TREE => 256
}
