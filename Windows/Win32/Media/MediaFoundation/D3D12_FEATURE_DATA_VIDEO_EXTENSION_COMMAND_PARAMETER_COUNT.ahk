#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Retrieves the supported number of parameters for the specified parameter stage.
 * @remarks
 * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12video/ns-d3d12video-d3d12_feature_data_video_extension_command_parameter_count
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_FEATURE_DATA_VIDEO_EXTENSION_COMMAND_PARAMETER_COUNT extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The unique identifier for the video extension command for which the parameter count is queried.
     * @type {Pointer<Guid>}
     */
    CommandId {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A member of the [D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_STAGE](ne-d3d12video-d3d12_video_extension_command_parameter_stage.md) enumeration specifying the parameter stage for which the parameter count is retrieved.
     * @type {Integer}
     */
    Stage {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Receives the number of parameters in the parameter stage.
     * @type {Integer}
     */
    ParameterCount {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Receives the parameter packing for the parameter stage.
     * @type {Integer}
     */
    ParameterPacking {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
