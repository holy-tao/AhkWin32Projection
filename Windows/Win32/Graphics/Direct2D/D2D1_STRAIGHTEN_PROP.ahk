#Requires AutoHotkey v2.0.0 64-bit

/**
 * Identifiers for properties of the Straighten effect.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1effects_2/ne-d2d1effects_2-d2d1_straighten_prop
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_STRAIGHTEN_PROP{

    /**
     * The D2D1_STRAIGHTEN_PROP_ANGLE property is a float value that specifies how much the image should be rotated.  The allowed range is -45.0 to 45.0.  The default value is 0.0.
     * @type {Integer (Int32)}
     */
    static D2D1_STRAIGHTEN_PROP_ANGLE => 0

    /**
     * The D2D1_STRAIGHTEN_PROP_MAINTAIN_SIZE property is a boolean value that specifies whether the image will be scaled such that the original size is maintained without any invalid regions.
     *           The default value is True.
     * @type {Integer (Int32)}
     */
    static D2D1_STRAIGHTEN_PROP_MAINTAIN_SIZE => 1

    /**
     * The D2D1_STRAIGHTEN_PROP_SCALE_MODE property is a <a href="https://docs.microsoft.com/windows/desktop/api/d2d1effects_2/ne-d2d1effects_2-d2d1_straighten_scale_mode">D2D1_STRAIGHTEN_SCALE_MODE</a> enumeration value indicating the scaling mode that should be used.
     * @type {Integer (Int32)}
     */
    static D2D1_STRAIGHTEN_PROP_SCALE_MODE => 2
}
