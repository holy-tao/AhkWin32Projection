#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies how a Microsoft DirectX Video Acceleration High Definition (DXVA-HD) input stream is interlaced.
 * @remarks
 * 
 * Some devices do not support interlaced RGB. Interlaced RGB support is indicated by the <b>DXVAHD_INPUT_FORMAT_CAPS_RGB_INTERLACED</b>  capability flag. If the device does not support interlaced RGB, it treats all RGB input streams as progressive frames. 
 * 
 * Some devices do not support interlaced formats with palettized color. This support is indicated by the <b>DXVAHD_INPUT_FORMAT_CAPS_PALETTE_INTERLACED</b> flag. If the device does not support this capability, all palettized input streams are treated as progressive frames.
 * 
 * To get the device's capabilities, call <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nf-dxvahd-idxvahd_device-getvideoprocessordevicecaps">IDXVAHD_Device::GetVideoProcessorDeviceCaps</a> and check the <b>InputFormatCaps</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_vpdevcaps">DXVAHD_VPDEVCAPS</a> structure.
 * 
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//dxvahd/ns-dxvahd-dxvahd_stream_state_frame_format_data
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class DXVAHD_STREAM_STATE_FRAME_FORMAT_DATA extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * The video interlacing, specified as a <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ne-dxvahd-dxvahd_frame_format">DXVAHD_FRAME_FORMAT</a> value.
     * 
     * The default state value is <b>DXVAHD_FRAME_FORMAT_PROGRESSIVE</b> (progressive frames).
     * @type {Integer}
     */
    FrameFormat {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
