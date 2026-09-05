#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the color channel the Displacement map effectextracts the intensity from and uses it to spatially displace the image in the X or Y direction.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effects/ne-d2d1effects-d2d1_channel_selector
 * @namespace Windows.Win32.Graphics.Direct2D
 */
class D2D1_CHANNEL_SELECTOR extends Win32Enum {

    /**
     * The effect extracts the intensity output from the red channel.
     * Native name: D2D1_CHANNEL_SELECTOR_R
     * @type {Integer (Int32)}
     */
    static R => 0

    /**
     * The effect extracts the intensity output from the green channel.
     * Native name: D2D1_CHANNEL_SELECTOR_G
     * @type {Integer (Int32)}
     */
    static G => 1

    /**
     * The effect extracts the intensity output from the blue channel.
     * Native name: D2D1_CHANNEL_SELECTOR_B
     * @type {Integer (Int32)}
     */
    static B => 2

    /**
     * The effect extracts the intensity output from the alpha channel.
     * Native name: D2D1_CHANNEL_SELECTOR_A
     * @type {Integer (Int32)}
     */
    static A => 3
}
