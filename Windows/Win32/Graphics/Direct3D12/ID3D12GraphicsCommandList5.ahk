#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12GraphicsCommandList4.ahk

/**
 * Encapsulates a list of graphics commands for rendering, extending the interface to support variable-rate shading (VRS).
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12graphicscommandlist5
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12GraphicsCommandList5 extends ID3D12GraphicsCommandList4{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12GraphicsCommandList5
     * @type {Guid}
     */
    static IID => Guid("{55050859-4024-474c-87f5-6472eaee44ea}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 77

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RSSetShadingRate", "RSSetShadingRateImage"]

    /**
     * The ID3D12GraphicsCommandList5::RSSetShadingRate method (d3d12.h) sets the base shading rate, and combiners, for variable-rate shading (VRS).
     * @param {Integer} baseShadingRate Type: [**D3D12_SHADING_RATE**](/windows/desktop/api/d3d12/ne-d3d12-d3d12_shading_rate)
     * 
     * A constant from the [D3D12_SHADING_RATE](/windows/desktop/api/d3d12/ne-d3d12-d3d12_shading_rate) enumeration describing the base shading rate to set.
     * @param {Pointer<Integer>} combiners Type: **const [D3D12_SHADING_RATE_COMBINER](/windows/desktop/api/d3d12/ne-d3d12-d3d12_shading_rate_combiner)\***
     * 
     * An optional pointer to a constant array of [**D3D12_SHADING_RATE_COMBINER**](/windows/win32/api/d3d12/ne-d3d12-d3d12_shading_rate_combiner) containing the shading rate combiners to set. The count of [**D3D12_SHADING_RATE_COMBINER**](/windows/win32/api/d3d12/ne-d3d12-d3d12_shading_rate_combiner) elements in the array must be equal to the constant [**D3D12_RS_SET_SHADING_RATE_COMBINER_COUNT**](/windows/win32/direct3d12/constants), which is equal to **2**.
     * 
     * Because per-primitive and screen-space image-based VRS isn't supported on Tier1 [Variable-rate shading (VRS)](/windows/win32/direct3d12/vrs), for these values to be meaningful, the adapter requires Tier2 VRS support. See [**D3D12_FEATURE_DATA_D3D12_OPTIONS6**](/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_d3d12_options6) and [**D3D12_VARIABLE_SHADING_RATE_TIER**](/windows/win32/api/d3d12/ne-d3d12-d3d12_variable_shading_rate_tier).
     * 
     * A **NULL** pointer is equivalent to the default shading combiners, which are both [**D3D12_SHADING_RATE_COMBINER_PASSTHROUGH**](/windows/win32/api/d3d12/ne-d3d12-d3d12_shading_rate_combiner).
     * 
     * The algorithm for final shading-rate is determined by the following.
     * 
     * ```cpp
     * postRasterizerRate = ApplyCombiner(Combiners[0], CommandListShadingRate, Primitive->PrimitiveSpecifiedShadingRate);
     * finalRate = ApplyCombiner(Combiners[1], postRasterizerRate, ScreenSpaceImage[xy]);
     * ```
     * 
     * where `ApplyCombiner` is
     * 
     * ```cpp
     * UINT ApplyCombiner(D3D12_SHADING_RATE_COMBINER combiner, UINT a, UINT b)
     * {
     *     MaxShadingRate = options6.AdditionalShadingRatesSupported ? 4 : 2;
     *     switch (combiner)
     *     {
     *         case D3D12_SHADING_RATE_COMBINER_PASSTHROUGH: // default
     *             return a;
     *         case D3D12_SHADING_RATE_COMBINER_OVERRIDE:
     *             return b;
     *         case D3D12_SHADING_RATE_COMBINER_MAX:
     *             return max(a, b);
     *         case D3D12_SHADING_RATE_COMBINER_MIN:
     *             return min(a, b);
     *         case D3D12_SHADING_RATE_COMBINER_SUM:
     *             return min(MaxShadingRate, a + b);
     *         case default:
     *             return a;
     *     }
     * }
     * ```
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12graphicscommandlist5-rssetshadingrate
     */
    RSSetShadingRate(baseShadingRate, combiners) {
        combinersMarshal := combiners is VarRef ? "int*" : "ptr"

        ComCall(77, this, "int", baseShadingRate, combinersMarshal, combiners)
    }

    /**
     * The ID3D12GraphicsCommandList5::RSSetShadingRateImage method (d3d12.h) sets the screen-space shading-rate image for variable-rate shading (VRS).
     * @remarks
     * For the screen-space shading-rate image to take affect, [**ID3D12GraphicsCommandList5::RSSetShadingRate**](/windows/win32/api/d3d12/nf-d3d12-id3d12graphicscommandlist5-rssetshadingrate) must have been called to set the combiners for shading. Else, with the default combiners (both [**D3D12_SHADING_RATE_COMBINER_PASSTHROUGH**](/windows/win32/api/d3d12/ne-d3d12-d3d12_shading_rate_combiner)), the screen-space shading-rate image is ignored in determining shading granularity.
     * 
     * The second combiner passed to  [**ID3D12GraphicsCommandList5::RSSetShadingRate**] is the one which applies to the shading-rate image, which occurs after the global shading rate and the per-primitive shading rate have been combined.
     * 
     * The algorithm for final shading-rate is determined by
     * 
     * ```cpp
     * postRasterizerRate = ApplyCombiner(Combiners[0], CommandListShadingRate, Primitive->PrimitiveSpecifiedShadingRate);
     * finalRate = ApplyCombiner(Combiners[1], postRasterizerRate, ScreenSpaceImage[xy]);
     * ```
     * 
     * where `ApplyCombiner` is
     * 
     * ```cpp
     * UINT ApplyCombiner(D3D12_SHADING_RATE_COMBINER combiner, UINT a, UINT b)
     * {
     *     MaxShadingRate = options6.AdditionalShadingRatesSupported ? 4 : 2;
     *     switch (combiner)
     *     {
     *         case D3D12_SHADING_RATE_COMBINER_PASSTHROUGH: // default
     *             return a;
     *         case D3D12_SHADING_RATE_COMBINER_OVERRIDE:
     *             return b;
     *         case D3D12_SHADING_RATE_COMBINER_MAX:
     *             return max(a, b);
     *         case D3D12_SHADING_RATE_COMBINER_MIN:
     *             return min(a, b);
     *         case D3D12_SHADING_RATE_COMBINER_SUM:
     *             return min(MaxShadingRate, a + b);
     *         case default:
     *             return a;
     *     }
     * }
     * ```
     * @param {ID3D12Resource} shadingRateImage Type: **[ID3D12Resource](/windows/desktop/api/d3d12/nn-d3d12-id3d12resource)\***
     * 
     * An optional pointer to an [ID3D12Resource](/windows/desktop/api/d3d12/nn-d3d12-id3d12resource) representing a screen-space shading-rate image.
     * If **NULL**, the effect is the same as having a shading-rate image where all values are a shading rate of 1x1.
     * 
     * This texture must have the [**D3D12_RESOURCE_STATE_SHADING_RATE_SOURCE**](/windows/win32/api/d3d12/ne-d3d12-d3d12_resource_states) state applied.
     * 
     * The tile-size of the shading-rate image can be determined via [**D3D12_FEATURE_DATA_D3D12_OPTIONS6**](/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_d3d12_options6).
     * The size of the shading-rate image should therefore be
     * ```
     * ceil((float)rtWidth / VRSTileSize), ceil((float)rtHeight / VRSTileSize)
     * ```
     * 
     * The shading-rate image must be a 2D texture with a single mip, and format [**DXGI_FORMAT_R8_UINT**](/windows/win32/api/dxgiformat/ne-dxgiformat-dxgi_format). Each texel must be a value corresponding to [**D3D12_SHADING_RATE**](/windows/win32/api/d3d12/ne-d3d12-d3d12_shading_rate). It must have layout [**D3D12_TEXTURE_LAYOUT_UNKNOWN**](/windows/win32/api/d3d12/ne-d3d12-d3d12_texture_layout) and can't be a depth-stencil, render-target, simultaneous-access, or cross-adapter resource.
     * 
     * As (0, 0) is the top left in DirectX, a too-small or large shading-rate image results in the bottom or right having no shading-rate image area, or the image extending in these directions. When there is excess, it is ignored (but legal), and when the image is too small, all out-of-bounds areas in the bottom and right will have the default shading rate of 1x1 from the image (however, this does not mean that is the final shading rate. The combiners will still be applied to this 1x1 default value).
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12graphicscommandlist5-rssetshadingrateimage
     */
    RSSetShadingRateImage(shadingRateImage) {
        ComCall(78, this, "ptr", shadingRateImage)
    }
}
