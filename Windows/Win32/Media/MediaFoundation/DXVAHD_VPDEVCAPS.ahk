#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Graphics\Direct3D9\D3DPOOL.ahk" { D3DPOOL }
#Import ".\DXVAHD_DEVICE_TYPE.ahk" { DXVAHD_DEVICE_TYPE }

/**
 * Specifies the capabilities of a Microsoft DirectX Video Acceleration High Definition (DXVA-HD) device.
 * @remarks
 * In DXVA-HD, the device stores state information for each input stream. These states persist between blits. With each blit, the application selects which streams to enable or disable. Disabling a stream does not affect the state information for that stream.
 * 
 * 
 * 
 * The <b>MaxStreamStates</b> member gives the maximum number of stream states that can be set by the application. The <b>MaxInputStreams</b> member gives the maximum number of streams that can be enabled during a blit. These two values can differ.
 * 
 * To set the state data for a stream, call <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nf-dxvahd-idxvahd_videoprocessor-setvideoprocessstreamstate">IDXVAHD_VideoProcessor::SetVideoProcessStreamState</a>.
 * @see https://learn.microsoft.com/windows/win32/api/dxvahd/ns-dxvahd-dxvahd_vpdevcaps
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct DXVAHD_VPDEVCAPS {
    #StructPack 4

    /**
     * Specifies the device type, as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ne-dxvahd-dxvahd_device_type">DXVAHD_DEVICE_TYPE</a> enumeration.
     */
    DeviceType : DXVAHD_DEVICE_TYPE

    /**
     * A bitwise <b>OR</b> of zero or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ne-dxvahd-dxvahd_device_caps">DXVAHD_DEVICE_CAPS</a> enumeration.
     */
    DeviceCaps : UInt32

    /**
     * A bitwise <b>OR</b> of zero or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ne-dxvahd-dxvahd_feature_caps">DXVAHD_FEATURE_CAPS</a> enumeration.
     */
    FeatureCaps : UInt32

    /**
     * A bitwise <b>OR</b> of zero or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ne-dxvahd-dxvahd_filter_caps">DXVAHD_FILTER_CAPS</a> enumeration.
     */
    FilterCaps : UInt32

    /**
     * A bitwise <b>OR</b> of zero or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ne-dxvahd-dxvahd_input_format_caps">DXVAHD_INPUT_FORMAT_CAPS</a> enumeration.
     */
    InputFormatCaps : UInt32

    /**
     * The memory pool that is required for the input video surfaces.
     */
    InputPool : D3DPOOL

    /**
     * The number of supported output formats. To get the list of output formats, call the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nf-dxvahd-idxvahd_device-getvideoprocessoroutputformats">IDXVAHD_Device::GetVideoProcessorOutputFormats</a> method.
     */
    OutputFormatCount : UInt32

    /**
     * The number of supported input formats. To get the list of input formats, call the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nf-dxvahd-idxvahd_device-getvideoprocessorinputformats">IDXVAHD_Device::GetVideoProcessorInputFormats</a> method.
     */
    InputFormatCount : UInt32

    /**
     * The number of video processors. Each video processor represents a  distinct set of processing capabilities. To get the capabilities of each video processor, call the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nf-dxvahd-idxvahd_device-getvideoprocessorcaps">IDXVAHD_Device::GetVideoProcessorCaps</a> method. To create a video processor, call the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nf-dxvahd-idxvahd_device-createvideoprocessor">IDXVAHD_Device::CreateVideoProcessor</a> method.
     */
    VideoProcessorCount : UInt32

    /**
     * The maximum number of input streams that can be enabled at the same time.
     */
    MaxInputStreams : UInt32

    /**
     * The maximum number of input streams for which the device can store state data.
     */
    MaxStreamStates : UInt32

}
