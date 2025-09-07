#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_ROOT_DESCRIPTOR_TABLE.ahk
#Include .\D3D12_ROOT_CONSTANTS.ahk
#Include .\D3D12_ROOT_DESCRIPTOR.ahk

/**
 * Describes the slot of a root signature version 1.0.
 * @remarks
 * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_root_signature_desc">D3D12_ROOT_SIGNATURE_DESC</a> can contain descriptor tables and inline constants. More capable hardware could support inline descriptors in the root signature as well. The number of bind slots in the root signature are most efficient if kept below a certain size, and can have an upper bound as well.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_root_parameter
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_ROOT_PARAMETER extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_root_parameter_type">D3D12_ROOT_PARAMETER_TYPE</a>-typed value that  specifies the type of root signature slot. This member determines which type to use in the union below.
     * @type {Integer}
     */
    ParameterType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {D3D12_ROOT_DESCRIPTOR_TABLE}
     */
    DescriptorTable{
        get {
            if(!this.HasProp("__DescriptorTable"))
                this.__DescriptorTable := D3D12_ROOT_DESCRIPTOR_TABLE(this.ptr + 8)
            return this.__DescriptorTable
        }
    }

    /**
     * @type {D3D12_ROOT_CONSTANTS}
     */
    Constants{
        get {
            if(!this.HasProp("__Constants"))
                this.__Constants := D3D12_ROOT_CONSTANTS(this.ptr + 8)
            return this.__Constants
        }
    }

    /**
     * @type {D3D12_ROOT_DESCRIPTOR}
     */
    Descriptor{
        get {
            if(!this.HasProp("__Descriptor"))
                this.__Descriptor := D3D12_ROOT_DESCRIPTOR(this.ptr + 8)
            return this.__Descriptor
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_shader_visibility">D3D12_SHADER_VISIBILITY</a>-typed value that  specifies the shaders that can access the contents of the root signature slot.
     * @type {Integer}
     */
    ShaderVisibility {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }
}
