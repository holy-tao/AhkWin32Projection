#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\D3D12_RESOURCE_STATES.ahk" { D3D12_RESOURCE_STATES }
#Import ".\D3D12_META_COMMAND_PARAMETER_TYPE.ahk" { D3D12_META_COMMAND_PARAMETER_TYPE }
#Import ".\D3D12_META_COMMAND_PARAMETER_FLAGS.ahk" { D3D12_META_COMMAND_PARAMETER_FLAGS }

/**
 * Describes a parameter to a meta command.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_meta_command_parameter_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_META_COMMAND_PARAMETER_DESC {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCWSTR</a></b>
     * 
     * The parameter name.
     */
    Name : PWSTR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_meta_command_parameter_type">D3D12_META_COMMAND_PARAMETER_TYPE</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_meta_command_parameter_type">D3D12_META_COMMAND_PARAMETER_TYPE</a> specifying the parameter type.
     */
    Type : D3D12_META_COMMAND_PARAMETER_TYPE

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_meta_command_parameter_flags">D3D12_META_COMMAND_PARAMETER_FLAGS</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_meta_command_parameter_flags">D3D12_META_COMMAND_PARAMETER_FLAGS</a> specifying the parameter flags.
     */
    Flags : D3D12_META_COMMAND_PARAMETER_FLAGS

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_resource_states">D3D12_RESOURCE_STATES</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_resource_states">D3D12_RESOURCE_STATES</a> specifying the expected state of a resource parameter.
     */
    RequiredResourceState : D3D12_RESOURCE_STATES

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The 4-byte aligned offset for this parameter, within the structure containing the parameter values, which you pass when creating/initializing/executing the meta command, as appropriate.
     */
    StructureOffset : UInt32

}
