#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * D3DCOLORVALUE structure (Dxgitype.h) - Represents a color value with alpha, which is used for transparency.
 * @remarks
 * You can set the members of this structure to values outside the range of 0 through 1 to implement some unusual effects. Values greater than 1 produce strong lights that tend to wash out a scene. Negative values produce dark lights that actually remove light from a scene.
 * 
 * The DXGItype.h header type-defines [**DXGI\_RGBA**](dxgi-rgba.md) as an alias of **D3DCOLORVALUE**, as follows:
 * 
 * 
 * ```
 * typedef D3DCOLORVALUE DXGI_RGBA;
 * ```
 * 
 * 
 * 
 * You can use D3DCOLORVALUE or [**DXGI\_RGBA**](dxgi-rgba.md) with [**IDXGISwapChain1::SetBackgroundColor**](/windows/desktop/api/DXGI1_2/nf-dxgi1_2-idxgiswapchain1-setbackgroundcolor), [**IDXGISwapChain1::GetBackgroundColor**](/windows/desktop/api/DXGI1_2/nf-dxgi1_2-idxgiswapchain1-getbackgroundcolor), and [**DXGI\_ALPHA\_MODE**](/windows/desktop/api/DXGI1_2/ne-dxgi1_2-dxgi_alpha_mode).
 * @see https://learn.microsoft.com/windows/win32/direct3ddxgi/d3dcolorvalue
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DCOLORVALUE {
    #StructPack 4

    /**
     * Floating-point value that specifies the red component of a color. This value generally is in the range from 0.0 through 1.0. A value of 0.0 indicates the complete absence of the red component, while a value of 1.0 indicates that red is fully present.
     */
    r : Float32

    /**
     * Floating-point value that specifies the green component of a color. This value generally is in the range from 0.0 through 1.0. A value of 0.0 indicates the complete absence of the green component, while a value of 1.0 indicates that green is fully present.
     */
    g : Float32

    /**
     * Floating-point value that specifies the blue component of a color. This value generally is in the range from 0.0 through 1.0. A value of 0.0 indicates the complete absence of the blue component, while a value of 1.0 indicates that blue is fully present.
     */
    b : Float32

    /**
     * Floating-point value that specifies the alpha component of a color. This value generally is in the range from 0.0 through 1.0. A value of 0.0 indicates fully transparent, while a value of 1.0 indicates fully opaque.
     */
    a : Float32

}
