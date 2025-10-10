#Requires AutoHotkey v2.0.0 64-bit

/**
 * The type of a font represented by a single font file. Font formats that consist of multiple files, for example Type 1 .PFM and .PFB, have separate enum values for each of the file types.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite/ne-dwrite-dwrite_font_file_type
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_FONT_FILE_TYPE{

    /**
     * Font type is not recognized by the DirectWrite font system.
     * @type {Integer (Int32)}
     */
    static DWRITE_FONT_FILE_TYPE_UNKNOWN => 0

    /**
     * OpenType font with CFF outlines.
     * @type {Integer (Int32)}
     */
    static DWRITE_FONT_FILE_TYPE_CFF => 1

    /**
     * OpenType font with TrueType outlines.
     * @type {Integer (Int32)}
     */
    static DWRITE_FONT_FILE_TYPE_TRUETYPE => 2

    /**
     * 
     * @type {Integer (Int32)}
     */
    static DWRITE_FONT_FILE_TYPE_OPENTYPE_COLLECTION => 3

    /**
     * Type 1 PFM font.
     * @type {Integer (Int32)}
     */
    static DWRITE_FONT_FILE_TYPE_TYPE1_PFM => 4

    /**
     * Type 1 PFB font.
     * @type {Integer (Int32)}
     */
    static DWRITE_FONT_FILE_TYPE_TYPE1_PFB => 5

    /**
     * Vector .FON font.
     * @type {Integer (Int32)}
     */
    static DWRITE_FONT_FILE_TYPE_VECTOR => 6

    /**
     * Bitmap .FON font.
     * @type {Integer (Int32)}
     */
    static DWRITE_FONT_FILE_TYPE_BITMAP => 7

    /**
     * OpenType font that contains a TrueType collection.
     * @type {Integer (Int32)}
     */
    static DWRITE_FONT_FILE_TYPE_TRUETYPE_COLLECTION => 3
}
