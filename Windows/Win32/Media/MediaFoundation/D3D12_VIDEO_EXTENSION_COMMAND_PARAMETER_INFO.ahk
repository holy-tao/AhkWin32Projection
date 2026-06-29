#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_FLAGS.ahk" { D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_FLAGS }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_TYPE.ahk" { D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_TYPE }

/**
 * Describes a video extension command parameter.
 * @remarks
 * An array of this structure is provided in a [D3D12_FEATURE_DATA_VIDEO_EXTENSION_COMMAND_PARAMETERS](ns-d3d12video-d3d12_feature_data_video_extension_command_parameters.md) structure returned from a call to[ID3D12VideoDevice::CheckFeatureSupport](nf-d3d12video-id3d12videodevice-checkfeaturesupport.md) when the feature specified is [D3D12_FEATURE_VIDEO_EXTENSION_COMMAND_PARAMETERS](ne-d3d12video-d3d12_feature_video.md).
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_extension_command_parameter_info
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_INFO {
    #StructPack 8

    /**
     * A pointer to a wide string containing the name of the command.
     */
    Name : PWSTR

    /**
     * A member of the [D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_TYPE](ne-d3d12video-d3d12_video_extension_command_parameter_type.md) specifying the type of the parameter.
     */
    Type : D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_TYPE

    /**
     * A member of the [D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_FLAGS](ne-d3d12video-d3d12_video_extension_command_parameter_flags.md) enumeration specifying the usage of the parameter.
     */
    Flags : D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_FLAGS

}
