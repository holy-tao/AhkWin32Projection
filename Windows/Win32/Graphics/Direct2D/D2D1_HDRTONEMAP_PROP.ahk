#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that identify the top level properties of the HDR Tone Map effect.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effects_2/ne-d2d1effects_2-d2d1_hdrtonemap_prop
 * @namespace Windows.Win32.Graphics.Direct2D
 */
class D2D1_HDRTONEMAP_PROP extends Win32Enum {

    /**
     * Identifies the `InputMaxLuminance` property of the effect. The property is of type FLOAT, and is specified in nits.
     * Native name: D2D1_HDRTONEMAP_PROP_INPUT_MAX_LUMINANCE
     * @type {Integer (Int32)}
     */
    static INPUT_MAX_LUMINANCE => 0

    /**
     * Identifies the `OutputMaxLuminance` property of the effect. The property is of type FLOAT, and is specified in nits.
     * Native name: D2D1_HDRTONEMAP_PROP_OUTPUT_MAX_LUMINANCE
     * @type {Integer (Int32)}
     */
    static OUTPUT_MAX_LUMINANCE => 1

    /**
     * Identifies the `DisplayMode` property of the effect. The property is of type <a href="https://docs.microsoft.com/windows/desktop/api/d2d1effects_2/ne-d2d1effects_2-d2d1_hdrtonemap_display_mode"><strong>D2D1_HDRTONEMAP_DISPLAY_MODE</strong></a>.
     * Native name: D2D1_HDRTONEMAP_PROP_DISPLAY_MODE
     * @type {Integer (Int32)}
     */
    static DISPLAY_MODE => 2
}
