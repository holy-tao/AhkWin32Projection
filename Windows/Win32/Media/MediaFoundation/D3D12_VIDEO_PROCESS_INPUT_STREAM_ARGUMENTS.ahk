#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_VIDEO_PROCESS_ORIENTATION.ahk" { D3D12_VIDEO_PROCESS_ORIENTATION }
#Import ".\D3D12_VIDEO_PROCESS_ALPHA_BLENDING.ahk" { D3D12_VIDEO_PROCESS_ALPHA_BLENDING }
#Import ".\D3D12_VIDEO_PROCESS_INPUT_STREAM_FLAGS.ahk" { D3D12_VIDEO_PROCESS_INPUT_STREAM_FLAGS }
#Import ".\D3D12_VIDEO_PROCESS_INPUT_STREAM_RATE.ahk" { D3D12_VIDEO_PROCESS_INPUT_STREAM_RATE }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import ".\D3D12_VIDEO_PROCESS_TRANSFORM.ahk" { D3D12_VIDEO_PROCESS_TRANSFORM }
#Import ".\D3D12_VIDEO_PROCESS_REFERENCE_SET.ahk" { D3D12_VIDEO_PROCESS_REFERENCE_SET }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Graphics\Direct3D12\ID3D12Resource.ahk" { ID3D12Resource }
#Import ".\D3D12_VIDEO_PROCESS_INPUT_STREAM.ahk" { D3D12_VIDEO_PROCESS_INPUT_STREAM }

/**
 * Specifies input stream arguments for an input stream passed to ID3D12VideoCommandList::ProcessFrames.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_process_input_stream_arguments
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_PROCESS_INPUT_STREAM_ARGUMENTS {
    #StructPack 8

    /**
     * An array of [D3D12_VIDEO_PROCESS_INPUT_STREAM](ns-d3d12video-d3d12_video_process_input_stream.md) structures containing the set of references for video processing. If the stereo format is [D3D12_VIDEO_PROCESS_STEREO_FORMAT_SEPARATE](ne-d3d12video-d3d12_video_frame_stereo_format.md), then two sets of input streams must be supplied.  For all other stereo formats, the first set of reference must be supplied, and the second should be zero initialized.
     */
    InputStream : D3D12_VIDEO_PROCESS_INPUT_STREAM[2]

    /**
     * A [D3D12_VIDEO_PROCESS_TRANSFORM](ns-d3d12video-d3d12_video_process_transform.md) structure specifying the flip, rotation, scale and destination translation for the video input.
     */
    Transform : D3D12_VIDEO_PROCESS_TRANSFORM

    /**
     * A value from the [D3D12_VIDEO_PROCESS_INPUT_STREAM_FLAGS](ne-d3d12video-d3d12_video_process_input_stream_flags.md) enumeration specifying the options for the input stream.
     */
    Flags : D3D12_VIDEO_PROCESS_INPUT_STREAM_FLAGS

    /**
     * A [D3D12_VIDEO_PROCESS_INPUT_STREAM_RATE](ns-d3d12video-d3d12_video_process_input_stream_rate.md) structure specifying the framerate and input and output indices for framerate conversion and deinterlacing.
     */
    RateInfo : D3D12_VIDEO_PROCESS_INPUT_STREAM_RATE

    /**
     * The level to apply for each enabled filter.  The filter level is specified in the order that filters appear in the [D3D12_VIDEO_PROCESS_FILTER_FLAGS](ne-d3d12video-d3d12_video_process_filter_flags.md) enumeration.  Specify 0 if a filter is not enabled or the filter index is reserved.
     */
    FilterLevels : Int32[32]

    /**
     * A [D3D12_VIDEO_PROCESS_ALPHA_BLENDING](ns-d3d12video-d3d12_video_process_alpha_blending.md) structure specifying the planar alpha for an input stream on the video processor.
     */
    AlphaBlending : D3D12_VIDEO_PROCESS_ALPHA_BLENDING

}
