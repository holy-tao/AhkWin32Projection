#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify a value for the D2D1_HDRTONEMAP_PROP_DISPLAY_MODE property of the HDR Tone Map effect.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1effects_2/ne-d2d1effects_2-d2d1_hdrtonemap_display_mode
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_HDRTONEMAP_DISPLAY_MODE extends Win32Enum{

    /**
     * Specifies that the tone mapper algorithm be optimized for best appearance on a standard dynamic range (SDR) display.
     * @type {Integer (Int32)}
     */
    static D2D1_HDRTONEMAP_DISPLAY_MODE_SDR => 0

    /**
     * Specifies that the tone mapper algorithm be optimized for best appearance on a high dynamic range (HDR) display.
     * @type {Integer (Int32)}
     */
    static D2D1_HDRTONEMAP_DISPLAY_MODE_HDR => 1
}
