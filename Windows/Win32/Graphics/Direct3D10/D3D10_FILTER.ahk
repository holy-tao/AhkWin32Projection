#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Filtering options during texture sampling.
 * @remarks
 * 
 * During texture sampling, one or more texels are read and combined (this is calling filtering) to produce a single value. Point sampling reads a single texel while linear sampling reads two texels (endpoints) and linearly interpolates a third value between the endpoints.
 * 
 * HLSL texture-sampling functions also support comparison filtering during texture sampling. Comparison filtering compares each sampled texel against a comparison value. The boolean result is blended the same way that normal texture filtering is blended.
 * 
 * You can use HLSL intrinsic texture-sampling functions that implement texture filtering only or companion functions that use texture filtering with comparison filtering.
 * 
 * <table>
 * <tr>
 * <th>Texture Sampling Function</th>
 * <th>Texture Sampling Function with Comparison Filtering</th>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dx-graphics-hlsl-to-sample">sample</a>
 * </td>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dx-graphics-hlsl-to-samplecmp">samplecmp</a> or <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dx-graphics-hlsl-to-samplecmplevelzero">samplecmplevelzero</a>
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * Comparison filters only work with textures that have the following <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">formats</a>: R32_FLOAT_X8X24_TYPELESS, R32_FLOAT, R24_UNORM_X8_TYPELESS, R16_UNORM.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d10/ne-d3d10-d3d10_filter
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class D3D10_FILTER extends Win32Enum{

    /**
     * Use point sampling for minification, magnification, and mip-level sampling.
     * @type {Integer (Int32)}
     */
    static D3D10_FILTER_MIN_MAG_MIP_POINT => 0

    /**
     * Use point sampling for minification and magnification; use linear interpolation for mip-level sampling.
     * @type {Integer (Int32)}
     */
    static D3D10_FILTER_MIN_MAG_POINT_MIP_LINEAR => 1

    /**
     * Use point sampling for minification; use linear interpolation for magnification; use point sampling for mip-level sampling.
     * @type {Integer (Int32)}
     */
    static D3D10_FILTER_MIN_POINT_MAG_LINEAR_MIP_POINT => 4

    /**
     * Use point sampling for minification; use linear interpolation for magnification and mip-level sampling.
     * @type {Integer (Int32)}
     */
    static D3D10_FILTER_MIN_POINT_MAG_MIP_LINEAR => 5

    /**
     * Use linear interpolation for minification; use point sampling for magnification and mip-level sampling.
     * @type {Integer (Int32)}
     */
    static D3D10_FILTER_MIN_LINEAR_MAG_MIP_POINT => 16

    /**
     * Use linear interpolation for minification; use point sampling for magnification; use linear interpolation for mip-level sampling.
     * @type {Integer (Int32)}
     */
    static D3D10_FILTER_MIN_LINEAR_MAG_POINT_MIP_LINEAR => 17

    /**
     * Use linear interpolation for minification and magnification; use point sampling for mip-level sampling.
     * @type {Integer (Int32)}
     */
    static D3D10_FILTER_MIN_MAG_LINEAR_MIP_POINT => 20

    /**
     * Use linear interpolation for minification, magnification, and mip-level sampling.
     * @type {Integer (Int32)}
     */
    static D3D10_FILTER_MIN_MAG_MIP_LINEAR => 21

    /**
     * Use anisotropic interpolation for minification, magnification, and mip-level sampling.
     * @type {Integer (Int32)}
     */
    static D3D10_FILTER_ANISOTROPIC => 85

    /**
     * Use point sampling for minification, magnification, and mip-level sampling. Compare the result to the comparison value.
     * @type {Integer (Int32)}
     */
    static D3D10_FILTER_COMPARISON_MIN_MAG_MIP_POINT => 128

    /**
     * Use point sampling for minification and magnification; use linear interpolation for mip-level sampling. Compare the result to the comparison value.
     * @type {Integer (Int32)}
     */
    static D3D10_FILTER_COMPARISON_MIN_MAG_POINT_MIP_LINEAR => 129

    /**
     * Use point sampling for minification; use linear interpolation for magnification; use point sampling for mip-level sampling. Compare the result to the comparison value.
     * @type {Integer (Int32)}
     */
    static D3D10_FILTER_COMPARISON_MIN_POINT_MAG_LINEAR_MIP_POINT => 132

    /**
     * Use point sampling for minification; use linear interpolation for magnification and mip-level sampling. Compare the result to the comparison value.
     * @type {Integer (Int32)}
     */
    static D3D10_FILTER_COMPARISON_MIN_POINT_MAG_MIP_LINEAR => 133

    /**
     * Use linear interpolation for minification; use point sampling for magnification and mip-level sampling. Compare the result to the comparison value.
     * @type {Integer (Int32)}
     */
    static D3D10_FILTER_COMPARISON_MIN_LINEAR_MAG_MIP_POINT => 144

    /**
     * Use linear interpolation for minification; use point sampling for magnification; use linear interpolation for mip-level sampling. Compare the result to the comparison value.
     * @type {Integer (Int32)}
     */
    static D3D10_FILTER_COMPARISON_MIN_LINEAR_MAG_POINT_MIP_LINEAR => 145

    /**
     * Use linear interpolation for minification and magnification; use point sampling for mip-level sampling. Compare the result to the comparison value.
     * @type {Integer (Int32)}
     */
    static D3D10_FILTER_COMPARISON_MIN_MAG_LINEAR_MIP_POINT => 148

    /**
     * Use linear interpolation for minification, magnification, and mip-level sampling. Compare the result to the comparison value.
     * @type {Integer (Int32)}
     */
    static D3D10_FILTER_COMPARISON_MIN_MAG_MIP_LINEAR => 149

    /**
     * Use anisotropic interpolation for minification, magnification, and mip-level sampling. Compare the result to the comparison value.
     * @type {Integer (Int32)}
     */
    static D3D10_FILTER_COMPARISON_ANISOTROPIC => 213

    /**
     * For use in pixel shaders with textures that have the R1_UNORM format.
     * @type {Integer (Int32)}
     */
    static D3D10_FILTER_TEXT_1BIT => -2147483648
}
