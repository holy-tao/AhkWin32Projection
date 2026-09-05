#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies which formats are supported in the font, either at a font-wide level or per glyph.
 * @see https://learn.microsoft.com/windows/win32/api/dcommon/ne-dcommon-dwrite_glyph_image_formats
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
class DWRITE_GLYPH_IMAGE_FORMATS extends Win32BitflagEnum {

    /**
     * Indicates no data is available for this glyph.
     * Native name: DWRITE_GLYPH_IMAGE_FORMATS_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * The glyph has TrueType outlines.
     * Native name: DWRITE_GLYPH_IMAGE_FORMATS_TRUETYPE
     * @type {Integer (Int32)}
     */
    static TRUETYPE => 1

    /**
     * The glyph has CFF outlines.
     * Native name: DWRITE_GLYPH_IMAGE_FORMATS_CFF
     * @type {Integer (Int32)}
     */
    static CFF => 2

    /**
     * The glyph has multilayered COLR data.
     * Native name: DWRITE_GLYPH_IMAGE_FORMATS_COLR
     * @type {Integer (Int32)}
     */
    static COLR => 4

    /**
     * The glyph has SVG outlines as standard XML.  Fonts may store the content gzip'd rather than plain text, indicated by the first two bytes as gzip header {0x1F 0x8B}.
     * Native name: DWRITE_GLYPH_IMAGE_FORMATS_SVG
     * @type {Integer (Int32)}
     */
    static SVG => 8

    /**
     * The glyph has PNG image data, with standard PNG IHDR.
     * Native name: DWRITE_GLYPH_IMAGE_FORMATS_PNG
     * @type {Integer (Int32)}
     */
    static PNG => 16

    /**
     * The glyph has JPEG image data, with standard JIFF SOI header.
     * Native name: DWRITE_GLYPH_IMAGE_FORMATS_JPEG
     * @type {Integer (Int32)}
     */
    static JPEG => 32

    /**
     * The glyph has TIFF image data.
     * Native name: DWRITE_GLYPH_IMAGE_FORMATS_TIFF
     * @type {Integer (Int32)}
     */
    static TIFF => 64

    /**
     * The glyph has raw 32-bit premultiplied BGRA data.
     * Native name: DWRITE_GLYPH_IMAGE_FORMATS_PREMULTIPLIED_B8G8R8A8
     * @type {Integer (Int32)}
     */
    static PREMULTIPLIED_B8G8R8A8 => 128

    /**
     * Native name: DWRITE_GLYPH_IMAGE_FORMATS_COLR_PAINT_TREE
     * @type {Integer (Int32)}
     */
    static COLR_PAINT_TREE => 256
}
