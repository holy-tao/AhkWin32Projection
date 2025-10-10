#Requires AutoHotkey v2.0.0 64-bit

/**
 * Filtering options during texture sampling.
 * @remarks
 * 
  * <div class="alert"><b>Note</b>  If you use different filter types for min versus mag filter, undefined behavior occurs in certain cases where the choice between whether magnification or minification happens is ambiguous.  To prevent this undefined behavior, use filter modes that use similar filter operations for both min and mag (or use anisotropic filtering, which avoids the issue as well).</div>
  * <div> </div>
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
  * <td>sample</td>
  * <td>samplecmp or samplecmplevelzero</td>
  * </tr>
  * </table>
  *  
  * 
  * Comparison filters only work with textures that have the following DXGI formats: R32_FLOAT_X8X24_TYPELESS, R32_FLOAT, R24_UNORM_X8_TYPELESS, R16_UNORM.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/ne-d3d11-d3d11_filter
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_FILTER{

    /**
     * Use point sampling for minification, magnification, and mip-level sampling.
     * @type {Integer (Int32)}
     */
    static D3D11_FILTER_MIN_MAG_MIP_POINT => 0

    /**
     * Use point sampling for minification and magnification; use linear interpolation for mip-level sampling.
     * @type {Integer (Int32)}
     */
    static D3D11_FILTER_MIN_MAG_POINT_MIP_LINEAR => 1

    /**
     * Use point sampling for minification; use linear interpolation for magnification; use point sampling for mip-level sampling.
     * @type {Integer (Int32)}
     */
    static D3D11_FILTER_MIN_POINT_MAG_LINEAR_MIP_POINT => 4

    /**
     * Use point sampling for minification; use linear interpolation for magnification and mip-level sampling.
     * @type {Integer (Int32)}
     */
    static D3D11_FILTER_MIN_POINT_MAG_MIP_LINEAR => 5

    /**
     * Use linear interpolation for minification; use point sampling for magnification and mip-level sampling.
     * @type {Integer (Int32)}
     */
    static D3D11_FILTER_MIN_LINEAR_MAG_MIP_POINT => 16

    /**
     * Use linear interpolation for minification; use point sampling for magnification; use linear interpolation for mip-level sampling.
     * @type {Integer (Int32)}
     */
    static D3D11_FILTER_MIN_LINEAR_MAG_POINT_MIP_LINEAR => 17

    /**
     * Use linear interpolation for minification and magnification; use point sampling for mip-level sampling.
     * @type {Integer (Int32)}
     */
    static D3D11_FILTER_MIN_MAG_LINEAR_MIP_POINT => 20

    /**
     * Use linear interpolation for minification, magnification, and mip-level sampling.
     * @type {Integer (Int32)}
     */
    static D3D11_FILTER_MIN_MAG_MIP_LINEAR => 21

    /**
     * Use anisotropic interpolation for minification, magnification, and mip-level sampling.
     * @type {Integer (Int32)}
     */
    static D3D11_FILTER_ANISOTROPIC => 85

    /**
     * Use point sampling for minification, magnification, and mip-level sampling. Compare the result to the comparison value.
     * @type {Integer (Int32)}
     */
    static D3D11_FILTER_COMPARISON_MIN_MAG_MIP_POINT => 128

    /**
     * Use point sampling for minification and magnification; use linear interpolation for mip-level sampling. Compare the result to the comparison value.
     * @type {Integer (Int32)}
     */
    static D3D11_FILTER_COMPARISON_MIN_MAG_POINT_MIP_LINEAR => 129

    /**
     * Use point sampling for minification; use linear interpolation for magnification; use point sampling for mip-level sampling. Compare the result to the comparison value.
     * @type {Integer (Int32)}
     */
    static D3D11_FILTER_COMPARISON_MIN_POINT_MAG_LINEAR_MIP_POINT => 132

    /**
     * Use point sampling for minification; use linear interpolation for magnification and mip-level sampling. Compare the result to the comparison value.
     * @type {Integer (Int32)}
     */
    static D3D11_FILTER_COMPARISON_MIN_POINT_MAG_MIP_LINEAR => 133

    /**
     * Use linear interpolation for minification; use point sampling for magnification and mip-level sampling. Compare the result to the comparison value.
     * @type {Integer (Int32)}
     */
    static D3D11_FILTER_COMPARISON_MIN_LINEAR_MAG_MIP_POINT => 144

    /**
     * Use linear interpolation for minification; use point sampling for magnification; use linear interpolation for mip-level sampling. Compare the result to the comparison value.
     * @type {Integer (Int32)}
     */
    static D3D11_FILTER_COMPARISON_MIN_LINEAR_MAG_POINT_MIP_LINEAR => 145

    /**
     * Use linear interpolation for minification and magnification; use point sampling for mip-level sampling. Compare the result to the comparison value.
     * @type {Integer (Int32)}
     */
    static D3D11_FILTER_COMPARISON_MIN_MAG_LINEAR_MIP_POINT => 148

    /**
     * Use linear interpolation for minification, magnification, and mip-level sampling. Compare the result to the comparison value.
     * @type {Integer (Int32)}
     */
    static D3D11_FILTER_COMPARISON_MIN_MAG_MIP_LINEAR => 149

    /**
     * Use anisotropic interpolation for minification, magnification, and mip-level sampling. Compare the result to the comparison value.
     * @type {Integer (Int32)}
     */
    static D3D11_FILTER_COMPARISON_ANISOTROPIC => 213

    /**
     * Fetch the same set of texels as <a href="https://docs.microsoft.com/">D3D11_FILTER_MIN_MAG_MIP_POINT</a> and instead of filtering them return the minimum of the texels.  Texels that are weighted 0 during filtering aren't counted towards the minimum.  You can query support for this filter type from the <b>MinMaxFiltering</b> member in the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_feature_data_d3d11_options1">D3D11_FEATURE_DATA_D3D11_OPTIONS1</a> structure.
     * @type {Integer (Int32)}
     */
    static D3D11_FILTER_MINIMUM_MIN_MAG_MIP_POINT => 256

    /**
     * Fetch the same set of texels as <a href="https://docs.microsoft.com/">D3D11_FILTER_MIN_MAG_POINT_MIP_LINEAR</a> and instead of filtering them return the minimum of the texels.  Texels that are weighted 0 during filtering aren't counted towards the minimum.  You can query support for this filter type from the <b>MinMaxFiltering</b> member in the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_feature_data_d3d11_options1">D3D11_FEATURE_DATA_D3D11_OPTIONS1</a> structure.
     * @type {Integer (Int32)}
     */
    static D3D11_FILTER_MINIMUM_MIN_MAG_POINT_MIP_LINEAR => 257

    /**
     * Fetch the same set of texels as <a href="https://docs.microsoft.com/">D3D11_FILTER_MIN_POINT_MAG_LINEAR_MIP_POINT</a> and instead of filtering them return the minimum of the texels.  Texels that are weighted 0 during filtering aren't counted towards the minimum.  You can query support for this filter type from the <b>MinMaxFiltering</b> member in the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_feature_data_d3d11_options1">D3D11_FEATURE_DATA_D3D11_OPTIONS1</a> structure.
     * @type {Integer (Int32)}
     */
    static D3D11_FILTER_MINIMUM_MIN_POINT_MAG_LINEAR_MIP_POINT => 260

    /**
     * Fetch the same set of texels as <a href="https://docs.microsoft.com/">D3D11_FILTER_MIN_POINT_MAG_MIP_LINEAR</a> and instead of filtering them return the minimum of the texels.  Texels that are weighted 0 during filtering aren't counted towards the minimum.  You can query support for this filter type from the <b>MinMaxFiltering</b> member in the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_feature_data_d3d11_options1">D3D11_FEATURE_DATA_D3D11_OPTIONS1</a> structure.
     * @type {Integer (Int32)}
     */
    static D3D11_FILTER_MINIMUM_MIN_POINT_MAG_MIP_LINEAR => 261

    /**
     * Fetch the same set of texels as <a href="https://docs.microsoft.com/">D3D11_FILTER_MIN_LINEAR_MAG_MIP_POINT</a> and instead of filtering them return the minimum of the texels.  Texels that are weighted 0 during filtering aren't counted towards the minimum.  You can query support for this filter type from the <b>MinMaxFiltering</b> member in the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_feature_data_d3d11_options1">D3D11_FEATURE_DATA_D3D11_OPTIONS1</a> structure.
     * @type {Integer (Int32)}
     */
    static D3D11_FILTER_MINIMUM_MIN_LINEAR_MAG_MIP_POINT => 272

    /**
     * Fetch the same set of texels as <a href="https://docs.microsoft.com/">D3D11_FILTER_MIN_LINEAR_MAG_POINT_MIP_LINEAR</a> and instead of filtering them return the minimum of the texels.  Texels that are weighted 0 during filtering aren't counted towards the minimum.  You can query support for this filter type from the <b>MinMaxFiltering</b> member in the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_feature_data_d3d11_options1">D3D11_FEATURE_DATA_D3D11_OPTIONS1</a> structure.
     * @type {Integer (Int32)}
     */
    static D3D11_FILTER_MINIMUM_MIN_LINEAR_MAG_POINT_MIP_LINEAR => 273

    /**
     * Fetch the same set of texels as <a href="https://docs.microsoft.com/">D3D11_FILTER_MIN_MAG_LINEAR_MIP_POINT</a> and instead of filtering them return the minimum of the texels.  Texels that are weighted 0 during filtering aren't counted towards the minimum.  You can query support for this filter type from the <b>MinMaxFiltering</b> member in the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_feature_data_d3d11_options1">D3D11_FEATURE_DATA_D3D11_OPTIONS1</a> structure.
     * @type {Integer (Int32)}
     */
    static D3D11_FILTER_MINIMUM_MIN_MAG_LINEAR_MIP_POINT => 276

    /**
     * Fetch the same set of texels as <a href="https://docs.microsoft.com/">D3D11_FILTER_MIN_MAG_MIP_LINEAR</a> and instead of filtering them return the minimum of the texels.  Texels that are weighted 0 during filtering aren't counted towards the minimum.  You can query support for this filter type from the <b>MinMaxFiltering</b> member in the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_feature_data_d3d11_options1">D3D11_FEATURE_DATA_D3D11_OPTIONS1</a> structure.
     * @type {Integer (Int32)}
     */
    static D3D11_FILTER_MINIMUM_MIN_MAG_MIP_LINEAR => 277

    /**
     * Fetch the same set of texels as <a href="https://docs.microsoft.com/">D3D11_FILTER_ANISOTROPIC</a> and instead of filtering them return the minimum of the texels.  Texels that are weighted 0 during filtering aren't counted towards the minimum.  You can query support for this filter type from the <b>MinMaxFiltering</b> member in the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_feature_data_d3d11_options1">D3D11_FEATURE_DATA_D3D11_OPTIONS1</a> structure.
     * @type {Integer (Int32)}
     */
    static D3D11_FILTER_MINIMUM_ANISOTROPIC => 341

    /**
     * Fetch the same set of texels as <a href="https://docs.microsoft.com/">D3D11_FILTER_MIN_MAG_MIP_POINT</a> and instead of filtering them return the maximum of the texels.  Texels that are weighted 0 during filtering aren't counted towards the maximum.  You can query support for this filter type from the <b>MinMaxFiltering</b> member in the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_feature_data_d3d11_options1">D3D11_FEATURE_DATA_D3D11_OPTIONS1</a> structure.
     * @type {Integer (Int32)}
     */
    static D3D11_FILTER_MAXIMUM_MIN_MAG_MIP_POINT => 384

    /**
     * Fetch the same set of texels as <a href="https://docs.microsoft.com/">D3D11_FILTER_MIN_MAG_POINT_MIP_LINEAR</a> and instead of filtering them return the maximum of the texels.  Texels that are weighted 0 during filtering aren't counted towards the maximum.  You can query support for this filter type from the <b>MinMaxFiltering</b> member in the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_feature_data_d3d11_options1">D3D11_FEATURE_DATA_D3D11_OPTIONS1</a> structure.
     * @type {Integer (Int32)}
     */
    static D3D11_FILTER_MAXIMUM_MIN_MAG_POINT_MIP_LINEAR => 385

    /**
     * Fetch the same set of texels as <a href="https://docs.microsoft.com/">D3D11_FILTER_MIN_POINT_MAG_LINEAR_MIP_POINT</a> and instead of filtering them return the maximum of the texels.  Texels that are weighted 0 during filtering aren't counted towards the maximum.  You can query support for this filter type from the <b>MinMaxFiltering</b> member in the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_feature_data_d3d11_options1">D3D11_FEATURE_DATA_D3D11_OPTIONS1</a> structure.
     * @type {Integer (Int32)}
     */
    static D3D11_FILTER_MAXIMUM_MIN_POINT_MAG_LINEAR_MIP_POINT => 388

    /**
     * Fetch the same set of texels as <a href="https://docs.microsoft.com/">D3D11_FILTER_MIN_POINT_MAG_MIP_LINEAR</a> and instead of filtering them return the maximum of the texels.  Texels that are weighted 0 during filtering aren't counted towards the maximum.  You can query support for this filter type from the <b>MinMaxFiltering</b> member in the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_feature_data_d3d11_options1">D3D11_FEATURE_DATA_D3D11_OPTIONS1</a> structure.
     * @type {Integer (Int32)}
     */
    static D3D11_FILTER_MAXIMUM_MIN_POINT_MAG_MIP_LINEAR => 389

    /**
     * Fetch the same set of texels as <a href="https://docs.microsoft.com/">D3D11_FILTER_MIN_LINEAR_MAG_MIP_POINT</a> and instead of filtering them return the maximum of the texels.  Texels that are weighted 0 during filtering aren't counted towards the maximum.  You can query support for this filter type from the <b>MinMaxFiltering</b> member in the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_feature_data_d3d11_options1">D3D11_FEATURE_DATA_D3D11_OPTIONS1</a> structure.
     * @type {Integer (Int32)}
     */
    static D3D11_FILTER_MAXIMUM_MIN_LINEAR_MAG_MIP_POINT => 400

    /**
     * Fetch the same set of texels as <a href="https://docs.microsoft.com/">D3D11_FILTER_MIN_LINEAR_MAG_POINT_MIP_LINEAR</a> and instead of filtering them return the maximum of the texels.  Texels that are weighted 0 during filtering aren't counted towards the maximum.  You can query support for this filter type from the <b>MinMaxFiltering</b> member in the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_feature_data_d3d11_options1">D3D11_FEATURE_DATA_D3D11_OPTIONS1</a> structure.
     * @type {Integer (Int32)}
     */
    static D3D11_FILTER_MAXIMUM_MIN_LINEAR_MAG_POINT_MIP_LINEAR => 401

    /**
     * Fetch the same set of texels as <a href="https://docs.microsoft.com/">D3D11_FILTER_MIN_MAG_LINEAR_MIP_POINT</a> and instead of filtering them return the maximum of the texels.  Texels that are weighted 0 during filtering aren't counted towards the maximum.  You can query support for this filter type from the <b>MinMaxFiltering</b> member in the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_feature_data_d3d11_options1">D3D11_FEATURE_DATA_D3D11_OPTIONS1</a> structure.
     * @type {Integer (Int32)}
     */
    static D3D11_FILTER_MAXIMUM_MIN_MAG_LINEAR_MIP_POINT => 404

    /**
     * Fetch the same set of texels as <a href="https://docs.microsoft.com/">D3D11_FILTER_MIN_MAG_MIP_LINEAR</a> and instead of filtering them return the maximum of the texels.  Texels that are weighted 0 during filtering aren't counted towards the maximum.  You can query support for this filter type from the <b>MinMaxFiltering</b> member in the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_feature_data_d3d11_options1">D3D11_FEATURE_DATA_D3D11_OPTIONS1</a> structure.
     * @type {Integer (Int32)}
     */
    static D3D11_FILTER_MAXIMUM_MIN_MAG_MIP_LINEAR => 405

    /**
     * Fetch the same set of texels as <a href="https://docs.microsoft.com/">D3D11_FILTER_ANISOTROPIC</a> and instead of filtering them return the maximum of the texels.  Texels that are weighted 0 during filtering aren't counted towards the maximum.  You can query support for this filter type from the <b>MinMaxFiltering</b> member in the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_feature_data_d3d11_options1">D3D11_FEATURE_DATA_D3D11_OPTIONS1</a> structure.
     * @type {Integer (Int32)}
     */
    static D3D11_FILTER_MAXIMUM_ANISOTROPIC => 469
}
