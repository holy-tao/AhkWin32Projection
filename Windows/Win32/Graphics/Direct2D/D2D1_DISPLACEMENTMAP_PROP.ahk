#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Identifiers for properties of the Displacement map effect.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effects/ne-d2d1effects-d2d1_displacementmap_prop
 * @namespace Windows.Win32.Graphics.Direct2D
 */
class D2D1_DISPLACEMENTMAP_PROP extends Win32Enum {

    /**
     * Multiplies the intensity of the selected channel from the displacement image. The higher you set this property, the more the effect displaces the pixels.
     *             
     * 
     * The type is FLOAT.
     * 
     * The default value is 0.0f.
     * Native name: D2D1_DISPLACEMENTMAP_PROP_SCALE
     * @type {Integer (Int32)}
     */
    static SCALE => 0

    /**
     * The effect extracts the intensity from this color channel and uses it to spatially displace the image in the X direction.
     *           
     * 
     * The type is <a href="https://docs.microsoft.com/windows/desktop/api/d2d1effects/ne-d2d1effects-d2d1_channel_selector">D2D1_CHANNEL_SELECTOR</a>.
     * 
     * The default value is D2D1_CHANNEL_SELECTOR_A
     * Native name: D2D1_DISPLACEMENTMAP_PROP_X_CHANNEL_SELECT
     * @type {Integer (Int32)}
     */
    static X_CHANNEL_SELECT => 1

    /**
     * The effect extracts the intensity from this color channel and uses it to spatially displace the image in the Y direction.
     *           
     * 
     * The type is <a href="https://docs.microsoft.com/windows/desktop/api/d2d1effects/ne-d2d1effects-d2d1_channel_selector">D2D1_CHANNEL_SELECTOR</a>.
     * 
     * The default value is D2D1_CHANNEL_SELECTOR_A
     * Native name: D2D1_DISPLACEMENTMAP_PROP_Y_CHANNEL_SELECT
     * @type {Integer (Int32)}
     */
    static Y_CHANNEL_SELECT => 2
}
