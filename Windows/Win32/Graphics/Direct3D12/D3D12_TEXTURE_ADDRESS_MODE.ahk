#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Identifies a technique for resolving texture coordinates that are outside of the boundaries of a texture.
 * @remarks
 * This enum is used by the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_sampler_desc">D3D12_SAMPLER_DESC</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_texture_address_mode
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_TEXTURE_ADDRESS_MODE extends Win32Enum{

    /**
     * Tile the texture at every (u,v) integer junction.
     *             For example, for u values between 0 and 3, the texture is repeated three times.
     * @type {Integer (Int32)}
     */
    static D3D12_TEXTURE_ADDRESS_MODE_WRAP => 1

    /**
     * Flip the texture at every (u,v) integer junction.
     *             For u values between 0 and 1, for example, the texture is addressed normally; between 1 and 2, the texture is flipped (mirrored); between 2 and 3, the texture is normal again; and so on.
     * @type {Integer (Int32)}
     */
    static D3D12_TEXTURE_ADDRESS_MODE_MIRROR => 2

    /**
     * Texture coordinates outside the range [0.0, 1.0] are set to the texture color at 0.0 or 1.0, respectively.
     * @type {Integer (Int32)}
     */
    static D3D12_TEXTURE_ADDRESS_MODE_CLAMP => 3

    /**
     * Texture coordinates outside the range [0.0, 1.0] are set to the border color specified in <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_sampler_desc">D3D12_SAMPLER_DESC</a> or HLSL code.
     * @type {Integer (Int32)}
     */
    static D3D12_TEXTURE_ADDRESS_MODE_BORDER => 4

    /**
     * Similar to 
     *             <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_texture_address_mode">D3D12_TEXTURE_ADDRESS_MODE_MIRROR</a> 
     *             and 
     *             <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_texture_address_mode">D3D12_TEXTURE_ADDRESS_MODE_CLAMP</a>.
     *             Takes the absolute value of the texture coordinate (thus, mirroring around 0), and then clamps to the maximum value.
     * @type {Integer (Int32)}
     */
    static D3D12_TEXTURE_ADDRESS_MODE_MIRROR_ONCE => 5
}
