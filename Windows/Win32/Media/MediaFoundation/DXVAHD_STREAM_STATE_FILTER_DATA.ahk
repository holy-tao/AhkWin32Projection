#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies the level for a filtering operation on a Microsoft DirectX Video Acceleration High Definition (DXVA-HD) input stream.
 * @remarks
 * 
  * For a list of image filters that are defined for DXVA-HD, see <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ne-dxvahd-dxvahd_filter">DXVAHD_FILTER</a>. The device might not support every type of image filter. To find out whether the device supports a particular filter, call the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nf-dxvahd-idxvahd_device-getvideoprocessordevicecaps">IDXVAHD_Device::GetVideoProcessorDeviceCaps</a> method and check the <b>FilterCaps</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_vpdevcaps">DXVAHD_VPDEVCAPS</a> structure.
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dxvahd/ns-dxvahd-dxvahd_stream_state_filter_data
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class DXVAHD_STREAM_STATE_FILTER_DATA extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * <b>If TRUE</b>, the filter is enabled. Otherwise, <b>the filter is disabled</b>.
     * @type {Integer}
     */
    Enable {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The level for the filter. The meaning of this value depends on the implementation. To get the range and default value of a particular filter, call the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nf-dxvahd-idxvahd_device-getvideoprocessorfilterrange">IDXVAHD_Device::GetVideoProcessorFilterRange</a> method.
     * 
     * If the <b>Enable</b> member is <b>FALSE</b>, the <b>Level</b> member is ignored.
     * @type {Integer}
     */
    Level {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
