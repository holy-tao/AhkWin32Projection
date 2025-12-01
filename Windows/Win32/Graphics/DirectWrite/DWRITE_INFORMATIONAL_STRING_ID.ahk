#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The informational string enumeration which identifies a string embedded in a font file.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_informational_string_id
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_INFORMATIONAL_STRING_ID extends Win32Enum{

    /**
     * Indicates the string containing the unspecified name ID.
     * @type {Integer (Int32)}
     */
    static DWRITE_INFORMATIONAL_STRING_NONE => 0

    /**
     * Indicates the string containing the copyright notice provided by the font.
     * @type {Integer (Int32)}
     */
    static DWRITE_INFORMATIONAL_STRING_COPYRIGHT_NOTICE => 1

    /**
     * Indicates the string containing a version number.
     * @type {Integer (Int32)}
     */
    static DWRITE_INFORMATIONAL_STRING_VERSION_STRINGS => 2

    /**
     * Indicates the string containing the trademark information provided by the font.
     * @type {Integer (Int32)}
     */
    static DWRITE_INFORMATIONAL_STRING_TRADEMARK => 3

    /**
     * Indicates the string containing the name of the font manufacturer.
     * @type {Integer (Int32)}
     */
    static DWRITE_INFORMATIONAL_STRING_MANUFACTURER => 4

    /**
     * Indicates the string containing the name of the font designer.
     * @type {Integer (Int32)}
     */
    static DWRITE_INFORMATIONAL_STRING_DESIGNER => 5

    /**
     * Indicates the string containing the URL of the font designer (with protocol, e.g., http://, ftp://).
     * @type {Integer (Int32)}
     */
    static DWRITE_INFORMATIONAL_STRING_DESIGNER_URL => 6

    /**
     * Indicates the string containing the description of the font. This may also contain revision information, usage recommendations, history, features, and so on.
     * @type {Integer (Int32)}
     */
    static DWRITE_INFORMATIONAL_STRING_DESCRIPTION => 7

    /**
     * Indicates the string containing the URL of the font vendor (with protocol, e.g., http://, ftp://). If a unique serial number is embedded in the URL, it can be used to register the font.
     * @type {Integer (Int32)}
     */
    static DWRITE_INFORMATIONAL_STRING_FONT_VENDOR_URL => 8

    /**
     * Indicates the string containing the description of how the font may be legally used, or different example scenarios for licensed use.
     * @type {Integer (Int32)}
     */
    static DWRITE_INFORMATIONAL_STRING_LICENSE_DESCRIPTION => 9

    /**
     * Indicates the string containing the URL where additional licensing information can be found.
     * @type {Integer (Int32)}
     */
    static DWRITE_INFORMATIONAL_STRING_LICENSE_INFO_URL => 10

    /**
     * Indicates the string containing the GDI-compatible family name. Since GDI allows a maximum of four fonts per family, fonts in the same family may have different GDI-compatible family names (e.g., "Arial", "Arial Narrow", "Arial Black").
     * @type {Integer (Int32)}
     */
    static DWRITE_INFORMATIONAL_STRING_WIN32_FAMILY_NAMES => 11

    /**
     * Indicates the string containing a GDI-compatible subfamily name.
     * @type {Integer (Int32)}
     */
    static DWRITE_INFORMATIONAL_STRING_WIN32_SUBFAMILY_NAMES => 12

    /**
     * 
     * @type {Integer (Int32)}
     */
    static DWRITE_INFORMATIONAL_STRING_TYPOGRAPHIC_FAMILY_NAMES => 13

    /**
     * 
     * @type {Integer (Int32)}
     */
    static DWRITE_INFORMATIONAL_STRING_TYPOGRAPHIC_SUBFAMILY_NAMES => 14

    /**
     * Contains sample text for display in font lists. This can be the font name or any other text that the designer thinks is the best 
     * 
     * example to display the font in.
     * @type {Integer (Int32)}
     */
    static DWRITE_INFORMATIONAL_STRING_SAMPLE_TEXT => 15

    /**
     * The full name of the font, like Arial Bold, from <i>name id 4</i> in the name table
     * @type {Integer (Int32)}
     */
    static DWRITE_INFORMATIONAL_STRING_FULL_NAME => 16

    /**
     * The postscript name of the font, like GillSans-Bold, from <i>name id 6</i> in the name table.
     * @type {Integer (Int32)}
     */
    static DWRITE_INFORMATIONAL_STRING_POSTSCRIPT_NAME => 17

    /**
     * The postscript CID findfont name, from <i>name id 20</i> in the name table
     * @type {Integer (Int32)}
     */
    static DWRITE_INFORMATIONAL_STRING_POSTSCRIPT_CID_NAME => 18

    /**
     * 
     * @type {Integer (Int32)}
     */
    static DWRITE_INFORMATIONAL_STRING_WEIGHT_STRETCH_STYLE_FAMILY_NAME => 19

    /**
     * 
     * @type {Integer (Int32)}
     */
    static DWRITE_INFORMATIONAL_STRING_DESIGN_SCRIPT_LANGUAGE_TAG => 20

    /**
     * 
     * @type {Integer (Int32)}
     */
    static DWRITE_INFORMATIONAL_STRING_SUPPORTED_SCRIPT_LANGUAGE_TAG => 21

    /**
     * Indicates the string containing the family name preferred by the designer. This enables font designers to group more than four fonts in a single family without losing compatibility with GDI. This name is typically only present if it differs from the GDI-compatible family name.
     * @type {Integer (Int32)}
     */
    static DWRITE_INFORMATIONAL_STRING_PREFERRED_FAMILY_NAMES => 13

    /**
     * Indicates the string containing the subfamily name preferred by the designer. This name is typically only present if it differs from the GDI-compatible subfamily name.
     * @type {Integer (Int32)}
     */
    static DWRITE_INFORMATIONAL_STRING_PREFERRED_SUBFAMILY_NAMES => 14

    /**
     * 
     * @type {Integer (Int32)}
     */
    static DWRITE_INFORMATIONAL_STRING_WWS_FAMILY_NAME => 19
}
