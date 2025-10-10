#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines a group of video processor capabilities that are associated with frame-rate conversion, including deinterlacing and inverse telecine.
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/ns-d3d11-d3d11_video_processor_rate_conversion_caps
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_VIDEO_PROCESSOR_RATE_CONVERSION_CAPS extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * The number of past reference frames required to perform the optimal video processing.
     * @type {Integer}
     */
    PastFrames {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The number of future reference frames required to perform the optimal video processing.
     * @type {Integer}
     */
    FutureFrames {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A bitwise <b>OR</b> of zero or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_video_processor_processor_caps">D3D11_VIDEO_PROCESSOR_PROCESSOR_CAPS</a> enumeration.
     * @type {Integer}
     */
    ProcessorCaps {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * A bitwise <b>OR</b> of zero or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_video_processor_itelecine_caps">D3D11_VIDEO_PROCESSOR_ITELECINE_CAPS</a> enumeration.
     * @type {Integer}
     */
    ITelecineCaps {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The number of custom frame rates that the driver supports. To get the list of custom frame rates, call the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videoprocessorenumerator-getvideoprocessorcustomrate">ID3D11VideoProcessorEnumerator::GetVideoProcessorCustomRate</a> method.
     * @type {Integer}
     */
    CustomRateCount {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
