#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies RGB or alpha blending operations.
 * @remarks
 * The runtime implements RGB blending and alpha blending separately. Therefore, blend state requires separate blend operations for RGB data and alpha data. These blend operations are specified in a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_render_target_blend_desc">D3D12_RENDER_TARGET_BLEND_DESC</a> structure. The two sources —source 1 and source 2— are shown in the <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d10-graphics-programming-guide-output-merger-stage">blending block diagram</a>.
 * 
 * Blend state is used by the <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d10-graphics-programming-guide-output-merger-stage">output-merger stage</a> to determine how to blend together two RGB pixel values and two alpha values. The two RGB pixel values and two alpha values are the RGB pixel value and alpha value that the pixel shader outputs and the RGB pixel value and alpha value already in the output render target. The <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_blend">D3D12_BLEND</a> value controls the data source that the blending stage uses to modulate values for the pixel shader, render target, or both. The <b>D3D12_BLEND_OP</b> value controls how the blending stage mathematically combines these modulated values.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_blend_op
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_BLEND_OP extends Win32Enum{

    /**
     * Add source 1 and source 2.
     * @type {Integer (Int32)}
     */
    static D3D12_BLEND_OP_ADD => 1

    /**
     * Subtract source 1 from source 2.
     * @type {Integer (Int32)}
     */
    static D3D12_BLEND_OP_SUBTRACT => 2

    /**
     * Subtract source 2 from source 1.
     * @type {Integer (Int32)}
     */
    static D3D12_BLEND_OP_REV_SUBTRACT => 3

    /**
     * Find the minimum of source 1 and source 2.
     * @type {Integer (Int32)}
     */
    static D3D12_BLEND_OP_MIN => 4

    /**
     * Find the maximum of source 1 and source 2.
     * @type {Integer (Int32)}
     */
    static D3D12_BLEND_OP_MAX => 5
}
