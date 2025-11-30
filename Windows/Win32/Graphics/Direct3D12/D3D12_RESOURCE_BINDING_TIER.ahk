#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Identifies the tier of resource binding being used.
 * @remarks
 * 
 * This enum is used by the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_feature_data_d3d12_options">D3D12_FEATURE_DATA_D3D12_OPTIONS</a> structure.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ne-d3d12-d3d12_resource_binding_tier
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_RESOURCE_BINDING_TIER extends Win32Enum{

    /**
     * Tier 1.
     *             See <a href="https://docs.microsoft.com/windows/desktop/direct3d12/hardware-support">Hardware Tiers</a>.
     * @type {Integer (Int32)}
     */
    static D3D12_RESOURCE_BINDING_TIER_1 => 1

    /**
     * Tier 2.
     *             See <a href="https://docs.microsoft.com/windows/desktop/direct3d12/hardware-support">Hardware Tiers</a>.
     * @type {Integer (Int32)}
     */
    static D3D12_RESOURCE_BINDING_TIER_2 => 2

    /**
     * Tier 3.
     *             See <a href="https://docs.microsoft.com/windows/desktop/direct3d12/hardware-support">Hardware Tiers</a>.
     * @type {Integer (Int32)}
     */
    static D3D12_RESOURCE_BINDING_TIER_3 => 3
}
