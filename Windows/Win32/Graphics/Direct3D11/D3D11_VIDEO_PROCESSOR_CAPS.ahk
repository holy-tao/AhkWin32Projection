#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the capabilities of a Microsoft Direct3D 11 video processor.
 * @remarks
 * The video processor stores state information for each input stream. These states persist between blits. With each blit, the application selects which streams to enable or disable. Disabling a stream does not affect the state information for that stream.
 * 
 * The <b>MaxStreamStates</b> member gives the maximum number of stream states that can be saved. The <b>MaxInputStreams</b> member gives the maximum number of streams that can be enabled during a blit. These two values can differ.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_video_processor_caps
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_VIDEO_PROCESSOR_CAPS extends Win32Struct
{
    static sizeof => 36

    static packingSize => 4

    /**
     * A bitwise <b>OR</b> of zero or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_video_processor_device_caps">D3D11_VIDEO_PROCESSOR_DEVICE_CAPS</a>  enumeration.
     * @type {Integer}
     */
    DeviceCaps {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A bitwise <b>OR</b> of zero or more flags from the   <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_video_processor_feature_caps">D3D11_VIDEO_PROCESSOR_FEATURE_CAPS</a> enumeration.
     * @type {Integer}
     */
    FeatureCaps {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A bitwise <b>OR</b> of zero or more flags from the  <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_video_processor_filter_caps">D3D11_VIDEO_PROCESSPR_FILTER_CAPS</a> enumeration.
     * @type {Integer}
     */
    FilterCaps {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * A bitwise <b>OR</b> of zero or more flags from the  <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_video_processor_format_caps">D3D11_VIDEO_PROCESSOR_FORMAT_CAPS</a> enumeration.
     * @type {Integer}
     */
    InputFormatCaps {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * A bitwise <b>OR</b> of zero or more flags from the  <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_video_processor_auto_stream_caps">D3D11_VIDEO_PROCESSOR_AUTO_STREAM_CAPS</a> enumeration.
     * @type {Integer}
     */
    AutoStreamCaps {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * A bitwise <b>OR</b> of zero or more flags from the   <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_video_processor_stereo_caps">D3D11_VIDEO_PROCESSOR_STEREO_CAPS</a> enumeration.
     * @type {Integer}
     */
    StereoCaps {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * The number of frame-rate conversion capabilities. To enumerate the frame-rate conversion capabilities, call the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videoprocessorenumerator-getvideoprocessorrateconversioncaps">ID3D11VideoProcessorEnumerator::GetVideoProcessorRateConversionCaps</a> method.
     * @type {Integer}
     */
    RateConversionCapsCount {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The maximum number of input streams that can be enabled at the same time.
     * @type {Integer}
     */
    MaxInputStreams {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * The maximum number of input streams for which the device can store state data.
     * @type {Integer}
     */
    MaxStreamStates {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}
