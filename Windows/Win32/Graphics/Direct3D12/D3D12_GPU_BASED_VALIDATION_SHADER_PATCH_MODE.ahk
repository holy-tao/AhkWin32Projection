#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the type of shader patching used by GPU-Based Validation at either the device or command list level.
 * @remarks
 * This enum is used by the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/ns-d3d12sdklayers-d3d12_debug_device_gpu_based_validation_settings">D3D12_DEBUG_DEVICE_GPU_BASED_VALIDATION_SETTINGS</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_gpu_based_validation_shader_patch_mode
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_GPU_BASED_VALIDATION_SHADER_PATCH_MODE{

    /**
     * No shader patching is to be done.  This will retain the original shader bytecode.  Can lead to errors in some of the GPU-Based Validation state tracking as the unpatched shader may still change resource state (see <a href="https://docs.microsoft.com/windows/desktop/direct3d12/using-resource-barriers-to-synchronize-resource-states-in-direct3d-12">Common state promotion</a>) but the promotion will be untracked without patching the shader.  This can improve performance but no validation will be performed and may also lead to misleading GPU-Based Validation errors. Use this mode very carefully.
     * @type {Integer (Int32)}
     */
    static D3D12_GPU_BASED_VALIDATION_SHADER_PATCH_MODE_NONE => 0

    /**
     * Shaders can be patched with resource state tracking code but no validation.  This may improve performance but no validation will be performed.
     * @type {Integer (Int32)}
     */
    static D3D12_GPU_BASED_VALIDATION_SHADER_PATCH_MODE_STATE_TRACKING_ONLY => 1

    /**
     * The default. Shaders are patched with validation code but erroneous instructions will still be executed.
     * @type {Integer (Int32)}
     */
    static D3D12_GPU_BASED_VALIDATION_SHADER_PATCH_MODE_UNGUARDED_VALIDATION => 2

    /**
     * Shaders are patched with validation code and erroneous instructions are skipped in execution.  This can help avoid crashes or device removal.
     * @type {Integer (Int32)}
     */
    static D3D12_GPU_BASED_VALIDATION_SHADER_PATCH_MODE_GUARDED_VALIDATION => 3

    /**
     * Unused, simply the count of the number of modes.
     * @type {Integer (Int32)}
     */
    static NUM_D3D12_GPU_BASED_VALIDATION_SHADER_PATCH_MODES => 4
}
