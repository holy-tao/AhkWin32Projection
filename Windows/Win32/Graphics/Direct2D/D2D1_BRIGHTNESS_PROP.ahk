#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Identifiers for the properties of the Brightness effect.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effects/ne-d2d1effects-d2d1_brightness_prop
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_BRIGHTNESS_PROP extends Win32Enum{

    /**
     * The upper portion of the brightness transfer curve. The white point adjusts the appearance of the brighter portions of the image. 
     *           This property is for both the x value and the y value, in that order. Each of the values of this property are between 0 and 1, inclusive.
     *           
     * 
     * The type is <a href="https://docs.microsoft.com/windows/desktop/api/dcommon/ns-dcommon-d2d_vector_2f">D2D1_VECTOR_2F</a>.
     * 
     * The default value is (1.0f, 1.0f).
     * @type {Integer (Int32)}
     */
    static D2D1_BRIGHTNESS_PROP_WHITE_POINT => 0

    /**
     * The lower portion of the brightness transfer curve. The black point adjusts the appearance of the darker portions of the image. 
     *           This property is for both the x value and the y value, in that order. Each of the values of this property are between 0 and 1, inclusive.
     *           
     * 
     * The type is <a href="https://docs.microsoft.com/windows/desktop/api/dcommon/ns-dcommon-d2d_vector_2f">D2D1_VECTOR_2F</a>.
     * 
     * The default value is (0.0f, 0.0f).
     * @type {Integer (Int32)}
     */
    static D2D1_BRIGHTNESS_PROP_BLACK_POINT => 1
}
