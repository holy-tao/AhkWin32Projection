#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes constants inline in the root signature that appear in shaders as one constant buffer.
 * @remarks
 * Refer to <a href="https://docs.microsoft.com/windows/desktop/direct3d12/resource-binding-in-hlsl">Resource Binding in HLSL</a> for more information on shader registers and spaces. 
 * 
 * <b>D3D12_ROOT_CONSTANTS</b> is the data type of the <b>Constants</b> member of <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_root_parameter">D3D12_ROOT_PARAMETER</a>. 
 *         Use a <b>D3D12_ROOT_CONSTANTS</b> when you set <b>D3D12_ROOT_PARAMETER</b>'s <b>SlotType</b> field to the D3D12_ROOT_PARAMETER_TYPE_32BIT_CONSTANTS member of <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_root_parameter_type">D3D12_ROOT_PARAMETER_TYPE</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_root_constants
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_ROOT_CONSTANTS extends Win32Struct
{
    static sizeof => 12

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

    /**
     * The number of constants that occupy a single shader slot (these constants appear like a single constant buffer). 
     *             All constants occupy a single root signature bind slot.
     * @type {Integer}
     */
    Num32BitValues {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
