#Requires AutoHotkey v2.0.0 64-bit

/**
 * Identifiers for properties of the Morphology effect.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effects/ne-d2d1effects-d2d1_morphology_prop
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_MORPHOLOGY_PROP{

    /**
     * The morphology mode.
 *             
 * 
 * The type is D2D1_MORPHOLOGY_MODE.
 * 
 * The default value is D2D1_MORPHOLOGY_MODE_ERODE.
     * @type {Integer (Int32)}
     */
    static D2D1_MORPHOLOGY_PROP_MODE => 0

    /**
     * Size of the kernel in the X direction. The units are in DIPs. Values must be between 1 and 100 inclusive.
 *             
 * 
 * The type is UINT.
 * 
 * The default value is 1.
     * @type {Integer (Int32)}
     */
    static D2D1_MORPHOLOGY_PROP_WIDTH => 1

    /**
     * Size of the kernel in the Y direction. The units are in DIPs. Values must be between 1 and 100 inclusive.
 *             
 * 
 * The type is UINT.
 * 
 * The default value is 1.
     * @type {Integer (Int32)}
     */
    static D2D1_MORPHOLOGY_PROP_HEIGHT => 2
}
