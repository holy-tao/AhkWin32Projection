#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DXVAHD_OUTPUT_RATE.ahk" { DXVAHD_OUTPUT_RATE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\DXVAHD_RATIONAL.ahk" { DXVAHD_RATIONAL }

/**
 * Specifies the output frame rate for an input stream when using Microsoft DirectX Video Acceleration High Definition (DXVA-HD).
 * @remarks
 * The output rate might require the device to convert the frame rate of the input stream. If so, the value of <b>RepeatFrame</b> controls whether the device creates interpolated frames or simply repeats input frames.
 * @see https://learn.microsoft.com/windows/win32/api/dxvahd/ns-dxvahd-dxvahd_stream_state_output_rate_data
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct DXVAHD_STREAM_STATE_OUTPUT_RATE_DATA {
    #StructPack 4

    /**
     * Specifies how the device performs frame-rate conversion, if required. The default state value is <b>FALSE</b> (interpolation).
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TRUE"></a><a id="true"></a><dl>
     * <dt><b>TRUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device repeats frames.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b>FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device interpolates frames.
     * 
     * </td>
     * </tr>
     * </table>
     */
    RepeatFrame : BOOL

    /**
     * Specifies the output rate, as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ne-dxvahd-dxvahd_output_rate">DXVAHD_OUTPUT_RATE</a> enumeration.
     */
    OutputRate : DXVAHD_OUTPUT_RATE

    /**
     * Specifies a custom output rate, as a <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_rational">DXVAHD_RATIONAL</a> structure. This member is ignored unless <b>OutputRate</b> equals <b>DXVAHD_OUTPUT_RATE_CUSTOM</b>. The default state value is 1/1.
     * 
     * To get the list of custom rates supported by the video processor, call <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nf-dxvahd-idxvahd_device-getvideoprocessorcustomrates">IDXVAHD_Device::GetVideoProcessorCustomRates</a>. If a custom rate is used, it must be taken from this list.
     */
    CustomRate : DXVAHD_RATIONAL

}
