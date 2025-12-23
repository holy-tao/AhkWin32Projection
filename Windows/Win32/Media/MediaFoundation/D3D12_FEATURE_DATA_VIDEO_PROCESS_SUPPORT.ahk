#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_VIDEO_FORMAT.ahk
#Include .\D3D12_VIDEO_SAMPLE.ahk
#Include ..\..\Graphics\Dxgi\Common\DXGI_RATIONAL.ahk
#Include .\D3D12_VIDEO_SIZE_RANGE.ahk
#Include .\D3D12_VIDEO_SCALE_SUPPORT.ahk
#Include .\D3D12_VIDEO_PROCESS_FILTER_RANGE.ahk

/**
 * Provides data for calls to ID3D12VideoDevice::CheckFeatureSupport when the feature specified is D3D12_FEATURE_VIDEO_PROCESS_SUPPORT.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_feature_data_video_process_support
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_FEATURE_DATA_VIDEO_PROCESS_SUPPORT extends Win32Struct
{
    static sizeof => 352

    static packingSize => 8

    /**
     * An integer indicating which physical adapter of the device the operation applies to, in a multi-adapter operation.
     * @type {Integer}
     */
    NodeIndex {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A [D3D12\_VIDEO\_SAMPLE](ns-d3d12video-d3d12_video_sample.md) structure defining the width, height, and format of the input sample.
     * @type {D3D12_VIDEO_SAMPLE}
     */
    InputSample{
        get {
            if(!this.HasProp("__InputSample"))
                this.__InputSample := D3D12_VIDEO_SAMPLE(4, this)
            return this.__InputSample
        }
    }

    /**
     * A member of the [D3D12\_VIDEO\_FIELD\_TYPE](ne-d3d12video-d3d12_video_field_type.md) enumeration specifying the interlaced field type of the input sample.
     * @type {Integer}
     */
    InputFieldType {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * A member of the [D3D12\_VIDEO\_FRAME\_STEREO\_FORMAT](ne-d3d12video-d3d12_video_frame_stereo_format.md) enumeration specifying the stereo format of the input sample.
     * @type {Integer}
     */
    InputStereoFormat {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * The input frame rate.
     * @type {DXGI_RATIONAL}
     */
    InputFrameRate{
        get {
            if(!this.HasProp("__InputFrameRate"))
                this.__InputFrameRate := DXGI_RATIONAL(28, this)
            return this.__InputFrameRate
        }
    }

    /**
     * A [D3D12\_VIDEO\_FORMAT](ns-d3d12video-d3d12_video_format.md) structure specifying the output DXGI format and color space.
     * @type {D3D12_VIDEO_FORMAT}
     */
    OutputFormat{
        get {
            if(!this.HasProp("__OutputFormat"))
                this.__OutputFormat := D3D12_VIDEO_FORMAT(36, this)
            return this.__OutputFormat
        }
    }

    /**
     * A member of the [D3D12\_VIDEO\_FRAME\_STEREO\_FORMAT](ne-d3d12video-d3d12_video_frame_stereo_format.md) enumeration specifying the stereo format of the output.
     * @type {Integer}
     */
    OutputStereoFormat {
        get => NumGet(this, 44, "int")
        set => NumPut("int", value, this, 44)
    }

    /**
     * The output frame rate.
     * @type {DXGI_RATIONAL}
     */
    OutputFrameRate{
        get {
            if(!this.HasProp("__OutputFrameRate"))
                this.__OutputFrameRate := DXGI_RATIONAL(48, this)
            return this.__OutputFrameRate
        }
    }

    /**
     * A member of the [D3D12\_VIDEO\_PROCESS\_SUPPORT\_FLAGS](ne-d3d12video-d3d12_video_process_support_flags.md) indicating whether the requested format and colorspace conversion is supported. This value is populated by the call to **ID3D12Device::CheckFeatureSupport**.
     * @type {Integer}
     */
    SupportFlags {
        get => NumGet(this, 56, "int")
        set => NumPut("int", value, this, 56)
    }

    /**
     * A [D3D12\_VIDEO\_SCALE\_SUPPORT](ns-d3d12video-d3d12_video_scale_support.md) structure specifying the supported scaling capabilities. This value is populated by the call to **ID3D12Device::CheckFeatureSupport**.
     * @type {D3D12_VIDEO_SCALE_SUPPORT}
     */
    ScaleSupport{
        get {
            if(!this.HasProp("__ScaleSupport"))
                this.__ScaleSupport := D3D12_VIDEO_SCALE_SUPPORT(60, this)
            return this.__ScaleSupport
        }
    }

    /**
     * A bitwise OR combination of values from the [D3D12\_VIDEO\_PROCESS\_FEATURE\_FLAGS](ne-d3d12video-d3d12_video_process_feature_flags.md) enumeration specifying the supported video processing features. This value is populated by the call to **ID3D12Device::CheckFeatureSupport**.
     * @type {Integer}
     */
    FeatureSupport {
        get => NumGet(this, 80, "int")
        set => NumPut("int", value, this, 80)
    }

    /**
     * A member of the [D3D12\_VIDEO\_PROCESS\_DEINTERLACE\_FLAGS](ne-d3d12video-d3d12_video_process_deinterlace_flags.md) enumeration specifying the supported deinterlacing capabilities. This value is populated by the call to **ID3D12Device::CheckFeatureSupport**.
     * @type {Integer}
     */
    DeinterlaceSupport {
        get => NumGet(this, 84, "uint")
        set => NumPut("uint", value, this, 84)
    }

    /**
     * A member of the [D3D12\_VIDEO\_PROCESS\_AUTO\_PROCESSING\_FLAGS](ne-d3d12video-d3d12_video_process_auto_processing_flags.md) specifying the supported automatic processing capabilities. This value is populated by the call to **ID3D12Device::CheckFeatureSupport**.
     * @type {Integer}
     */
    AutoProcessingSupport {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * A bitwise OR combination of values from the [D3D12\_VIDEO\_PROCESS\_FILTER\_FLAGS](ne-d3d12video-d3d12_video_process_filter_flags.md) enumeration specifying the supported video filtering features. This value is populated by the call to **ID3D12Device::CheckFeatureSupport**.
     * @type {Integer}
     */
    FilterSupport {
        get => NumGet(this, 92, "int")
        set => NumPut("int", value, this, 92)
    }

    /**
     * An array of [D3D12\_VIDEO\_PROCESS\_FILTER\_RANGE](ns-d3d12video-d3d12_video_process_filter_range.md) structures representing the filter range values.  This value is populated by the call to **ID3D12Device::CheckFeatureSupport**. The calling application must allocate the memory for the filter range list before calling **CheckFeatureSupport**.
     * @type {Array<D3D12_VIDEO_PROCESS_FILTER_RANGE>}
     */
    FilterRangeSupport{
        get {
            if(!this.HasProp("__FilterRangeSupportProxyArray"))
                this.__FilterRangeSupportProxyArray := Win32FixedArray(this.ptr + 96, 32, D3D12_VIDEO_PROCESS_FILTER_RANGE, "")
            return this.__FilterRangeSupportProxyArray
        }
    }
}
