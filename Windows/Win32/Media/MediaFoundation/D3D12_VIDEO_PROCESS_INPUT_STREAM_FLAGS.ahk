#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies flags for video processing input streams.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ne-d3d12video-d3d12_video_process_input_stream_flags
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_PROCESS_INPUT_STREAM_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * No flags specified.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_PROCESS_INPUT_STREAM_FLAG_NONE => 0

    /**
     * Set this flag when not processing frames in order, such as seeking between frames
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_PROCESS_INPUT_STREAM_FLAG_FRAME_DISCONTINUITY => 1

    /**
     * Set this flag when applying video process operation to the same set of inputs.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_PROCESS_INPUT_STREAM_FLAG_FRAME_REPEAT => 2
}
