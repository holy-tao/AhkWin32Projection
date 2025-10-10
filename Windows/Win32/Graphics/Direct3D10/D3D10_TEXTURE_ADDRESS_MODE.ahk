#Requires AutoHotkey v2.0.0 64-bit

/**
 * Identify a technique for resolving texture coordinates that are outside of the boundaries of a texture.
 * @see https://docs.microsoft.com/windows/win32/api//d3d10/ne-d3d10-d3d10_texture_address_mode
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class D3D10_TEXTURE_ADDRESS_MODE{

    /**
     * Tile the texture at every integer junction. For example, for u values between 0 and 3, the texture is repeated three times.
     * @type {Integer (Int32)}
     */
    static D3D10_TEXTURE_ADDRESS_WRAP => 1

    /**
     * Flip the texture at every integer junction. For u values between 0 and 1, for example, the texture is addressed normally; between 1 and 2, the texture is flipped (mirrored); between 2 and 3, the texture is normal again; and so on.
     * @type {Integer (Int32)}
     */
    static D3D10_TEXTURE_ADDRESS_MIRROR => 2

    /**
     * Texture coordinates outside the range [0.0, 1.0] are set to the texture color at 0.0 or 1.0, respectively.
     * @type {Integer (Int32)}
     */
    static D3D10_TEXTURE_ADDRESS_CLAMP => 3

    /**
     * Texture coordinates outside the range [0.0, 1.0] are set to the border color specified in <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_sampler_desc">D3D10_SAMPLER_DESC</a> or HLSL code.
     * @type {Integer (Int32)}
     */
    static D3D10_TEXTURE_ADDRESS_BORDER => 4

    /**
     * Similar to D3D10_TEXTURE_ADDRESS_MIRROR and D3D10_TEXTURE_ADDRESS_CLAMP. Takes the absolute value of the texture coordinate (thus, mirroring around 0), and then clamps to the maximum value.
     * @type {Integer (Int32)}
     */
    static D3D10_TEXTURE_ADDRESS_MIRROR_ONCE => 5
}
