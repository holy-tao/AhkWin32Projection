#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes descriptors inline in the root signature version 1.0 that appear in shaders.
 * @remarks
 * <b>D3D12_ROOT_DESCRIPTOR</b> is the data type of the <b>Descriptor</b> member of <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_root_parameter">D3D12_ROOT_PARAMETER</a>.
 *         Use a <b>D3D12_ROOT_DESCRIPTOR</b> when you set <b>D3D12_ROOT_PARAMETER</b>'s <b>ParameterType</b> field to the D3D12_ROOT_PARAMETER_TYPE_CBV, D3D12_ROOT_PARAMETER_TYPE_SRV, or D3D12_ROOT_PARAMETER_TYPE_UAV members of <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_root_parameter_type">D3D12_ROOT_PARAMETER_TYPE</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_root_descriptor
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_ROOT_DESCRIPTOR {
    #StructPack 4

    /**
     * The shader register.
     */
    ShaderRegister : UInt32

    /**
     * The register space.
     */
    RegisterSpace : UInt32

}
