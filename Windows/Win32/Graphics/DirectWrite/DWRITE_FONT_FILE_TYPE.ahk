#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The type of a font represented by a single font file. Font formats that consist of multiple files, for example Type 1 .PFM and .PFB, have separate enum values for each of the file types.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_font_file_type
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
class DWRITE_FONT_FILE_TYPE extends Win32Enum {

    /**
     * Font type is not recognized by the DirectWrite font system.
     * Native name: DWRITE_FONT_FILE_TYPE_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 0

    /**
     * OpenType font with CFF outlines.
     * Native name: DWRITE_FONT_FILE_TYPE_CFF
     * @type {Integer (Int32)}
     */
    static CFF => 1

    /**
     * OpenType font with TrueType outlines.
     * Native name: DWRITE_FONT_FILE_TYPE_TRUETYPE
     * @type {Integer (Int32)}
     */
    static TRUETYPE => 2

    /**
     * Native name: DWRITE_FONT_FILE_TYPE_OPENTYPE_COLLECTION
     * @type {Integer (Int32)}
     */
    static OPENTYPE_COLLECTION => 3

    /**
     * Type 1 PFM font.
     * Native name: DWRITE_FONT_FILE_TYPE_TYPE1_PFM
     * @type {Integer (Int32)}
     */
    static TYPE1_PFM => 4

    /**
     * Type 1 PFB font.
     * Native name: DWRITE_FONT_FILE_TYPE_TYPE1_PFB
     * @type {Integer (Int32)}
     */
    static TYPE1_PFB => 5

    /**
     * Vector .FON font.
     * Native name: DWRITE_FONT_FILE_TYPE_VECTOR
     * @type {Integer (Int32)}
     */
    static VECTOR => 6

    /**
     * Bitmap .FON font.
     * Native name: DWRITE_FONT_FILE_TYPE_BITMAP
     * @type {Integer (Int32)}
     */
    static BITMAP => 7

    /**
     * OpenType font that contains a TrueType collection.
     * Native name: DWRITE_FONT_FILE_TYPE_TRUETYPE_COLLECTION
     * @type {Integer (Int32)}
     */
    static TRUETYPE_COLLECTION => 3
}
