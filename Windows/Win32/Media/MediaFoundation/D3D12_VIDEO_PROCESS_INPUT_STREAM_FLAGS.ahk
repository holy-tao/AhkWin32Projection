#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies flags for video processing input streams.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ne-d3d12video-d3d12_video_process_input_stream_flags
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class D3D12_VIDEO_PROCESS_INPUT_STREAM_FLAGS extends Win32BitflagEnum {

    /**
     * No flags specified.
     * Native name: D3D12_VIDEO_PROCESS_INPUT_STREAM_FLAG_NONE
     * @type {Integer (Int32)}
     */
    static FLAG_NONE => 0

    /**
     * Set this flag when not processing frames in order, such as seeking between frames
     * Native name: D3D12_VIDEO_PROCESS_INPUT_STREAM_FLAG_FRAME_DISCONTINUITY
     * @type {Integer (Int32)}
     */
    static FLAG_FRAME_DISCONTINUITY => 1

    /**
     * Set this flag when applying video process operation to the same set of inputs.
     * Native name: D3D12_VIDEO_PROCESS_INPUT_STREAM_FLAG_FRAME_REPEAT
     * @type {Integer (Int32)}
     */
    static FLAG_FRAME_REPEAT => 2
}
