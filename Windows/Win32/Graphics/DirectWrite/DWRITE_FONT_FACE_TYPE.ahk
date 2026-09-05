#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates the file format of a complete font face.
 * @remarks
 * Font formats that consist of multiple files, such as Type 1 .PFM and .PFB, have a single enum entry.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_font_face_type
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
class DWRITE_FONT_FACE_TYPE extends Win32Enum {

    /**
     * OpenType font face with CFF outlines.
     * Native name: DWRITE_FONT_FACE_TYPE_CFF
     * @type {Integer (Int32)}
     */
    static CFF => 0

    /**
     * OpenType font face with TrueType outlines.
     * Native name: DWRITE_FONT_FACE_TYPE_TRUETYPE
     * @type {Integer (Int32)}
     */
    static TRUETYPE => 1

    /**
     * Native name: DWRITE_FONT_FACE_TYPE_OPENTYPE_COLLECTION
     * @type {Integer (Int32)}
     */
    static OPENTYPE_COLLECTION => 2

    /**
     * A Type 1 font face.
     * Native name: DWRITE_FONT_FACE_TYPE_TYPE1
     * @type {Integer (Int32)}
     */
    static TYPE1 => 3

    /**
     * A vector .FON format font face.
     * Native name: DWRITE_FONT_FACE_TYPE_VECTOR
     * @type {Integer (Int32)}
     */
    static VECTOR => 4

    /**
     * A bitmap .FON format font face.
     * Native name: DWRITE_FONT_FACE_TYPE_BITMAP
     * @type {Integer (Int32)}
     */
    static BITMAP => 5

    /**
     * Font face type is not recognized by the DirectWrite font system.
     * Native name: DWRITE_FONT_FACE_TYPE_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 6

    /**
     * The font data includes only the CFF table from an OpenType CFF font. This font face type can be used only for embedded fonts (i.e., custom font file loaders) and the resulting font face object supports only the minimum functionality necessary to render glyphs.
     * Native name: DWRITE_FONT_FACE_TYPE_RAW_CFF
     * @type {Integer (Int32)}
     */
    static RAW_CFF => 7

    /**
     * OpenType font face that is a part of a TrueType collection.
     * Native name: DWRITE_FONT_FACE_TYPE_TRUETYPE_COLLECTION
     * @type {Integer (Int32)}
     */
    static TRUETYPE_COLLECTION => 2
}
