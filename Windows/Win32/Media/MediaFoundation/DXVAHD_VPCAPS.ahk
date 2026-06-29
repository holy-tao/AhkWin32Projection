#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Specifies the capabilities of the Microsoft DirectX Video Acceleration High Definition (DXVA-HD) video processor.
 * @see https://learn.microsoft.com/windows/win32/api/dxvahd/ns-dxvahd-dxvahd_vpcaps
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct DXVAHD_VPCAPS {
    #StructPack 4

    /**
     * A GUID that identifies the video processor. This GUID is defined by the device, and is used in various <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nn-dxvahd-idxvahd_device">IDXVAHD_Device</a> methods to specify the video processor.
     */
    VPGuid : Guid

    /**
     * The number of past reference frames required to perform the optimal video processing.
     */
    PastFrames : UInt32

    /**
     * The number of future reference frames required to perform the optimal video processing.
     */
    FutureFrames : UInt32

    /**
     * A bitwise <b>OR</b> of zero or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ne-dxvahd-dxvahd_processor_caps">DXVAHD_PROCESSOR_CAPS</a> enumeration.
     */
    ProcessorCaps : UInt32

    /**
     * A bitwise <b>OR</b> of zero or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ne-dxvahd-dxvahd_itelecine_caps">DXVAHD_ITELECINE_CAPS</a> enumeration.
     */
    ITelecineCaps : UInt32

    /**
     * The number of custom output frame rates. To get the list of custom frame rates, call the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nf-dxvahd-idxvahd_device-getvideoprocessorcustomrates">IDXVAHD_Device::GetVideoProcessorCustomRates</a> method. Custom frame rates are used for frame-rate conversion and inverse telecine.
     */
    CustomRateCount : UInt32

}
