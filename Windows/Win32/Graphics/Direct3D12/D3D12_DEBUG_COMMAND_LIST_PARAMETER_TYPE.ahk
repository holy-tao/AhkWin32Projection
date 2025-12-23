#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates the debug parameter type used by ID3D12DebugCommandList1::SetDebugParameter and ID3D12DebugCommandList1::GetDebugParameter.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_debug_command_list_parameter_type
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_DEBUG_COMMAND_LIST_PARAMETER_TYPE extends Win32Enum{

    /**
     * Indicates the parameter is type <a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/ns-d3d12sdklayers-d3d12_debug_command_list_gpu_based_validation_settings">D3D12_DEBUG_COMMAND_LIST_GPU_BASED_VALIDATION_SETTINGS</a>.
     * @type {Integer (Int32)}
     */
    static D3D12_DEBUG_COMMAND_LIST_PARAMETER_GPU_BASED_VALIDATION_SETTINGS => 0
}
