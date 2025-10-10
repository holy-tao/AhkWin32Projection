#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies how the output alpha values are calculated for blit operations when using Microsoft DirectX Video Acceleration High Definition (DXVA-HD).
 * @see https://docs.microsoft.com/windows/win32/api//dxvahd/ns-dxvahd-dxvahd_blt_state_alpha_fill_data
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class DXVAHD_BLT_STATE_ALPHA_FILL_DATA extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Specifies the alpha fill mode, as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ne-dxvahd-dxvahd_alpha_fill_mode">DXVAHD_ALPHA_FILL_MODE</a> enumeration.
     * 
     * If the <b>FeatureCaps</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_vpdevcaps">DXVAHD_VPDEVCAPS</a> structure does not contain the <b>DXVAHD_FEATURE_CAPS_ALPHA_FILL</b> flag, the alpha fill mode must be set to <b>DXVAHD_ALPHA_FILL_MODE_OPAQUE</b>.
     * 
     * The default state value is <b>DXVAHD_ALPHA_FILL_MODE_OPAQUE</b>.
     * @type {Integer}
     */
    Mode {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Zero-based index of the input stream to use for the alpha values. This member is used when the alpha fill mode is <b>DXVAHD_ALPHA_FILL_MODE_SOURCE_STREAM</b>; otherwise, the value is ignored. 
     * 
     * To get the maximum number of streams, call <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nf-dxvahd-idxvahd_device-getvideoprocessordevicecaps">IDXVAHD_Device::GetVideoProcessorDeviceCaps</a> and check the <b>MaxStreamStates</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_vpdevcaps">DXVAHD_VPDEVCAPS</a> structure.
     * @type {Integer}
     */
    StreamNumber {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
