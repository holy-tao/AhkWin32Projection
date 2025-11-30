#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/windows.graphics.effects.interop/ne-windows-graphics-effects-interop-graphics_effect_property_mapping
 * @namespace Windows.Win32.System.WinRT.Graphics.Direct2D
 * @version v4.0.30319
 */
class GRAPHICS_EFFECT_PROPERTY_MAPPING extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static GRAPHICS_EFFECT_PROPERTY_MAPPING_UNKNOWN => 0

    /**
     * @type {Integer (Int32)}
     */
    static GRAPHICS_EFFECT_PROPERTY_MAPPING_DIRECT => 1

    /**
     * @type {Integer (Int32)}
     */
    static GRAPHICS_EFFECT_PROPERTY_MAPPING_VECTORX => 2

    /**
     * @type {Integer (Int32)}
     */
    static GRAPHICS_EFFECT_PROPERTY_MAPPING_VECTORY => 3

    /**
     * @type {Integer (Int32)}
     */
    static GRAPHICS_EFFECT_PROPERTY_MAPPING_VECTORZ => 4

    /**
     * @type {Integer (Int32)}
     */
    static GRAPHICS_EFFECT_PROPERTY_MAPPING_VECTORW => 5

    /**
     * @type {Integer (Int32)}
     */
    static GRAPHICS_EFFECT_PROPERTY_MAPPING_RECT_TO_VECTOR4 => 6

    /**
     * @type {Integer (Int32)}
     */
    static GRAPHICS_EFFECT_PROPERTY_MAPPING_RADIANS_TO_DEGREES => 7

    /**
     * @type {Integer (Int32)}
     */
    static GRAPHICS_EFFECT_PROPERTY_MAPPING_COLORMATRIX_ALPHA_MODE => 8

    /**
     * @type {Integer (Int32)}
     */
    static GRAPHICS_EFFECT_PROPERTY_MAPPING_COLOR_TO_VECTOR3 => 9

    /**
     * @type {Integer (Int32)}
     */
    static GRAPHICS_EFFECT_PROPERTY_MAPPING_COLOR_TO_VECTOR4 => 10
}
