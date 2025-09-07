#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a descriptor range, with flags to determine their volatility.
 * @remarks
 * This structure is a member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_root_descriptor_table1">D3D12_ROOT_DESCRIPTOR_TABLE1</a> structure.
  *       
  * 
  * Refer to the helper structure <a href="https://docs.microsoft.com/windows/desktop/direct3d12/cd3dx12-descriptor-range1">CD3DX12_DESCRIPTOR_RANGE1</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_descriptor_range1
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_DESCRIPTOR_RANGE1 extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_descriptor_range_type">D3D12_DESCRIPTOR_RANGE_TYPE</a>-typed value that specifies the type of descriptor range.
     * @type {Integer}
     */
    RangeType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The number of descriptors in the range. Use -1 or UINT_MAX to specify unbounded size. Only the last entry in a table can have unbounded size.
     * @type {Integer}
     */
    NumDescriptors {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The base shader register in the range. For example, for shader-resource views (SRVs), 3 maps to ": register(t3);" in HLSL.
     * @type {Integer}
     */
    BaseShaderRegister {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The register space. Can typically be 0, but allows multiple descriptor  arrays of unknown size to not appear to overlap.
     *             For example, for SRVs, by extending the example in the <b>BaseShaderRegister</b> member description, 5 maps to ": register(t3,space5);" in HLSL.
     * @type {Integer}
     */
    RegisterSpace {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Specifies the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_descriptor_range_flags">D3D12_DESCRIPTOR_RANGE_FLAGS</a> that determine descriptor and data volatility.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * The offset in descriptors from the start of the root signature. This value can be <b>D3D12_DESCRIPTOR_RANGE_OFFSET_APPEND</b>, which indicates this range should immediately follow the preceding range.
     * @type {Integer}
     */
    OffsetInDescriptorsFromTableStart {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
