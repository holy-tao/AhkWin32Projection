#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_INFO.ahk" { D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_INFO }
#Import ".\D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_STAGE.ahk" { D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_STAGE }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Retrieves the list of video extension command parameters for the specified parameter stage.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_feature_data_video_extension_command_parameters
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_FEATURE_DATA_VIDEO_EXTENSION_COMMAND_PARAMETERS {
    #StructPack 8

    /**
     * The unique identifier for the video extension command for which parameters are retrieved.
     */
    CommandId : Guid

    /**
     * A member of the [D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_STAGE](ne-d3d12video-d3d12_video_extension_command_parameter_stage.md) enumeration specifying the parameter stage for which the parameters are retrieved.
     */
    Stage : D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_STAGE

    /**
     * The supported number of video extension command parameters. This value must be the count returned by a call to[ID3D12VideoDevice::CheckFeatureSupport](nf-d3d12video-id3d12videodevice-checkfeaturesupport.md) with  [D3D12_FEATURE_VIDEO_EXTENSION_COMMAND_PARAMETER_COUNT](ne-d3d12video-d3d12_feature_video.md) specified as the feature.
     */
    ParameterCount : UInt32

    /**
     * Receives a list of [D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_INFO](ns-d3d12video-d3d12_video_extension_command_parameter_info.md) structures describing video extension command parameters.
     */
    pParameterInfos : D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_INFO.Ptr

}
