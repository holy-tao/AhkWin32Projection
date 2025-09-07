#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates the file format of a complete font face.
 * @remarks
 * Font formats that consist of multiple files, such as Type 1 .PFM and .PFB, have a single enum entry.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_font_face_type
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_FONT_FACE_TYPE{

    /**
     * OpenType font face with CFF outlines.
     * @type {Integer (Int32)}
     */
    static DWRITE_FONT_FACE_TYPE_CFF => 0

    /**
     * OpenType font face with TrueType outlines.
     * @type {Integer (Int32)}
     */
    static DWRITE_FONT_FACE_TYPE_TRUETYPE => 1

    /**
     * 
     * @type {Integer (Int32)}
     */
    static DWRITE_FONT_FACE_TYPE_OPENTYPE_COLLECTION => 2

    /**
     * A Type 1 font face.
     * @type {Integer (Int32)}
     */
    static DWRITE_FONT_FACE_TYPE_TYPE1 => 3

    /**
     * A vector .FON format font face.
     * @type {Integer (Int32)}
     */
    static DWRITE_FONT_FACE_TYPE_VECTOR => 4

    /**
     * A bitmap .FON format font face.
     * @type {Integer (Int32)}
     */
    static DWRITE_FONT_FACE_TYPE_BITMAP => 5

    /**
     * Font face type is not recognized by the DirectWrite font system.
     * @type {Integer (Int32)}
     */
    static DWRITE_FONT_FACE_TYPE_UNKNOWN => 6

    /**
     * The font data includes only the CFF table from an OpenType CFF font. This font face type can be used only for embedded fonts (i.e., custom font file loaders) and the resulting font face object supports only the minimum functionality necessary to render glyphs.
     * @type {Integer (Int32)}
     */
    static DWRITE_FONT_FACE_TYPE_RAW_CFF => 7

    /**
     * OpenType font face that is a part of a TrueType collection.
     * @type {Integer (Int32)}
     */
    static DWRITE_FONT_FACE_TYPE_TRUETYPE_COLLECTION => 2
}
