#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Retrieves the maximum number of enabled input streams supported by the video processor.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_feature_data_video_process_max_input_streams
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_FEATURE_DATA_VIDEO_PROCESS_MAX_INPUT_STREAMS {
    #StructPack 4

    /**
     * An integer indicating which physical adapter of the device the operation applies to, in a multi-adapter operation.
     */
    NodeIndex : UInt32

    /**
     * The maximum number of streams that can be enabled for the video processor at the same time.
     */
    MaxInputStreams : UInt32

}
