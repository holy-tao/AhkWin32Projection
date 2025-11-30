#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the type of SVG string attribute to set or get.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1svg/ne-d2d1svg-d2d1_svg_attribute_string_type
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_SVG_ATTRIBUTE_STRING_TYPE extends Win32Enum{

    /**
     * The attribute is a string in the same form as it would appear in the SVG XML.
     *           Note that when getting values of this type, the value returned may not exactly match the value that was set. Instead, the output value is a normalized version
     *           of the value. For example, an input color of 'red' may be output as '#FF0000'.
     * @type {Integer (Int32)}
     */
    static D2D1_SVG_ATTRIBUTE_STRING_TYPE_SVG => 0

    /**
     * The attribute is an element ID.
     * @type {Integer (Int32)}
     */
    static D2D1_SVG_ATTRIBUTE_STRING_TYPE_ID => 1
}
