#Requires AutoHotkey v2.0.0 64-bit

/**
 * Identifiers for properties of the Posterize effect.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effects_2/ne-d2d1effects_2-d2d1_posterize_prop
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_POSTERIZE_PROP{

    /**
     * The D2D1_POSTERIZE_PROP_RED_VALUE_COUNT property is an integer value specifying how many evenly spaced steps to divide the red channel range of 0.0 to 1.0 into.  
 *           For example, a value of 4 generates a table with 4 steps, [0.0, 0.33, 0.67, 1.0].  The allowed range for this property is 2 to 16.  The default value is 4.
     * @type {Integer (Int32)}
     */
    static D2D1_POSTERIZE_PROP_RED_VALUE_COUNT => 0

    /**
     * The D2D1_POSTERIZE_PROP_GREEN_VALUE_COUNT property is an integer value specifying how many evenly spaced steps to divide the green channel range of 0.0 to 1.0 into.  
 *           For example, a value of 4 generates a table with 4 steps, [0.0, 0.33, 0.67, 1.0].  The allowed range for this property is 2 to 16.  The default value is 4.
     * @type {Integer (Int32)}
     */
    static D2D1_POSTERIZE_PROP_GREEN_VALUE_COUNT => 1

    /**
     * The D2D1_POSTERIZE_PROP_BLUE_VALUE_COUNT property is an integer value specifying how many evenly spaced steps to divide the blue channel range of 0.0 to 1.0 into.  
 *           For example, a value of 4 generates a table with 4 steps, [0.0, 0.33, 0.67, 1.0].  The allowed range for this property is 2 to 16.  The default value is 4.
     * @type {Integer (Int32)}
     */
    static D2D1_POSTERIZE_PROP_BLUE_VALUE_COUNT => 2
}
