#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_GPU_BASED_VALIDATION_PIPELINE_STATE_CREATE_FLAGS.ahk" { D3D12_GPU_BASED_VALIDATION_PIPELINE_STATE_CREATE_FLAGS }
#Import ".\D3D12_GPU_BASED_VALIDATION_SHADER_PATCH_MODE.ahk" { D3D12_GPU_BASED_VALIDATION_SHADER_PATCH_MODE }

/**
 * Describes settings used by GPU-Based Validation.
 * @remarks
 * Point to an object using this structure with the <i>pData</i> member of <a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/nf-d3d12sdklayers-id3d12debugdevice1-setdebugparameter">ID3D12DebugDevice1::SetDebugParameter</a> to configure device-wide GPU-Based Validation settings.  
 * 
 * Individual command lists can override the default shader patch mode using <a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/nf-d3d12sdklayers-id3d12debugcommandlist1-setdebugparameter">ID3D12DebugCommandList1::SetDebugParameter</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/ns-d3d12sdklayers-d3d12_debug_device_gpu_based_validation_settings
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_DEBUG_DEVICE_GPU_BASED_VALIDATION_SETTINGS {
    #StructPack 4

    /**
     * Specifies a UINT that limits the number of messages that can be stored in the GPU-Based Validation message log.  The default value is 256.  Since many identical errors can be produced in a single Draw/Dispatch call it may be useful to increase this number.  Note this can become a memory burden if a large number of command lists are used as there is a committed message log per command list.
     */
    MaxMessagesPerCommandList : UInt32

    /**
     * Specifies the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_gpu_based_validation_shader_patch_mode">D3D12_GPU_BASED_VALIDATION_SHADER_PATCH_MODE</a> that GPU-Based Validation uses when injecting validation code into shaders, except when overridden by per-command-list GPU-Based Validation settings (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/ns-d3d12sdklayers-d3d12_debug_command_list_gpu_based_validation_settings">D3D12_DEBUG_COMMAND_LIST_GPU_BASED_VALIDATION_SETTINGS</a>).  The default value is D3D12_GPU_BASED_VALIDATION_SHADER_PATCH_MODE_UNGUARDED_VALIDATION.
     */
    DefaultShaderPatchMode : D3D12_GPU_BASED_VALIDATION_SHADER_PATCH_MODE

    /**
     * Specifies one of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_gpu_based_validation_pipeline_state_create_flags">D3D12_GPU_BASED_VALIDATION_PIPELINE_STATE_CREATE_FLAGS</a> that indicates how GPU-Based Validation handles patching pipeline states.  The default value is D3D12_GPU_BASED_VALIDATION_PIPELINE_STATE_CREATE_FLAG_NONE.
     */
    PipelineStateCreateFlags : D3D12_GPU_BASED_VALIDATION_PIPELINE_STATE_CREATE_FLAGS

}
