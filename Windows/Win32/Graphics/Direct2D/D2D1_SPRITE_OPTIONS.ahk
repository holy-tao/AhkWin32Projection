#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies additional aspects of how a sprite batch is to be drawn, as part of a call to ID2D1DeviceContext3::DrawSpriteBatch.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/ne-d2d1_3-d2d1_sprite_options
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_SPRITE_OPTIONS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Default value. No special drawing configuration. This option yields the best drawing performance.
     * @type {Integer (Int32)}
     */
    static D2D1_SPRITE_OPTIONS_NONE => 0

    /**
     * Interpolation of bitmap pixels will be clamped to the sprite’s source rectangle. 
     *           If the sub-images in your source bitmap have no pixels separating them, then you may see color bleeding when drawing them with D2D1_SPRITE_OPTIONS_NONE. 
     *           In that case, consider adding borders between them with your sprite-packing tool, or use this option.
     *           Note that drawing sprites with this option enabled is slower than using D2D1_SPRITE_OPTIONS_NONE.
     * @type {Integer (Int32)}
     */
    static D2D1_SPRITE_OPTIONS_CLAMP_TO_SOURCE_RECTANGLE => 1
}
