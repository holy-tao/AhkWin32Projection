#Requires AutoHotkey v2.0.0 64-bit

/**
 * Identifiers for properties of the Temperature and Tint effect.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effects_2/ne-d2d1effects_2-d2d1_temperatureandtint_prop
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_TEMPERATUREANDTINT_PROP{

    /**
     * The D2D1_TEMPERATUREANDTINT_PROP_TEMPERATURE property is a float value specifying how much to increase or decrease the temperature of the input image.  The allowed range is -1.0 to 1.0. The default value is 0.0.
     * @type {Integer (Int32)}
     */
    static D2D1_TEMPERATUREANDTINT_PROP_TEMPERATURE => 0

    /**
     * The D2D1_TEMPERATUREANDTINT_PROP_TINT property is a float value specifying how much to increase or decrease the tint of the input image.  The allowed range is -1.0 to 1.0.  The default value is 0.0.
     * @type {Integer (Int32)}
     */
    static D2D1_TEMPERATUREANDTINT_PROP_TINT => 1
}
