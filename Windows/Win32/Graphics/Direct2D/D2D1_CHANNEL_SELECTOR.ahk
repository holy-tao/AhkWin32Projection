#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the color channel the Displacement map effectextracts the intensity from and uses it to spatially displace the image in the X or Y direction.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effects/ne-d2d1effects-d2d1_channel_selector
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_CHANNEL_SELECTOR extends Win32Enum{

    /**
     * The effect extracts the intensity output from the red channel.
     * @type {Integer (Int32)}
     */
    static D2D1_CHANNEL_SELECTOR_R => 0

    /**
     * The effect extracts the intensity output from the green channel.
     * @type {Integer (Int32)}
     */
    static D2D1_CHANNEL_SELECTOR_G => 1

    /**
     * The effect extracts the intensity output from the blue channel.
     * @type {Integer (Int32)}
     */
    static D2D1_CHANNEL_SELECTOR_B => 2

    /**
     * The effect extracts the intensity output from the alpha channel.
     * @type {Integer (Int32)}
     */
    static D2D1_CHANNEL_SELECTOR_A => 3
}
