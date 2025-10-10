#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies the output color space for blit operations, when using Microsoft DirectX Video Acceleration High Definition (DXVA-HD).
 * @remarks
 * 
  * The <b>RGB_Range</b> member applies to RGB output, while the <b>YCbCr_Matrix</b> and <b>YCbCr_xvYCC</b> members apply to YCbCr (YUV) output. If the device performs color-space conversion on the background color, it uses the values that apply to  both color spaces.
  * 
  * Extended YCbCr can be used with either transfer matrix. Extended YCbCr does not change the black point or white point—the black point is still 16 and the white point is still 235. However, extended YCbCr explicitly allows blacker-than-black values in the range 1–15, and whiter-than-white values in the range 236–254. When extended YCbCr is used, the driver should not clip the luma values to the nominal 16–235 range.
  * 
  * If the device supports extended YCbCr, it sets the <b>DXVAHD_DEVICE_CAPS_xvYCC</b> capability flag in the <b>DeviceCaps</b>  member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_vpdevcaps">DXVAHD_VPDEVCAPS</a> structure. Otherwise, the device ignores the value of the <b>YCbCr_xvYCC</b> member and treats all YCbCr output as conventional YCbCr. To get the device's capabilities, call <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nf-dxvahd-idxvahd_device-getvideoprocessordevicecaps">IDXVAHD_Device::GetVideoProcessorDeviceCaps</a>.
  * 
  * If the output format is a wide-gamut RGB format, output might fall outside the nominal [0...1] range of sRGB. This is particularly true if one or more input streams use extended YCbCr.
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dxvahd/ns-dxvahd-dxvahd_blt_state_output_color_space_data
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class DXVAHD_BLT_STATE_OUTPUT_COLOR_SPACE_DATA extends Win32Struct
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
