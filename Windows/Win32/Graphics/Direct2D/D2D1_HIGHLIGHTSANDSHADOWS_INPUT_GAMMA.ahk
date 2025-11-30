#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Values for the D2D1_HIGHLIGHTSANDSHADOWS_PROP_INPUT_GAMMA property of the Highlights and Shadows effect.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1effects_2/ne-d2d1effects_2-d2d1_highlightsandshadows_input_gamma
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_HIGHLIGHTSANDSHADOWS_INPUT_GAMMA extends Win32Enum{

    /**
     * Indicates the input image is in linear gamma space.
     * @type {Integer (Int32)}
     */
    static D2D1_HIGHLIGHTSANDSHADOWS_INPUT_GAMMA_LINEAR => 0

    /**
     * Indicates the input image is sRGB gamma space.
     * @type {Integer (Int32)}
     */
    static D2D1_HIGHLIGHTSANDSHADOWS_INPUT_GAMMA_SRGB => 1
}
