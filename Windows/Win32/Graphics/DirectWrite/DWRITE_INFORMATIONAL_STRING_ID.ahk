#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The informational string enumeration which identifies a string embedded in a font file.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_informational_string_id
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
class DWRITE_INFORMATIONAL_STRING_ID extends Win32Enum {

    /**
     * Indicates the string containing the unspecified name ID.
     * Native name: DWRITE_INFORMATIONAL_STRING_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Indicates the string containing the copyright notice provided by the font.
     * Native name: DWRITE_INFORMATIONAL_STRING_COPYRIGHT_NOTICE
     * @type {Integer (Int32)}
     */
    static COPYRIGHT_NOTICE => 1

    /**
     * Indicates the string containing a version number.
     * Native name: DWRITE_INFORMATIONAL_STRING_VERSION_STRINGS
     * @type {Integer (Int32)}
     */
    static VERSION_STRINGS => 2

    /**
     * Indicates the string containing the trademark information provided by the font.
     * Native name: DWRITE_INFORMATIONAL_STRING_TRADEMARK
     * @type {Integer (Int32)}
     */
    static TRADEMARK => 3

    /**
     * Indicates the string containing the name of the font manufacturer.
     * Native name: DWRITE_INFORMATIONAL_STRING_MANUFACTURER
     * @type {Integer (Int32)}
     */
    static MANUFACTURER => 4

    /**
     * Indicates the string containing the name of the font designer.
     * Native name: DWRITE_INFORMATIONAL_STRING_DESIGNER
     * @type {Integer (Int32)}
     */
    static DESIGNER => 5

    /**
     * Indicates the string containing the URL of the font designer (with protocol, e.g., http://, ftp://).
     * Native name: DWRITE_INFORMATIONAL_STRING_DESIGNER_URL
     * @type {Integer (Int32)}
     */
    static DESIGNER_URL => 6

    /**
     * Indicates the string containing the description of the font. This may also contain revision information, usage recommendations, history, features, and so on.
     * Native name: DWRITE_INFORMATIONAL_STRING_DESCRIPTION
     * @type {Integer (Int32)}
     */
    static DESCRIPTION => 7

    /**
     * Indicates the string containing the URL of the font vendor (with protocol, e.g., http://, ftp://). If a unique serial number is embedded in the URL, it can be used to register the font.
     * Native name: DWRITE_INFORMATIONAL_STRING_FONT_VENDOR_URL
     * @type {Integer (Int32)}
     */
    static FONT_VENDOR_URL => 8

    /**
     * Indicates the string containing the description of how the font may be legally used, or different example scenarios for licensed use.
     * Native name: DWRITE_INFORMATIONAL_STRING_LICENSE_DESCRIPTION
     * @type {Integer (Int32)}
     */
    static LICENSE_DESCRIPTION => 9

    /**
     * Indicates the string containing the URL where additional licensing information can be found.
     * Native name: DWRITE_INFORMATIONAL_STRING_LICENSE_INFO_URL
     * @type {Integer (Int32)}
     */
    static LICENSE_INFO_URL => 10

    /**
     * Indicates the string containing the GDI-compatible family name. Since GDI allows a maximum of four fonts per family, fonts in the same family may have different GDI-compatible family names (e.g., "Arial", "Arial Narrow", "Arial Black").
     * Native name: DWRITE_INFORMATIONAL_STRING_WIN32_FAMILY_NAMES
     * @type {Integer (Int32)}
     */
    static WIN32_FAMILY_NAMES => 11

    /**
     * Indicates the string containing a GDI-compatible subfamily name.
     * Native name: DWRITE_INFORMATIONAL_STRING_WIN32_SUBFAMILY_NAMES
     * @type {Integer (Int32)}
     */
    static WIN32_SUBFAMILY_NAMES => 12

    /**
     * Native name: DWRITE_INFORMATIONAL_STRING_TYPOGRAPHIC_FAMILY_NAMES
     * @type {Integer (Int32)}
     */
    static TYPOGRAPHIC_FAMILY_NAMES => 13

    /**
     * Native name: DWRITE_INFORMATIONAL_STRING_TYPOGRAPHIC_SUBFAMILY_NAMES
     * @type {Integer (Int32)}
     */
    static TYPOGRAPHIC_SUBFAMILY_NAMES => 14

    /**
     * Contains sample text for display in font lists. This can be the font name or any other text that the designer thinks is the best 
     * 
     * example to display the font in.
     * Native name: DWRITE_INFORMATIONAL_STRING_SAMPLE_TEXT
     * @type {Integer (Int32)}
     */
    static SAMPLE_TEXT => 15

    /**
     * The full name of the font, like Arial Bold, from <i>name id 4</i> in the name table
     * Native name: DWRITE_INFORMATIONAL_STRING_FULL_NAME
     * @type {Integer (Int32)}
     */
    static FULL_NAME => 16

    /**
     * The postscript name of the font, like GillSans-Bold, from <i>name id 6</i> in the name table.
     * Native name: DWRITE_INFORMATIONAL_STRING_POSTSCRIPT_NAME
     * @type {Integer (Int32)}
     */
    static POSTSCRIPT_NAME => 17

    /**
     * The postscript CID findfont name, from <i>name id 20</i> in the name table
     * Native name: DWRITE_INFORMATIONAL_STRING_POSTSCRIPT_CID_NAME
     * @type {Integer (Int32)}
     */
    static POSTSCRIPT_CID_NAME => 18

    /**
     * Native name: DWRITE_INFORMATIONAL_STRING_WEIGHT_STRETCH_STYLE_FAMILY_NAME
     * @type {Integer (Int32)}
     */
    static WEIGHT_STRETCH_STYLE_FAMILY_NAME => 19

    /**
     * Native name: DWRITE_INFORMATIONAL_STRING_DESIGN_SCRIPT_LANGUAGE_TAG
     * @type {Integer (Int32)}
     */
    static DESIGN_SCRIPT_LANGUAGE_TAG => 20

    /**
     * Native name: DWRITE_INFORMATIONAL_STRING_SUPPORTED_SCRIPT_LANGUAGE_TAG
     * @type {Integer (Int32)}
     */
    static SUPPORTED_SCRIPT_LANGUAGE_TAG => 21

    /**
     * Indicates the string containing the family name preferred by the designer. This enables font designers to group more than four fonts in a single family without losing compatibility with GDI. This name is typically only present if it differs from the GDI-compatible family name.
     * Native name: DWRITE_INFORMATIONAL_STRING_PREFERRED_FAMILY_NAMES
     * @type {Integer (Int32)}
     */
    static PREFERRED_FAMILY_NAMES => 13

    /**
     * Indicates the string containing the subfamily name preferred by the designer. This name is typically only present if it differs from the GDI-compatible subfamily name.
     * Native name: DWRITE_INFORMATIONAL_STRING_PREFERRED_SUBFAMILY_NAMES
     * @type {Integer (Int32)}
     */
    static PREFERRED_SUBFAMILY_NAMES => 14

    /**
     * Native name: DWRITE_INFORMATIONAL_STRING_WWS_FAMILY_NAME
     * @type {Integer (Int32)}
     */
    static WWS_FAMILY_NAME => 19
}
