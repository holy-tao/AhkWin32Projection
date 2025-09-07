#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Indicates the level of support for the sharing of resources between different adapters&mdash;for example, multiple GPUs.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_cross_node
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_FEATURE_DATA_CROSS_NODE extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Type: <b>[D3D12_CROSS_NODE_SHARING_TIER](/windows/desktop/api/d3d12/ne-d3d12-d3d12_cross_node_sharing_tier)</b>
     * 
     * Indicates the tier of cross-adapter sharing support.
     * @type {Integer}
     */
    SharingTier {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b>[BOOL](/windows/desktop/winprog/windows-data-types)</b>
     * 
     * Indicates there is support for shader instructions which operate across adapters.
     * @type {Integer}
     */
    AtomicShaderInstructions {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
