#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes descriptors inline in the root signature version 1.0 that appear in shaders.
 * @remarks
 * 
  * <b>D3D12_ROOT_DESCRIPTOR</b> is the data type of the <b>Descriptor</b> member of <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_root_parameter">D3D12_ROOT_PARAMETER</a>.
  *         Use a <b>D3D12_ROOT_DESCRIPTOR</b> when you set <b>D3D12_ROOT_PARAMETER</b>'s <b>ParameterType</b> field to the D3D12_ROOT_PARAMETER_TYPE_CBV, D3D12_ROOT_PARAMETER_TYPE_SRV, or D3D12_ROOT_PARAMETER_TYPE_UAV members of <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_root_parameter_type">D3D12_ROOT_PARAMETER_TYPE</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ns-d3d12-d3d12_root_descriptor
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_ROOT_DESCRIPTOR extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The shader register.
     * @type {Integer}
     */
    ShaderRegister {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The register space.
     * @type {Integer}
     */
    RegisterSpace {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
