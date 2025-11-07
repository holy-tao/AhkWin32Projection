#Requires AutoHotkey v2.0.0 64-bit

/**
 * Identifiers for properties of the Flood effect.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1effects/ne-d2d1effects-d2d1_flood_prop
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_FLOOD_PROP{

    /**
     * The color and opacity of the bitmap. This property is a D2D1_VECTOR_4F. The individual values for each channel are of type FLOAT, unbounded and unitless.
     *             The effect doesn't modify the values for the channels.
     *             
     * 
     * The RGBA values for each channel range from 0 to 1.
     * 
     * The type is <a href="https://docs.microsoft.com/windows/desktop/api/dcommon/ns-dcommon-d2d_vector_4f">D2D1_VECTOR_4F</a>.
     * 
     * The default value is {0.0f, 0.0f, 0.0f, 1.0f}.
     * @type {Integer (Int32)}
     */
    static D2D1_FLOOD_PROP_COLOR => 0
}
