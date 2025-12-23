#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Graphics\Dxgi\Common\DXGI_RATIONAL.ahk
#Include .\D3D12_VIDEO_SIZE_RANGE.ahk
#Include .\D3D12_VIDEO_PROCESS_LUMA_KEY.ahk

/**
 * Specifies the parameters for the input stream for a video process operation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_process_input_stream_desc
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_PROCESS_INPUT_STREAM_DESC extends Win32Struct
{
    static sizeof => 112

    static packingSize => 4

    /**
     * A value from the [DXGI_FORMAT](/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format) enumeration specifying the format of the input stream. In the case of stereo, this format is the format of both inputs.
     * @type {Integer}
     */
    Format {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * A value from the [DXGI_COLOR_SPACE_TYPE](/windows/desktop/api/dxgicommon/ne-dxgicommon-dxgi_color_space_type) enumeration specifying the color space of the video processor input and reference surfaces.
     * @type {Integer}
     */
    ColorSpace {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * A [DXGI_RATIONAL](/windows/desktop/api/dxgicommon/ns-dxgicommon-dxgi_rational) structure specifying the source aspect ratio.
     * @type {DXGI_RATIONAL}
     */
    SourceAspectRatio{
        get {
            if(!this.HasProp("__SourceAspectRatio"))
                this.__SourceAspectRatio := DXGI_RATIONAL(8, this)
            return this.__SourceAspectRatio
        }
    }

    /**
     * A [DXGI_RATIONAL](/windows/desktop/api/dxgicommon/ns-dxgicommon-dxgi_rational) structure specifying the destination aspect ratio.
     * @type {DXGI_RATIONAL}
     */
    DestinationAspectRatio{
        get {
            if(!this.HasProp("__DestinationAspectRatio"))
                this.__DestinationAspectRatio := DXGI_RATIONAL(16, this)
            return this.__DestinationAspectRatio
        }
    }

    /**
     * A [DXGI_RATIONAL](/windows/desktop/api/dxgicommon/ns-dxgicommon-dxgi_rational) structure specifying the frame rate of the input video stream.
     * @type {DXGI_RATIONAL}
     */
    FrameRate{
        get {
            if(!this.HasProp("__FrameRate"))
                this.__FrameRate := DXGI_RATIONAL(24, this)
            return this.__FrameRate
        }
    }

    /**
     * A [D3D12_VIDEO_SIZE_RANGE](ns-d3d12video-d3d12_video_size_range.md) structure representing the size of the source rectangle. This argument specifies the input range size this video processor must support for [ProcessFrames](nf-d3d12video-id3d12videoprocesscommandlist-processframes.md).  If a source size exceeds the range, the video processor must be recreated.
     * @type {D3D12_VIDEO_SIZE_RANGE}
     */
    SourceSizeRange{
        get {
            if(!this.HasProp("__SourceSizeRange"))
                this.__SourceSizeRange := D3D12_VIDEO_SIZE_RANGE(32, this)
            return this.__SourceSizeRange
        }
    }

    /**
     * A [D3D12_VIDEO_SIZE_RANGE](ns-d3d12video-d3d12_video_size_range.md) structure representing the size of the destination rectangle. This argument specifies the destination range size this video processor must support for [ProcessFrames](nf-d3d12video-id3d12videoprocesscommandlist-processframes.md).  If a source size exceeds the range, the video processor must be recreated.
     * @type {D3D12_VIDEO_SIZE_RANGE}
     */
    DestinationSizeRange{
        get {
            if(!this.HasProp("__DestinationSizeRange"))
                this.__DestinationSizeRange := D3D12_VIDEO_SIZE_RANGE(48, this)
            return this.__DestinationSizeRange
        }
    }

    /**
     * A boolean value specifying whether the video processor should support all [D3D12_VIDEO_PROCESS_ORIENTATION](ne-d3d12video-d3d12_video_process_orientation.md) for [ProcessFrames](nf-d3d12video-id3d12videoprocesscommandlist-processframes.md).
     * @type {BOOL}
     */
    EnableOrientation {
        get => NumGet(this, 64, "int")
        set => NumPut("int", value, this, 64)
    }

    /**
     * A bitwise OR combination of one or more flags from the [D3D12_VIDEO_PROCESS_FILTER_FLAGS](ne-d3d12video-d3d12_video_process_filter_flags.md) enumeration specifying the filters to enable.
     * @type {Integer}
     */
    FilterFlags {
        get => NumGet(this, 68, "int")
        set => NumPut("int", value, this, 68)
    }

    /**
     * A value from the [D3D12_VIDEO_FRAME_STEREO_FORMAT](ne-d3d12video-d3d12_video_frame_stereo_format.md) enumeration specifies whether the stream is stereo or not. A value of **D3D12_VIDEO_PROCESS_STEREO_FORMAT_SEPARATE** indicates that there will be two sets of input textures, and two sets of references for the stereo interlaced case.
     * @type {Integer}
     */
    StereoFormat {
        get => NumGet(this, 72, "int")
        set => NumPut("int", value, this, 72)
    }

    /**
     * A value from the [D3D12_VIDEO_FIELD_TYPE](ne-d3d12video-d3d12_video_field_type.md) enumeration specfying the interlaced field type of the input source. When working with mixed content, use [ID3D12VideoProcessCommandList1::ProcessFrames1](nf-d3d12video-id3d12videoprocesscommandlist1-processframes1.md) which supports changing the field type for each call.
     * @type {Integer}
     */
    FieldType {
        get => NumGet(this, 76, "int")
        set => NumPut("int", value, this, 76)
    }

    /**
     * A value from the [D3D12_VIDEO_PROCESS_DEINTERLACE_FLAGS](ne-d3d12video-d3d12_video_process_deinterlace_flags.md) enumeration specifying the deinterlace mode to use.
     * @type {Integer}
     */
    DeinterlaceMode {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * A boolean value specifying whether alpha blending is enabled. Alpha blending settings are provided to [ProcessFrames](nf-d3d12video-id3d12videoprocesscommandlist-processframes.md) with *AlphaBlending* the field of the [D3D12_VIDEO_PROCESS_INPUT_STREAM_ARGUMENTS](ns-d3d12video-d3d12_video_process_input_stream_arguments.md) structure.
     * @type {BOOL}
     */
    EnableAlphaBlending {
        get => NumGet(this, 84, "int")
        set => NumPut("int", value, this, 84)
    }

    /**
     * A [D3D12_VIDEO_PROCESS_LUMA_KEY](ns-d3d12video-d3d12_video_process_luma_key.md) structure specifying the luma key for an input stream on the video processor.
     * @type {D3D12_VIDEO_PROCESS_LUMA_KEY}
     */
    LumaKey{
        get {
            if(!this.HasProp("__LumaKey"))
                this.__LumaKey := D3D12_VIDEO_PROCESS_LUMA_KEY(88, this)
            return this.__LumaKey
        }
    }

    /**
     * An integer specifying the number of past reference frames.
     * @type {Integer}
     */
    NumPastFrames {
        get => NumGet(this, 100, "uint")
        set => NumPut("uint", value, this, 100)
    }

    /**
     * An integer specifying the number of future reference frames.
     * @type {Integer}
     */
    NumFutureFrames {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * A boolean value specifying wither automatic processing features are enabled for the video processor.
     * @type {BOOL}
     */
    EnableAutoProcessing {
        get => NumGet(this, 108, "int")
        set => NumPut("int", value, this, 108)
    }
}
