#Requires AutoHotkey v2.0.0 64-bit

/**
 * RGB or alpha blending operation.
 * @remarks
 * 
  * The runtime implements RGB blending and alpha blending separately. Therefore, blend state requires separate blend operations for RGB data and alpha data. These blend operations are specified in a <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_blend_desc">blend description</a>. The two sources — source 1 and source 2 — are shown in the <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d10-graphics-programming-guide-output-merger-stage">blending block diagram</a>.
  * 
  * Blend state is used by the <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d10-graphics-programming-guide-output-merger-stage">output-merger stage</a> to determine how to blend together two RGB pixel values and two alpha values. The two RGB pixel values and two alpha values are the RGB pixel value and alpha value that the pixel shader outputs and the RGB pixel value and alpha value already in the output render target. The <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_blend">blend option</a> controls the data source that the blending stage uses to modulate values for the pixel shader, render target, or both. The <b>blend operation</b> controls how the blending stage mathematically combines these modulated values.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d10/ne-d3d10-d3d10_blend_op
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class D3D10_BLEND_OP{

    /**
     * Add source 1 and source 2.
     * @type {Integer (Int32)}
     */
    static D3D10_BLEND_OP_ADD => 1

    /**
     * Subtract source 1 from source 2.
     * @type {Integer (Int32)}
     */
    static D3D10_BLEND_OP_SUBTRACT => 2

    /**
     * Subtract source 2 from source 1.
     * @type {Integer (Int32)}
     */
    static D3D10_BLEND_OP_REV_SUBTRACT => 3

    /**
     * Find the minimum of source 1 and source 2.
     * @type {Integer (Int32)}
     */
    static D3D10_BLEND_OP_MIN => 4

    /**
     * Find the maximum of source 1 and source 2.
     * @type {Integer (Int32)}
     */
    static D3D10_BLEND_OP_MAX => 5
}
