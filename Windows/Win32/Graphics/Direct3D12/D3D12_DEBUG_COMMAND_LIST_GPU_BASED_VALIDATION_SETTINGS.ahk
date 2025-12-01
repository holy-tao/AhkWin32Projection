#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes per-command-list settings used by GPU-Based Validation.
 * @remarks
 * Point to an object using this structure with the <i>pData</i> member of <a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/nf-d3d12sdklayers-id3d12debugcommandlist1-setdebugparameter">ID3D12DebugCommandList1::SetDebugParameter</a> to configure per-command-list GPU-Based Validation settings.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/ns-d3d12sdklayers-d3d12_debug_command_list_gpu_based_validation_settings
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_DEBUG_COMMAND_LIST_GPU_BASED_VALIDATION_SETTINGS extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Specifies a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_gpu_based_validation_shader_patch_mode">D3D12_GPU_BASED_VALIDATION_SHADER_PATCH_MODE</a> that overrides the default device-level shader patch mode (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/nf-d3d12sdklayers-id3d12debugdevice1-setdebugparameter">ID3D12DebugDevice1::SetDebugParameter</a>).  By default this value is initialized to the <i>DefaultShaderPatchMode</i> assigned to the device (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/ns-d3d12sdklayers-d3d12_debug_device_gpu_based_validation_settings">D3D12_DEBUG_DEVICE_GPU_BASED_VALIDATION_SETTINGS</a>.
     * @type {Integer}
     */
    ShaderPatchMode {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
