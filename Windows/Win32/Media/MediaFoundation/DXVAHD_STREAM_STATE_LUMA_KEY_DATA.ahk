#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies the luma key for an input stream, when using Microsoft DirectX Video Acceleration High Definition (DXVA-HD).
 * @remarks
 * 
  * To use this state, the device must support luma keying, indicated by the <b>DXVAHD_FEATURE_CAPS_LUMA_KEY</b> capability flag. To query for this capability, call <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nf-dxvahd-idxvahd_device-getvideoprocessordevicecaps">IDXVAHD_Device::GetVideoProcessorDeviceCaps</a>. If the device supports luma keying, it sets the  <b>DXVAHD_FEATURE_CAPS_LUMA_KEY</b> flag in the <b>FeatureCaps</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_vpdevcaps">DXVAHD_VPDEVCAPS</a> structure.
  * 
  * If the device does not support luma keying, the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nf-dxvahd-idxvahd_videoprocessor-setvideoprocessstreamstate">IDXVAHD_VideoProcessor::SetVideoProcessStreamState</a> method fails for this state.
  * 
  * If the input format is RGB, the device must also support the <b>DXVAHD_INPUT_FORMAT_CAPS_RGB_LUMA_KEY</b> capability. This capability flag is set in the <b>InputFormatCaps</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_vpdevcaps">DXVAHD_VPDEVCAPS</a> structure. If the flag is not present, the device ignores the luma key value for RGB input.
  * 
  * The values of <b>Lower</b> and <b>Upper</b> give the lower and upper bounds of the luma key, using a nominal range of [0...1]. Given a format with <i>n</i> bits per channel, these values are converted to luma values as follows:
  * 
  * <c>val = f * ((1 &lt;&lt; n)-1)</c>
  * 
  * Any pixel whose luma value falls within the upper and lower bounds (inclusive) is treated as transparent.
  * 
  * For example, if the pixel format uses 8-bit luma, the upper bound is calculated as follows:
  * 
  * <c>BYTE Y = BYTE(max(min(1.0, Upper), 0.0) * 255.0)</c>
  * 
  * Note that the value is clamped to the range [0...1] before multiplying by 255.
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dxvahd/ns-dxvahd-dxvahd_stream_state_luma_key_data
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class DXVAHD_STREAM_STATE_LUMA_KEY_DATA extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * If <b>TRUE</b>, luma keying is enabled. Otherwise, luma keying is disabled. The default value is <b>FALSE</b>.
     * @type {BOOL}
     */
    Enable {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The lower bound for the luma key. The range is [0…1]. The default state value is 0.0.
     * @type {Float}
     */
    Lower {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }

    /**
     * The upper bound for the luma key. The range is [0…1]. The default state value is 0.0.
     * @type {Float}
     */
    Upper {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }
}
