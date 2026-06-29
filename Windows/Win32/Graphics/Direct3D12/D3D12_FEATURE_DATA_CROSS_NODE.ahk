#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_CROSS_NODE_SHARING_TIER.ahk" { D3D12_CROSS_NODE_SHARING_TIER }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Indicates the level of support for the sharing of resources between different adapters&mdash;for example, multiple GPUs.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_cross_node
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_FEATURE_DATA_CROSS_NODE {
    #StructPack 4

    /**
     * Type: <b>[D3D12_CROSS_NODE_SHARING_TIER](/windows/desktop/api/d3d12/ne-d3d12-d3d12_cross_node_sharing_tier)</b>
     * 
     * Indicates the tier of cross-adapter sharing support.
     */
    SharingTier : D3D12_CROSS_NODE_SHARING_TIER

    /**
     * Type: <b>[BOOL](/windows/desktop/winprog/windows-data-types)</b>
     * 
     * Indicates there is support for shader instructions which operate across adapters.
     */
    AtomicShaderInstructions : BOOL

}
