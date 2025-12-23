#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify sampler feedback support.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_sampler_feedback_tier
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_SAMPLER_FEEDBACK_TIER extends Win32Enum{

    /**
     * Specifies that sampler feedback is not supported. Attempts at calling sampler feedback APIs represent an error.
     * @type {Integer (Int32)}
     */
    static D3D12_SAMPLER_FEEDBACK_TIER_NOT_SUPPORTED => 0

    /**
     * Specifies that sampler feedback is supported to tier 0.9. This indicates the following:
     * 
     * Sampler feedback is supported for samplers with these texture addressing modes:
     * * D3D12_TEXTURE_ADDRESS_MODE_WRAP
     * * D3D12_TEXTURE_ADDRESS_MODE_CLAMP
     * 
     * The Texture2D shader resource view passed in to feedback-writing HLSL methods has these restrictions:
     * * The MostDetailedMip field must be 0.
     * * The MipLevels count must span the full mip count of the resource.
     * * The PlaneSlice field must be 0.
     * * The ResourceMinLODClamp field must be 0.
     * 
     * The Texture2DArray shader resource view passed in to feedback-writing HLSL methods has these restrictions:
     * * All the limitations as in Texture2D above, and
     * * The FirstArraySlice field must be 0.
     * * The ArraySize field must span the full array element count of the resource.
     * @type {Integer (Int32)}
     */
    static D3D12_SAMPLER_FEEDBACK_TIER_0_9 => 90

    /**
     * Specifies sample feedback is supported to tier 1.0. This indicates that sampler feedback is supported for all texture addressing modes, and feedback-writing methods are supported irrespective of the passed-in shader resource view.
     * @type {Integer (Int32)}
     */
    static D3D12_SAMPLER_FEEDBACK_TIER_1_0 => 100
}
