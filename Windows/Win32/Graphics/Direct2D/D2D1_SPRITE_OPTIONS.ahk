#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies additional aspects of how a sprite batch is to be drawn, as part of a call to ID2D1DeviceContext3::DrawSpriteBatch.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/ne-d2d1_3-d2d1_sprite_options
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_SPRITE_OPTIONS extends Win32BitflagEnum{

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
