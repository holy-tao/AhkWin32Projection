#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_VIDEO_PROCESS_DEINTERLACE_FLAGS.ahk" { D3D12_VIDEO_PROCESS_DEINTERLACE_FLAGS }
#Import "..\..\Graphics\Dxgi\Common\DXGI_RATIONAL.ahk" { DXGI_RATIONAL }
#Import "..\..\Graphics\Dxgi\Common\DXGI_COLOR_SPACE_TYPE.ahk" { DXGI_COLOR_SPACE_TYPE }
#Import ".\D3D12_VIDEO_FIELD_TYPE.ahk" { D3D12_VIDEO_FIELD_TYPE }
#Import ".\D3D12_VIDEO_SIZE_RANGE.ahk" { D3D12_VIDEO_SIZE_RANGE }
#Import ".\D3D12_VIDEO_FRAME_STEREO_FORMAT.ahk" { D3D12_VIDEO_FRAME_STEREO_FORMAT }
#Import ".\D3D12_VIDEO_PROCESS_FILTER_FLAGS.ahk" { D3D12_VIDEO_PROCESS_FILTER_FLAGS }
#Import "..\..\Graphics\Dxgi\Common\DXGI_FORMAT.ahk" { DXGI_FORMAT }
#Import ".\D3D12_VIDEO_PROCESS_LUMA_KEY.ahk" { D3D12_VIDEO_PROCESS_LUMA_KEY }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Specifies the parameters for the input stream for a video process operation.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_process_input_stream_desc
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_PROCESS_INPUT_STREAM_DESC {
    #StructPack 4

    /**
     * A value from the [DXGI_FORMAT](/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format) enumeration specifying the format of the input stream. In the case of stereo, this format is the format of both inputs.
     */
    Format : DXGI_FORMAT

    /**
     * A value from the [DXGI_COLOR_SPACE_TYPE](/windows/desktop/api/dxgicommon/ne-dxgicommon-dxgi_color_space_type) enumeration specifying the color space of the video processor input and reference surfaces.
     */
    ColorSpace : DXGI_COLOR_SPACE_TYPE

    /**
     * A [DXGI_RATIONAL](/windows/desktop/api/dxgicommon/ns-dxgicommon-dxgi_rational) structure specifying the source aspect ratio.
     */
    SourceAspectRatio : DXGI_RATIONAL

    /**
     * A [DXGI_RATIONAL](/windows/desktop/api/dxgicommon/ns-dxgicommon-dxgi_rational) structure specifying the destination aspect ratio.
     */
    DestinationAspectRatio : DXGI_RATIONAL

    /**
     * A [DXGI_RATIONAL](/windows/desktop/api/dxgicommon/ns-dxgicommon-dxgi_rational) structure specifying the frame rate of the input video stream.
     */
    FrameRate : DXGI_RATIONAL

    /**
     * A [D3D12_VIDEO_SIZE_RANGE](ns-d3d12video-d3d12_video_size_range.md) structure representing the size of the source rectangle. This argument specifies the input range size this video processor must support for [ProcessFrames](nf-d3d12video-id3d12videoprocesscommandlist-processframes.md).  If a source size exceeds the range, the video processor must be recreated.
     */
    SourceSizeRange : D3D12_VIDEO_SIZE_RANGE

    /**
     * A [D3D12_VIDEO_SIZE_RANGE](ns-d3d12video-d3d12_video_size_range.md) structure representing the size of the destination rectangle. This argument specifies the destination range size this video processor must support for [ProcessFrames](nf-d3d12video-id3d12videoprocesscommandlist-processframes.md).  If a source size exceeds the range, the video processor must be recreated.
     */
    DestinationSizeRange : D3D12_VIDEO_SIZE_RANGE

    /**
     * A boolean value specifying whether the video processor should support all [D3D12_VIDEO_PROCESS_ORIENTATION](ne-d3d12video-d3d12_video_process_orientation.md) for [ProcessFrames](nf-d3d12video-id3d12videoprocesscommandlist-processframes.md).
     */
    EnableOrientation : BOOL

    /**
     * A bitwise OR combination of one or more flags from the [D3D12_VIDEO_PROCESS_FILTER_FLAGS](ne-d3d12video-d3d12_video_process_filter_flags.md) enumeration specifying the filters to enable.
     */
    FilterFlags : D3D12_VIDEO_PROCESS_FILTER_FLAGS

    /**
     * A value from the [D3D12_VIDEO_FRAME_STEREO_FORMAT](ne-d3d12video-d3d12_video_frame_stereo_format.md) enumeration specifies whether the stream is stereo or not. A value of **D3D12_VIDEO_PROCESS_STEREO_FORMAT_SEPARATE** indicates that there will be two sets of input textures, and two sets of references for the stereo interlaced case.
     */
    StereoFormat : D3D12_VIDEO_FRAME_STEREO_FORMAT

    /**
     * A value from the [D3D12_VIDEO_FIELD_TYPE](ne-d3d12video-d3d12_video_field_type.md) enumeration specfying the interlaced field type of the input source. When working with mixed content, use [ID3D12VideoProcessCommandList1::ProcessFrames1](nf-d3d12video-id3d12videoprocesscommandlist1-processframes1.md) which supports changing the field type for each call.
     */
    FieldType : D3D12_VIDEO_FIELD_TYPE

    /**
     * A value from the [D3D12_VIDEO_PROCESS_DEINTERLACE_FLAGS](ne-d3d12video-d3d12_video_process_deinterlace_flags.md) enumeration specifying the deinterlace mode to use.
     */
    DeinterlaceMode : D3D12_VIDEO_PROCESS_DEINTERLACE_FLAGS

    /**
     * A boolean value specifying whether alpha blending is enabled. Alpha blending settings are provided to [ProcessFrames](nf-d3d12video-id3d12videoprocesscommandlist-processframes.md) with *AlphaBlending* the field of the [D3D12_VIDEO_PROCESS_INPUT_STREAM_ARGUMENTS](ns-d3d12video-d3d12_video_process_input_stream_arguments.md) structure.
     */
    EnableAlphaBlending : BOOL

    /**
     * A [D3D12_VIDEO_PROCESS_LUMA_KEY](ns-d3d12video-d3d12_video_process_luma_key.md) structure specifying the luma key for an input stream on the video processor.
     */
    LumaKey : D3D12_VIDEO_PROCESS_LUMA_KEY

    /**
     * An integer specifying the number of past reference frames.
     */
    NumPastFrames : UInt32

    /**
     * An integer specifying the number of future reference frames.
     */
    NumFutureFrames : UInt32

    /**
     * A boolean value specifying wither automatic processing features are enabled for the video processor.
     */
    EnableAutoProcessing : BOOL

}
