#Requires AutoHotkey v2.0.0 64-bit

/**
 * The quality level of the transform for the Color management effect.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1effects/ne-d2d1effects-d2d1_colormanagement_quality
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_COLORMANAGEMENT_QUALITY{

    /**
     * The lowest quality mode. This mode requires feature level 9_1 or above.
     * @type {Integer (Int32)}
     */
    static D2D1_COLORMANAGEMENT_QUALITY_PROOF => 0

    /**
     * Normal quality mode. This mode requires feature level 9_1 or above.
     * @type {Integer (Int32)}
     */
    static D2D1_COLORMANAGEMENT_QUALITY_NORMAL => 1

    /**
     * The best quality mode. This mode requires feature level 10_0 or above, as well as floating point precision buffers. 
 *           This mode supports floating point precision as well as extended range as defined in the ICC v4.3 specification.
     * @type {Integer (Int32)}
     */
    static D2D1_COLORMANAGEMENT_QUALITY_BEST => 2
}
