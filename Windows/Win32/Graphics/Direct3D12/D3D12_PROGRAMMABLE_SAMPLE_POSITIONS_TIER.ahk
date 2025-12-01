#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the level of support for programmable sample positions that's offered by the adapter.
 * @remarks
 * This enum is used by the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_feature_data_d3d12_options2">D3D12_FEATURE_D3D12_DATA_OPTIONS2</a> structure to indicate the level of support offered for programmable sample positions.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_programmable_sample_positions_tier
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_PROGRAMMABLE_SAMPLE_POSITIONS_TIER extends Win32Enum{

    /**
     * Indicates that there's no support for programmable sample positions.
     * @type {Integer (Int32)}
     */
    static D3D12_PROGRAMMABLE_SAMPLE_POSITIONS_TIER_NOT_SUPPORTED => 0

    /**
     * Indicates that there's tier 1 support for programmable sample positions. In tier 1, a single sample pattern can be specified to repeat for every pixel (<a href="https://docs.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12graphicscommandlist1-setsamplepositions">SetSamplePosition</a> parameter <i>NumPixels</i> = 1) and ResolveSubResource is supported.
     * @type {Integer (Int32)}
     */
    static D3D12_PROGRAMMABLE_SAMPLE_POSITIONS_TIER_1 => 1

    /**
     * Indicates that there's tier 2 support for programmable sample positions. In tier 2, four separate sample patterns can be specified for each pixel in a 2x2 grid (<a href="https://docs.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12graphicscommandlist1-setsamplepositions">SetSamplePosition</a> parameter <i>NumPixels</i> = 1) that repeats over the render-target or viewport, aligned on even coordinates .
     * @type {Integer (Int32)}
     */
    static D3D12_PROGRAMMABLE_SAMPLE_POSITIONS_TIER_2 => 2
}
