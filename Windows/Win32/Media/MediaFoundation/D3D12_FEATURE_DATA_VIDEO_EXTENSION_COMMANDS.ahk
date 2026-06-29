#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_VIDEO_EXTENSION_COMMAND_INFO.ahk" { D3D12_VIDEO_EXTENSION_COMMAND_INFO }

/**
 * Retrieves the list of video extension commands from the driver.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_feature_data_video_extension_commands
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_FEATURE_DATA_VIDEO_EXTENSION_COMMANDS {
    #StructPack 8

    /**
     * In multi-adapter operation, this indicates which physical adapter of the device this operation applies to.
     */
    NodeIndex : UInt32

    /**
     * The supported number of video extension commands. This value must be the count returned by a call to[ID3D12VideoDevice::CheckFeatureSupport](nf-d3d12video-id3d12videodevice-checkfeaturesupport.md) with  [D3D12_FEATURE_VIDEO_EXTENSION_COMMAND_COUNT](ne-d3d12video-d3d12_feature_video.md) specified as the feature.
     */
    CommandCount : UInt32

    /**
     * Receives a list of [D3D12_VIDEO_EXTENSION_COMMAND_INFO](ns-d3d12video-d3d12_video_extension_command_info.md) structures describing video extension commands.
     */
    pCommandInfos : D3D12_VIDEO_EXTENSION_COMMAND_INFO.Ptr

}
