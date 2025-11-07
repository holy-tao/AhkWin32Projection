#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a video extension command parameter.
 * @remarks
 * 
 * An array of this structure is provided in a [D3D12_FEATURE_DATA_VIDEO_EXTENSION_COMMAND_PARAMETERS](ns-d3d12video-d3d12_feature_data_video_extension_command_parameters.md) structure returned from a call to[ID3D12VideoDevice::CheckFeatureSupport](nf-d3d12video-id3d12videodevice-checkfeaturesupport.md) when the feature specified is [D3D12_FEATURE_VIDEO_EXTENSION_COMMAND_PARAMETERS](ne-d3d12video-d3d12_feature_video.md).
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12video/ns-d3d12video-d3d12_video_extension_command_parameter_info
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A pointer to a wide string containing the name of the command.
     * @type {PWSTR}
     */
    Name {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A member of the [D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_TYPE](ne-d3d12video-d3d12_video_extension_command_parameter_type.md) specifying the type of the parameter.
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * A member of the [D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_FLAGS](ne-d3d12video-d3d12_video_extension_command_parameter_flags.md) enumeration specifying the usage of the parameter.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }
}
