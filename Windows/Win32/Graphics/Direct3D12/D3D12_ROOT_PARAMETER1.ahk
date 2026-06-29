#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_ROOT_PARAMETER_TYPE.ahk" { D3D12_ROOT_PARAMETER_TYPE }
#Import ".\D3D12_ROOT_DESCRIPTOR_TABLE1.ahk" { D3D12_ROOT_DESCRIPTOR_TABLE1 }
#Import ".\D3D12_ROOT_CONSTANTS.ahk" { D3D12_ROOT_CONSTANTS }
#Import ".\D3D12_ROOT_DESCRIPTOR1.ahk" { D3D12_ROOT_DESCRIPTOR1 }
#Import ".\D3D12_DESCRIPTOR_RANGE1.ahk" { D3D12_DESCRIPTOR_RANGE1 }
#Import ".\D3D12_SHADER_VISIBILITY.ahk" { D3D12_SHADER_VISIBILITY }
#Import ".\D3D12_ROOT_DESCRIPTOR_FLAGS.ahk" { D3D12_ROOT_DESCRIPTOR_FLAGS }

/**
 * Describes the slot of a root signature version 1.1.
 * @remarks
 * Use this structure with the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_root_signature_desc1">D3D12_ROOT_SIGNATURE_DESC1</a> structure.
 * 
 * Refer to the helper structure <a href="https://docs.microsoft.com/windows/desktop/direct3d12/cd3dx12-root-parameter1">CD3DX12_ROOT_PARAMETER1</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_root_parameter1
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_ROOT_PARAMETER1 {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_root_parameter_type">D3D12_ROOT_PARAMETER_TYPE</a>-typed value that  specifies the type of root signature slot. This member determines which type to use in the union below.
     */
    ParameterType : D3D12_ROOT_PARAMETER_TYPE

    DescriptorTable : D3D12_ROOT_DESCRIPTOR_TABLE1

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_shader_visibility">D3D12_SHADER_VISIBILITY</a>-typed value that  specifies the shaders that can access the contents of the root signature slot.
     */
    ShaderVisibility : D3D12_SHADER_VISIBILITY

    static __New() {
        DefineProp(this.Prototype, 'Constants', { type: D3D12_ROOT_CONSTANTS, offset: 8 })
        DefineProp(this.Prototype, 'Descriptor', { type: D3D12_ROOT_DESCRIPTOR1, offset: 8 })
        this.DeleteProp("__New")
    }
}
