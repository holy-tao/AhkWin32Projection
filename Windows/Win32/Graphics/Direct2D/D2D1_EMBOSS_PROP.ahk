#Requires AutoHotkey v2.0.0 64-bit

/**
 * Identifiers for properties of the Emboss effect.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effects_2/ne-d2d1effects_2-d2d1_emboss_prop
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_EMBOSS_PROP{

    /**
     * The D2D1_EMBOSS_PROP_HEIGHT property is a float value controlling the strength of the embossing effect.  The allowed range is 0.0 to 10.0.  The default value is 1.0.
     * @type {Integer (Int32)}
     */
    static D2D1_EMBOSS_PROP_HEIGHT => 0

    /**
     * The D2D1_EMBOSS_PROP_DIRECTION property is a float value specifying the light direction used to create the effect. The allowed range is 0.0 to 360.0.  The default value is 0.0.
     * @type {Integer (Int32)}
     */
    static D2D1_EMBOSS_PROP_DIRECTION => 1
}
