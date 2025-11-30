#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the output frame rates for an input stream, when using Microsoft DirectX Video Acceleration High Definition (DXVA-HD).
 * @see https://docs.microsoft.com/windows/win32/api//dxvahd/ne-dxvahd-dxvahd_output_rate
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class DXVAHD_OUTPUT_RATE extends Win32Enum{

    /**
     * The frame output is at the normal rate.
     * 
     * For progressive input, every frame produces one output frame. For interlaced input, every frame (two fields) produces two progressive output frames.
     * @type {Integer (Int32)}
     */
    static DXVAHD_OUTPUT_RATE_NORMAL => 0

    /**
     * The frame output is at half rate.
     * 
     * For progressive input, every frame produces one output frame, just as with  <b>DXVAHD_OUTPUT_RATE_NORMAL</b>. For interlaced input, every frame produces one progressive output frame.
     * @type {Integer (Int32)}
     */
    static DXVAHD_OUTPUT_RATE_HALF => 1

    /**
     * Frame output is at a custom rate.
     * 
     *  Use this value for frame-rate conversion or inverse telecine. The exact rate is given in the <b>OutputRate</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_stream_state_output_rate_data">DXVAHD_STREAM_STATE_OUTPUT_RATE_DATA</a> structure. To get the list of custom rates supported by the video processor, call the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nf-dxvahd-idxvahd_device-getvideoprocessorcustomrates">IDXVAHD_Device::GetVideoProcessorCustomRates</a> method.
     * @type {Integer (Int32)}
     */
    static DXVAHD_OUTPUT_RATE_CUSTOM => 2
}
