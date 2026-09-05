#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The quality level of the transform for the Color management effect.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effects/ne-d2d1effects-d2d1_colormanagement_quality
 * @namespace Windows.Win32.Graphics.Direct2D
 */
class D2D1_COLORMANAGEMENT_QUALITY extends Win32Enum {

    /**
     * The lowest quality mode. This mode requires feature level 9_1 or above.
     * Native name: D2D1_COLORMANAGEMENT_QUALITY_PROOF
     * @type {Integer (Int32)}
     */
    static PROOF => 0

    /**
     * Normal quality mode. This mode requires feature level 9_1 or above.
     * Native name: D2D1_COLORMANAGEMENT_QUALITY_NORMAL
     * @type {Integer (Int32)}
     */
    static NORMAL => 1

    /**
     * The best quality mode. This mode requires feature level 10_0 or above, as well as floating point precision buffers. 
     *           This mode supports floating point precision as well as extended range as defined in the ICC v4.3 specification.
     * Native name: D2D1_COLORMANAGEMENT_QUALITY_BEST
     * @type {Integer (Int32)}
     */
    static BEST => 2
}
