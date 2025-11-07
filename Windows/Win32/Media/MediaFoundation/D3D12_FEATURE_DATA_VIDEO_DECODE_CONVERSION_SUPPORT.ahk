#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_VIDEO_DECODE_CONFIGURATION.ahk
#Include .\D3D12_VIDEO_FORMAT.ahk
#Include .\D3D12_VIDEO_SAMPLE.ahk
#Include ..\..\Graphics\Dxgi\Common\DXGI_RATIONAL.ahk
#Include .\D3D12_VIDEO_SIZE_RANGE.ahk
#Include .\D3D12_VIDEO_SCALE_SUPPORT.ahk

/**
 * Retrieves the list of supported profiles.
 * @remarks
 * 
 * If the colorspace and format conversion is supported, *ScaleFlags* will have the [D3D12\_VIDEO\_SCALE\_SUPPORT\_FLAGS](ne-d3d12video-d3d12_video_scale_support_flags.md) set. Callers should check the [D3D12\_VIDEO\_SIZE\_RANGE](ns-d3d12video-d3d12_video_size_range.md) field to determine if the requested scale is supported.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12video/ns-d3d12video-d3d12_feature_data_video_decode_conversion_support
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_FEATURE_DATA_VIDEO_DECODE_CONVERSION_SUPPORT extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * For single GPU operation, set this to zero. If there are multiple GPU nodes, set a bit to identify the node (the device's physical adapter) to which the command queue applies. Each bit in the mask corresponds to a single node. Only 1 bit may be set.
     * @type {Integer}
     */
    NodeIndex {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A [D3D12\_VIDEO\_DECODE\_CONFIGURATION](ns-d3d12video-d3d12_video_decode_configuration.md) structure describing the decode configuration.
     * @type {D3D12_VIDEO_DECODE_CONFIGURATION}
     */
    Configuration{
        get {
            if(!this.HasProp("__Configuration"))
                this.__Configuration := D3D12_VIDEO_DECODE_CONFIGURATION(8, this)
            return this.__Configuration
        }
    }

    /**
     * A [D3D12\_VIDEO\_SAMPLE](ns-d3d12video-d3d12_video_sample.md) structure representing the source decoded as sample description.
     * @type {D3D12_VIDEO_SAMPLE}
     */
    DecodeSample{
        get {
            if(!this.HasProp("__DecodeSample"))
                this.__DecodeSample := D3D12_VIDEO_SAMPLE(24, this)
            return this.__DecodeSample
        }
    }

    /**
     * A [D3D12\_VIDEO\_FORMAT](ns-d3d12video-d3d12_video_format.md) structure containing the output sample description.
     * @type {D3D12_VIDEO_FORMAT}
     */
    OutputFormat{
        get {
            if(!this.HasProp("__OutputFormat"))
                this.__OutputFormat := D3D12_VIDEO_FORMAT(40, this)
            return this.__OutputFormat
        }
    }

    /**
     * The frame rate of the video content. This is used by the driver to determine whether the video can be decoded in real-time.
     * @type {DXGI_RATIONAL}
     */
    FrameRate{
        get {
            if(!this.HasProp("__FrameRate"))
                this.__FrameRate := DXGI_RATIONAL(48, this)
            return this.__FrameRate
        }
    }

    /**
     * The average bits per second data compression rate for the compressed video stream.  This is used by the driver to determine whether the video can be decoded in real-time.
     * @type {Integer}
     */
    BitRate {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * A combination of values from the [D3D12\_VIDEO\_DECODE\_CONVERSION\_SUPPORT\_FLAGS](ne-d3d12video-d3d12_video_decode_conversion_support_flags.md) indicating the support for the specified conversion.
     * @type {Integer}
     */
    SupportFlags {
        get => NumGet(this, 60, "int")
        set => NumPut("int", value, this, 60)
    }

    /**
     * A [D3D12\_VIDEO\_SCALE\_SUPPORT](ns-d3d12video-d3d12_video_scale_support.md) structure representing the output size range for decode conversion.
     * @type {D3D12_VIDEO_SCALE_SUPPORT}
     */
    ScaleSupport{
        get {
            if(!this.HasProp("__ScaleSupport"))
                this.__ScaleSupport := D3D12_VIDEO_SCALE_SUPPORT(64, this)
            return this.__ScaleSupport
        }
    }
}
