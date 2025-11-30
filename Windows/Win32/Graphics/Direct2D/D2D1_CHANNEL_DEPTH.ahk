#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Allows a caller to control the channel depth of a stage in the rendering pipeline.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1effectauthor/ne-d2d1effectauthor-d2d1_channel_depth
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_CHANNEL_DEPTH extends Win32Enum{

    /**
     * The channel depth is the default. It is inherited from the inputs.
     * @type {Integer (Int32)}
     */
    static D2D1_CHANNEL_DEPTH_DEFAULT => 0

    /**
     * The channel depth is 1.
     * @type {Integer (Int32)}
     */
    static D2D1_CHANNEL_DEPTH_1 => 1

    /**
     * The channel depth is 4.
     * @type {Integer (Int32)}
     */
    static D2D1_CHANNEL_DEPTH_4 => 4
}
