#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Allows a caller to control the channel depth of a stage in the rendering pipeline.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/ne-d2d1effectauthor-d2d1_channel_depth
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_CHANNEL_DEPTH {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
