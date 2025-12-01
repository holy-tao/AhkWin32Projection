#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * Indicates how a strongly-typed effect property maps to an underlying Direct2D effect property.
 * @see https://learn.microsoft.com/windows/win32/api/windows.graphics.effects.interop/ne-windows-graphics-effects-interop-graphics_effect_property_mapping
 * @namespace Windows.Win32.System.WinRT.Graphics.Direct2D
 * @version v4.0.30319
 */
class GRAPHICS_EFFECT_PROPERTY_MAPPING extends Win32Enum{

    /**
     * Specifies that the value cannot be mapped to a Direct2D effect property.
     * @type {Integer (Int32)}
     */
    static GRAPHICS_EFFECT_PROPERTY_MAPPING_UNKNOWN => 0

    /**
     * Specifies that the value can be set as-is on the Direct2D effect property.
     * @type {Integer (Int32)}
     */
    static GRAPHICS_EFFECT_PROPERTY_MAPPING_DIRECT => 1

    /**
     * Specifies that the value maps to the X component of a vector-typed Direct2D effect property.
     * @type {Integer (Int32)}
     */
    static GRAPHICS_EFFECT_PROPERTY_MAPPING_VECTORX => 2

    /**
     * Specifies that the value maps to the Y component of a vector-typed Direct2D effect property.
     * @type {Integer (Int32)}
     */
    static GRAPHICS_EFFECT_PROPERTY_MAPPING_VECTORY => 3

    /**
     * Specifies that the value maps to the Z component of a vector-typed Direct2D effect property.
     * @type {Integer (Int32)}
     */
    static GRAPHICS_EFFECT_PROPERTY_MAPPING_VECTORZ => 4

    /**
     * Specifies that the value maps to the W component of a vector-typed Direct2D effect property.
     * @type {Integer (Int32)}
     */
    static GRAPHICS_EFFECT_PROPERTY_MAPPING_VECTORW => 5

    /**
     * Specifies that a rect value maps to a Vector4 Direct2D effect property.
     * @type {Integer (Int32)}
     */
    static GRAPHICS_EFFECT_PROPERTY_MAPPING_RECT_TO_VECTOR4 => 6

    /**
     * Specifies that the value needs to be converted from radians to degrees before being set on the Direct2D effect property.
     * @type {Integer (Int32)}
     */
    static GRAPHICS_EFFECT_PROPERTY_MAPPING_RADIANS_TO_DEGREES => 7

    /**
     * Specifies a color matrix alpha mode enum value needs to be converted to the equivalent Direct2D enum value before being set on the effect property.
     * @type {Integer (Int32)}
     */
    static GRAPHICS_EFFECT_PROPERTY_MAPPING_COLORMATRIX_ALPHA_MODE => 8

    /**
     * Specifies that a Windows.UI.Color value needs to be converted to an RGB Vector3 before being set on the Direct2D effect property.
     * @type {Integer (Int32)}
     */
    static GRAPHICS_EFFECT_PROPERTY_MAPPING_COLOR_TO_VECTOR3 => 9

    /**
     * Specifies that a Windows.UI.Color value needs to be converted to an RGBA Vector4 before being set on the Direct2D effect property.
     * @type {Integer (Int32)}
     */
    static GRAPHICS_EFFECT_PROPERTY_MAPPING_COLOR_TO_VECTOR4 => 10
}
