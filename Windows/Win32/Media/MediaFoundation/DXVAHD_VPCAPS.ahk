#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies the capabilities of the Microsoft DirectX Video Acceleration High Definition (DXVA-HD) video processor.
 * @see https://docs.microsoft.com/windows/win32/api//dxvahd/ns-dxvahd-dxvahd_vpcaps
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class DXVAHD_VPCAPS extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * A GUID that identifies the video processor. This GUID is defined by the device, and is used in various <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nn-dxvahd-idxvahd_device">IDXVAHD_Device</a> methods to specify the video processor.
     * @type {Pointer<Guid>}
     */
    VPGuid {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The number of past reference frames required to perform the optimal video processing.
     * @type {Integer}
     */
    PastFrames {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The number of future reference frames required to perform the optimal video processing.
     * @type {Integer}
     */
    FutureFrames {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * A bitwise <b>OR</b> of zero or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ne-dxvahd-dxvahd_processor_caps">DXVAHD_PROCESSOR_CAPS</a> enumeration.
     * @type {Integer}
     */
    ProcessorCaps {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * A bitwise <b>OR</b> of zero or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ne-dxvahd-dxvahd_itelecine_caps">DXVAHD_ITELECINE_CAPS</a> enumeration.
     * @type {Integer}
     */
    ITelecineCaps {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * The number of custom output frame rates. To get the list of custom frame rates, call the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nf-dxvahd-idxvahd_device-getvideoprocessorcustomrates">IDXVAHD_Device::GetVideoProcessorCustomRates</a> method. Custom frame rates are used for frame-rate conversion and inverse telecine.
     * @type {Integer}
     */
    CustomRateCount {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
