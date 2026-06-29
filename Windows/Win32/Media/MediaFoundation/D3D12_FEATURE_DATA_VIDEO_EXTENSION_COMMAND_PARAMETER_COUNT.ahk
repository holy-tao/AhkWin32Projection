#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_STAGE.ahk" { D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_STAGE }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Retrieves the supported number of parameters for the specified parameter stage.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_feature_data_video_extension_command_parameter_count
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_FEATURE_DATA_VIDEO_EXTENSION_COMMAND_PARAMETER_COUNT {
    #StructPack 4

    /**
     * The unique identifier for the video extension command for which the parameter count is queried.
     */
    CommandId : Guid

    /**
     * A member of the [D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_STAGE](ne-d3d12video-d3d12_video_extension_command_parameter_stage.md) enumeration specifying the parameter stage for which the parameter count is retrieved.
     */
    Stage : D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_STAGE

    /**
     * Receives the number of parameters in the parameter stage.
     */
    ParameterCount : UInt32

    /**
     * Receives the parameter packing for the parameter stage.
     */
    ParameterPacking : UInt32

}
