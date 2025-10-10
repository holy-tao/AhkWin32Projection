#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines constants that identify the top level properties of the HDR Tone Map effect.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1effects_2/ne-d2d1effects_2-d2d1_hdrtonemap_prop
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_HDRTONEMAP_PROP{

    /**
     * Identifies the `InputMaxLuminance` property of the effect. The property is of type FLOAT, and is specified in nits.
     * @type {Integer (Int32)}
     */
    static D2D1_HDRTONEMAP_PROP_INPUT_MAX_LUMINANCE => 0

    /**
     * Identifies the `OutputMaxLuminance` property of the effect. The property is of type FLOAT, and is specified in nits.
     * @type {Integer (Int32)}
     */
    static D2D1_HDRTONEMAP_PROP_OUTPUT_MAX_LUMINANCE => 1

    /**
     * Identifies the `DisplayMode` property of the effect. The property is of type <a href="https://docs.microsoft.com/windows/desktop/api/d2d1effects_2/ne-d2d1effects_2-d2d1_hdrtonemap_display_mode"><strong>D2D1_HDRTONEMAP_DISPLAY_MODE</strong></a>.
     * @type {Integer (Int32)}
     */
    static D2D1_HDRTONEMAP_PROP_DISPLAY_MODE => 2
}
