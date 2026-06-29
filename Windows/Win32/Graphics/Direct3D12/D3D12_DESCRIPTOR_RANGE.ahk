#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_DESCRIPTOR_RANGE_TYPE.ahk" { D3D12_DESCRIPTOR_RANGE_TYPE }

/**
 * Describes a descriptor range.
 * @remarks
 * This structure is a member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_root_descriptor_table">D3D12_ROOT_DESCRIPTOR_TABLE</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_descriptor_range
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_DESCRIPTOR_RANGE {
    #StructPack 4

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_descriptor_range_type">D3D12_DESCRIPTOR_RANGE_TYPE</a>-typed value that specifies the type of descriptor range.
     */
    RangeType : D3D12_DESCRIPTOR_RANGE_TYPE

    /**
     * The number of descriptors in the range. Use -1 or UINT_MAX to specify an unbounded size. If a given descriptor range is unbounded, then it must either be the last range in the table definition, or else the following range in the table definition must have a value for *OffsetInDescriptorsFromTableStart* that is not [D3D12_DESCRIPTOR_RANGE_OFFSET_APPEND]().
     */
    NumDescriptors : UInt32

    /**
     * The base shader register in the range. For example, for shader-resource views (SRVs), 3 maps to ": register(t3);" in HLSL.
     */
    BaseShaderRegister : UInt32

    /**
     * The register space. Can typically be 0, but allows multiple descriptor  arrays of unknown size to not appear to overlap.
     *             For example, for SRVs, by extending the example in the <b>BaseShaderRegister</b> member description, 5 maps to ": register(t3,space5);" in HLSL.
     */
    RegisterSpace : UInt32

    /**
     * The offset in descriptors, from the start of the descriptor table which was set as the root argument value for this parameter slot. This value can be <b>D3D12_DESCRIPTOR_RANGE_OFFSET_APPEND</b>, which indicates this range should immediately follow the preceding range.
     */
    OffsetInDescriptorsFromTableStart : UInt32

}
