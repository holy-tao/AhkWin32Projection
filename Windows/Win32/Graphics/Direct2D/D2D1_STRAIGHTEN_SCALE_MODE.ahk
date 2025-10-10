#Requires AutoHotkey v2.0.0 64-bit

/**
 * Values for the D2D1_STRAIGHTEN_PROP_SCALE_MODE property of the Straighten effect.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1effects_2/ne-d2d1effects_2-d2d1_straighten_scale_mode
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_STRAIGHTEN_SCALE_MODE{

    /**
     * Indicates nearest neighbor interpolation should be used.
     * @type {Integer (Int32)}
     */
    static D2D1_STRAIGHTEN_SCALE_MODE_NEAREST_NEIGHBOR => 0

    /**
     * Indicates linear interpolation should be used.
     * @type {Integer (Int32)}
     */
    static D2D1_STRAIGHTEN_SCALE_MODE_LINEAR => 1

    /**
     * Indicates cubic interpolation should be used.
     * @type {Integer (Int32)}
     */
    static D2D1_STRAIGHTEN_SCALE_MODE_CUBIC => 2

    /**
     * Indicates multi-sample linear interpolation should be used.
     * @type {Integer (Int32)}
     */
    static D2D1_STRAIGHTEN_SCALE_MODE_MULTI_SAMPLE_LINEAR => 3

    /**
     * Indicates anisotropic filtering should be used.
     * @type {Integer (Int32)}
     */
    static D2D1_STRAIGHTEN_SCALE_MODE_ANISOTROPIC => 4
}
