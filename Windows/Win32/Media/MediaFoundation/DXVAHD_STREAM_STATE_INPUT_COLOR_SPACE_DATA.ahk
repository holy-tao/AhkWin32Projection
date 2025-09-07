#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies the color space for a Microsoft DirectX Video Acceleration High Definition (DXVA-HD) input stream.
 * @remarks
 * The <b>RGB_Range</b> member applies to RGB input, while the <b>YCbCr_Matrix</b> and <b>YCbCr_xvYCC</b> members apply to YCbCr (YUV) input.
  * 
  * In some situations, the device might perform an intermediate color conversion on the input stream. If so, it uses the flags that apply to  both color spaces. For example, suppose the device converts from RGB to YCbCr. If the <b>RGB_Range</b> member is 0 and the <b>YCbCr_Matrix</b> member is 1, the device will convert from full-range RGB to BT.709 YCbCr.
  * 
  * If the device supports xvYCC, it returns the <b>DXVAHD_DEVICE_CAPS_xvYCC</b> capability flag in the <b>DeviceCaps</b>  member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_vpdevcaps">DXVAHD_VPDEVCAPS</a> structure. Otherwise, the device ignores the value of <b>YCbCr_xvYCC</b> and treats all YCbCr input as conventional YCbCr. To get the device's capabilities, call <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nf-dxvahd-idxvahd_device-getvideoprocessordevicecaps">IDXVAHD_Device::GetVideoProcessorDeviceCaps</a>.
 * @see https://learn.microsoft.com/windows/win32/api/dxvahd/ns-dxvahd-dxvahd_stream_state_input_color_space_data
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class DXVAHD_STREAM_STATE_INPUT_COLOR_SPACE_DATA extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Anonymous {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Value {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
