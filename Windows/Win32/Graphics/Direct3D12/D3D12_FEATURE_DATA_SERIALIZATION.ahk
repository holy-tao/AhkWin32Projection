#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_HEAP_SERIALIZATION_TIER.ahk" { D3D12_HEAP_SERIALIZATION_TIER }

/**
 * Indicates the level of support for heap serialization.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_serialization
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_FEATURE_DATA_SERIALIZATION {
    #StructPack 4

    /**
     * Type: **[UINT](/windows/desktop/WinProg/windows-data-types)**
     * 
     * An input field, indicating the adapter index to query.
     */
    NodeIndex : UInt32

    /**
     * Type: **[D3D12_HEAP_SERIALIZATION_TIER](/windows/desktop/api/d3d12/ne-d3d12-d3d12_heap_serialization_tier)**
     * 
     * An output field, indicating the tier of heap serialization support.
     */
    HeapSerializationTier : D3D12_HEAP_SERIALIZATION_TIER

}
