#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify how font families are grouped together.
 * @remarks
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/ne-dwrite_3-dwrite_font_family_model
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_FONT_FAMILY_MODEL extends Win32Enum{

    /**
     * Families are grouped by the typographic family name preferred by the font author. The family can contain as many faces as the font author wants. This corresponds to <a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/ne-dwrite_3-dwrite_font_property_id">DWRITE_FONT_PROPERTY_ID_TYPOGRAPHIC_FAMILY_NAME</a>.
     * @type {Integer (Int32)}
     */
    static DWRITE_FONT_FAMILY_MODEL_TYPOGRAPHIC => 0

    /**
     * Families are grouped by the weight-stretch-style family name, where all faces that differ only by those three axes are grouped into the same family, but any other axes go into a distinct family. For example, the Sitka family with six different optical sizes yields six separate families (Sitka Caption, Display, Text, Subheading, Heading, Banner...). This corresponds to <a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/ne-dwrite_3-dwrite_font_property_id">DWRITE_FONT_PROPERTY_ID_WEIGHT_STRETCH_STYLE_FAMILY_NAME</a>.
     * @type {Integer (Int32)}
     */
    static DWRITE_FONT_FAMILY_MODEL_WEIGHT_STRETCH_STYLE => 1
}
