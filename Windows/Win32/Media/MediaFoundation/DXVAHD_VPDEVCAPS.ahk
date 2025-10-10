#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies the capabilities of a Microsoft DirectX Video Acceleration High Definition (DXVA-HD) device.
 * @remarks
 * 
  * In DXVA-HD, the device stores state information for each input stream. These states persist between blits. With each blit, the application selects which streams to enable or disable. Disabling a stream does not affect the state information for that stream.
  * 
  * 
  * 
  * The <b>MaxStreamStates</b> member gives the maximum number of stream states that can be set by the application. The <b>MaxInputStreams</b> member gives the maximum number of streams that can be enabled during a blit. These two values can differ.
  * 
  * To set the state data for a stream, call <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nf-dxvahd-idxvahd_videoprocessor-setvideoprocessstreamstate">IDXVAHD_VideoProcessor::SetVideoProcessStreamState</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dxvahd/ns-dxvahd-dxvahd_vpdevcaps
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class DXVAHD_VPDEVCAPS extends Win32Struct
{
    static sizeof => 44

    static packingSize => 4

    /**
     * Specifies the device type, as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ne-dxvahd-dxvahd_device_type">DXVAHD_DEVICE_TYPE</a> enumeration.
     * @type {Integer}
     */
    DeviceType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * A bitwise <b>OR</b> of zero or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ne-dxvahd-dxvahd_device_caps">DXVAHD_DEVICE_CAPS</a> enumeration.
     * @type {Integer}
     */
    DeviceCaps {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A bitwise <b>OR</b> of zero or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ne-dxvahd-dxvahd_feature_caps">DXVAHD_FEATURE_CAPS</a> enumeration.
     * @type {Integer}
     */
    FeatureCaps {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * A bitwise <b>OR</b> of zero or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ne-dxvahd-dxvahd_filter_caps">DXVAHD_FILTER_CAPS</a> enumeration.
     * @type {Integer}
     */
    FilterCaps {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * A bitwise <b>OR</b> of zero or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ne-dxvahd-dxvahd_input_format_caps">DXVAHD_INPUT_FORMAT_CAPS</a> enumeration.
     * @type {Integer}
     */
    InputFormatCaps {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The memory pool that is required for the input video surfaces.
     * @type {Integer}
     */
    InputPool {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * The number of supported output formats. To get the list of output formats, call the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nf-dxvahd-idxvahd_device-getvideoprocessoroutputformats">IDXVAHD_Device::GetVideoProcessorOutputFormats</a> method.
     * @type {Integer}
     */
    OutputFormatCount {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The number of supported input formats. To get the list of input formats, call the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nf-dxvahd-idxvahd_device-getvideoprocessorinputformats">IDXVAHD_Device::GetVideoProcessorInputFormats</a> method.
     * @type {Integer}
     */
    InputFormatCount {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * The number of video processors. Each video processor represents a  distinct set of processing capabilities. To get the capabilities of each video processor, call the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nf-dxvahd-idxvahd_device-getvideoprocessorcaps">IDXVAHD_Device::GetVideoProcessorCaps</a> method. To create a video processor, call the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nf-dxvahd-idxvahd_device-createvideoprocessor">IDXVAHD_Device::CreateVideoProcessor</a> method.
     * @type {Integer}
     */
    VideoProcessorCount {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * The maximum number of input streams that can be enabled at the same time.
     * @type {Integer}
     */
    MaxInputStreams {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * The maximum number of input streams for which the device can store state data.
     * @type {Integer}
     */
    MaxStreamStates {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }
}
