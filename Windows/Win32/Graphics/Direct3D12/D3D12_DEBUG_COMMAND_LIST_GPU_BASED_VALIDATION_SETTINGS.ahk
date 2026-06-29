#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_GPU_BASED_VALIDATION_SHADER_PATCH_MODE.ahk" { D3D12_GPU_BASED_VALIDATION_SHADER_PATCH_MODE }

/**
 * Describes per-command-list settings used by GPU-Based Validation.
 * @remarks
 * Point to an object using this structure with the <i>pData</i> member of <a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/nf-d3d12sdklayers-id3d12debugcommandlist1-setdebugparameter">ID3D12DebugCommandList1::SetDebugParameter</a> to configure per-command-list GPU-Based Validation settings.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/ns-d3d12sdklayers-d3d12_debug_command_list_gpu_based_validation_settings
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_DEBUG_COMMAND_LIST_GPU_BASED_VALIDATION_SETTINGS {
    #StructPack 4

    /**
     * Specifies a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_gpu_based_validation_shader_patch_mode">D3D12_GPU_BASED_VALIDATION_SHADER_PATCH_MODE</a> that overrides the default device-level shader patch mode (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/nf-d3d12sdklayers-id3d12debugdevice1-setdebugparameter">ID3D12DebugDevice1::SetDebugParameter</a>).  By default this value is initialized to the <i>DefaultShaderPatchMode</i> assigned to the device (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/ns-d3d12sdklayers-d3d12_debug_device_gpu_based_validation_settings">D3D12_DEBUG_DEVICE_GPU_BASED_VALIDATION_SETTINGS</a>.
     */
    ShaderPatchMode : D3D12_GPU_BASED_VALIDATION_SHADER_PATCH_MODE

}
