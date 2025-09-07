#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies how GPU-Based Validation handles patched pipeline states during ID3D12Device::CreateGraphicsPipelineState and ID3D12Device::CreateComputePipelineState.
 * @remarks
 * This enum is used by the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/ns-d3d12sdklayers-d3d12_debug_device_gpu_based_validation_settings">D3D12_DEBUG_DEVICE_GPU_BASED_VALIDATION_SETTINGS</a> structure.
  * 
  * Generally speaking most application developers are likely to leave this parameter unchanged.  However, if the overhead of deferring patched PSO creation is suspected to be too much of a performance problem, then developers should consider changing this setting.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_gpu_based_validation_pipeline_state_create_flags
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_GPU_BASED_VALIDATION_PIPELINE_STATE_CREATE_FLAGS{

    /**
     * This is the default value.  Indicates no patching of pipeline states should be done during PSO creation.  Instead PSO’s are patched on first use in a command list.  This can help to reduce the up-front cost of PSO creation but may instead slow down command list recording until a steady-state is reached.
     * @type {Integer (Int32)}
     */
    static D3D12_GPU_BASED_VALIDATION_PIPELINE_STATE_CREATE_FLAG_NONE => 0

    /**
     * Indicates that state-tracking GPU-Based Validation PSO’s should be created along with the original PSO at create time.
     * @type {Integer (Int32)}
     */
    static D3D12_GPU_BASED_VALIDATION_PIPELINE_STATE_CREATE_FLAG_FRONT_LOAD_CREATE_TRACKING_ONLY_SHADERS => 1

    /**
     * Indicates that unguarded GPU-Based Validation PSO’s should be created along with the original PSO at create time.
     * @type {Integer (Int32)}
     */
    static D3D12_GPU_BASED_VALIDATION_PIPELINE_STATE_CREATE_FLAG_FRONT_LOAD_CREATE_UNGUARDED_VALIDATION_SHADERS => 2

    /**
     * Indicates that guarded GPU-Based Validation PSO’s should be created along with the original PSO at create time.
     * @type {Integer (Int32)}
     */
    static D3D12_GPU_BASED_VALIDATION_PIPELINE_STATE_CREATE_FLAG_FRONT_LOAD_CREATE_GUARDED_VALIDATION_SHADERS => 4

    /**
     * Internal use only.
     * @type {Integer (Int32)}
     */
    static D3D12_GPU_BASED_VALIDATION_PIPELINE_STATE_CREATE_FLAGS_VALID_MASK => 7
}
