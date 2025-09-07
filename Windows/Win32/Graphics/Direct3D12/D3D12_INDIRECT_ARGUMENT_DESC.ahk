#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes an indirect argument (an indirect parameter), for use with a command signature.
 * @remarks
 * Use this structure with the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_command_signature_desc">D3D12_COMMAND_SIGNATURE_DESC</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_indirect_argument_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_INDIRECT_ARGUMENT_DESC extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * A single <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_indirect_argument_type">D3D12_INDIRECT_ARGUMENT_TYPE</a> enumeration constant.
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    VertexBuffer {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    RootParameterIndex {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    DestOffsetIn32BitValues {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Num32BitValuesToSet {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    ConstantBufferView {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    ShaderResourceView {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    UnorderedAccessView {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
