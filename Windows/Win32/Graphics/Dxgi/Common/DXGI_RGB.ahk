#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * DXGI_RGBA structure - Represents a color value with alpha, which is used for transparency.
 * @remarks
 * You can set the members of this structure to values outside the range of 0 through 1 to implement some unusual effects. Values greater than 1 produce strong lights that tend to wash out a scene. Negative values produce dark lights that actually remove light from a scene.
 * 
 * The DXGItype.h header type-defines **DXGI\_RGBA** as an alias of [**D3DCOLORVALUE**](d3dcolorvalue.md), as follows:
 * 
 * 
 * ```
 * typedef D3DCOLORVALUE DXGI_RGBA;
 * ```
 * 
 * 
 * 
 * You can use **DXGI\_RGBA** with [**IDXGISwapChain1::SetBackgroundColor**](/windows/desktop/api/DXGI1_2/nf-dxgi1_2-idxgiswapchain1-setbackgroundcolor), [**IDXGISwapChain1::GetBackgroundColor**](/windows/desktop/api/DXGI1_2/nf-dxgi1_2-idxgiswapchain1-getbackgroundcolor), and [**DXGI\_ALPHA\_MODE**](/windows/desktop/api/DXGI1_2/ne-dxgi1_2-dxgi_alpha_mode).
 * @see https://learn.microsoft.com/windows/win32/ktop-src/direct3ddxgi/dxgi-rgba
 * @namespace Windows.Win32.Graphics.Dxgi.Common
 * @version v4.0.30319
 */
class DXGI_RGB extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * @type {Float}
     */
    Red {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * @type {Float}
     */
    Green {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }

    /**
     * @type {Float}
     */
    Blue {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }
}
