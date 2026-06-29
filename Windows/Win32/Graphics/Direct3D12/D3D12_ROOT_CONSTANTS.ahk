#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes constants inline in the root signature that appear in shaders as one constant buffer.
 * @remarks
 * Refer to <a href="https://docs.microsoft.com/windows/desktop/direct3d12/resource-binding-in-hlsl">Resource Binding in HLSL</a> for more information on shader registers and spaces. 
 * 
 * <b>D3D12_ROOT_CONSTANTS</b> is the data type of the <b>Constants</b> member of <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_root_parameter">D3D12_ROOT_PARAMETER</a>. 
 *         Use a <b>D3D12_ROOT_CONSTANTS</b> when you set <b>D3D12_ROOT_PARAMETER</b>'s <b>SlotType</b> field to the D3D12_ROOT_PARAMETER_TYPE_32BIT_CONSTANTS member of <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_root_parameter_type">D3D12_ROOT_PARAMETER_TYPE</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_root_constants
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_ROOT_CONSTANTS {
    #StructPack 4

    /**
     * The shader register.
     */
    ShaderRegister : UInt32

    /**
     * The register space.
     */
    RegisterSpace : UInt32

    /**
     * The number of constants that occupy a single shader slot (these constants appear like a single constant buffer). 
     *             All constants occupy a single root signature bind slot.
     */
    Num32BitValues : UInt32

}
