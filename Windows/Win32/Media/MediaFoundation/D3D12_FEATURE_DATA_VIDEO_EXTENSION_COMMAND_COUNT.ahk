#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Retrieves the number of video extension commands.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_feature_data_video_extension_command_count
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_FEATURE_DATA_VIDEO_EXTENSION_COMMAND_COUNT {
    #StructPack 4

    /**
     * In multi-adapter operation, this indicates which physical adapter of the device this operation applies to.
     */
    NodeIndex : UInt32

    /**
     * The supported number of video extension commands.
     */
    CommandCount : UInt32

}
