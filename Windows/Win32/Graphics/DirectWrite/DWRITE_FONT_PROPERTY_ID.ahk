#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Identifies a string in a font.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/ne-dwrite_3-dwrite_font_property_id
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_FONT_PROPERTY_ID extends Win32Enum{

    /**
     * Unspecified font property identifier.
     * @type {Integer (Int32)}
     */
    static DWRITE_FONT_PROPERTY_ID_NONE => 0

    /**
     * 
     * @type {Integer (Int32)}
     */
    static DWRITE_FONT_PROPERTY_ID_WEIGHT_STRETCH_STYLE_FAMILY_NAME => 1

    /**
     * 
     * @type {Integer (Int32)}
     */
    static DWRITE_FONT_PROPERTY_ID_TYPOGRAPHIC_FAMILY_NAME => 2

    /**
     * 
     * @type {Integer (Int32)}
     */
    static DWRITE_FONT_PROPERTY_ID_WEIGHT_STRETCH_STYLE_FACE_NAME => 3

    /**
     * The full name of the font, for example "Arial Bold", from name id 4 in the name table.
     * @type {Integer (Int32)}
     */
    static DWRITE_FONT_PROPERTY_ID_FULL_NAME => 4

    /**
     * GDI-compatible family name. Because GDI allows a maximum of four fonts per family, fonts in the same family may have different GDI-compatible family names,
     *           for example "Arial", "Arial Narrow", "Arial Black".
     * @type {Integer (Int32)}
     */
    static DWRITE_FONT_PROPERTY_ID_WIN32_FAMILY_NAME => 5

    /**
     * The postscript name of the font, for example "GillSans-Bold", from name id 6 in the name table.
     * @type {Integer (Int32)}
     */
    static DWRITE_FONT_PROPERTY_ID_POSTSCRIPT_NAME => 6

    /**
     * Script/language tag to identify the scripts or languages that the font was primarily designed to support.
     * @type {Integer (Int32)}
     */
    static DWRITE_FONT_PROPERTY_ID_DESIGN_SCRIPT_LANGUAGE_TAG => 7

    /**
     * Script/language tag to identify the scripts or languages that the font declares it is able to support.
     * @type {Integer (Int32)}
     */
    static DWRITE_FONT_PROPERTY_ID_SUPPORTED_SCRIPT_LANGUAGE_TAG => 8

    /**
     * Semantic tag to describe the font, for example Fancy, Decorative, Handmade, Sans-serif, Swiss, Pixel, Futuristic.
     * @type {Integer (Int32)}
     */
    static DWRITE_FONT_PROPERTY_ID_SEMANTIC_TAG => 9

    /**
     * Weight of the font represented as a decimal string in the range 1-999.
     * @type {Integer (Int32)}
     */
    static DWRITE_FONT_PROPERTY_ID_WEIGHT => 10

    /**
     * Stretch of the font represented as a decimal string in the range 1-9.
     * @type {Integer (Int32)}
     */
    static DWRITE_FONT_PROPERTY_ID_STRETCH => 11

    /**
     * Style of the font represented as a decimal string in the range 0-2.
     * @type {Integer (Int32)}
     */
    static DWRITE_FONT_PROPERTY_ID_STYLE => 12

    /**
     * 
     * @type {Integer (Int32)}
     */
    static DWRITE_FONT_PROPERTY_ID_TYPOGRAPHIC_FACE_NAME => 13

    /**
     * Total number of properties.
     * @type {Integer (Int32)}
     */
    static DWRITE_FONT_PROPERTY_ID_TOTAL => 13

    /**
     * 
     * @type {Integer (Int32)}
     */
    static DWRITE_FONT_PROPERTY_ID_TOTAL_RS3 => 14

    /**
     * Family name preferred by the designer. This enables font designers to group more than four fonts in a single family without losing compatibility with
     *           GDI. This name is typically only present if it differs from the GDI-compatible family name.
     * @type {Integer (Int32)}
     */
    static DWRITE_FONT_PROPERTY_ID_PREFERRED_FAMILY_NAME => 2

    /**
     * Family name for the weight-width-slope model.
     * @type {Integer (Int32)}
     */
    static DWRITE_FONT_PROPERTY_ID_FAMILY_NAME => 1

    /**
     * Face name of the font, for example Regular or Bold.
     * @type {Integer (Int32)}
     */
    static DWRITE_FONT_PROPERTY_ID_FACE_NAME => 3
}
