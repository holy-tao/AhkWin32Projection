#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies the planar alpha value for an input stream, when using Microsoft DirectX Video Acceleration High Definition (DXVA-HD).
 * @remarks
 * For each pixel, the destination color value is computed as follows:
 * 
 * <c>Cd = Cs * (As * Ap * Ae) + Cd * (1.0 - As * Ap * Ae)</c>
 * 
 * where
 * 
 * <ul>
 * <li><c>Cd</c> = Color value of the destination pixel.</li>
 * <li><c>Cs</c> = Color value of source pixel.</li>
 * <li><c>As</c> = Per-pixel source alpha.</li>
 * <li><c>Ap</c> = Planar alpha value.</li>
 * <li><c>Ae</c> = Palette-entry alpha value, or 1.0 (see Note).</li>
 * </ul>
 * <div class="alert"><b>Note</b>  Palette-entry alpha values apply only to palettized color formats, and only when the device supports the <b>DXVAHD_FEATURE_CAPS_ALPHA_PALETTE</b> capability. Otherwise, this factor equals 1.0. </div>
 * <div> </div>
 * The destination alpha value is computed according to the <b>DXVAHD_BLT_STATE_ALPHA_FILL</b> state. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_blt_state_alpha_fill_data">DXVAHD_BLT_STATE_ALPHA_FILL_DATA</a>.
 * 
 * To get the device capabilities, call <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nf-dxvahd-idxvahd_device-getvideoprocessordevicecaps">IDXVAHD_Device::GetVideoProcessorDeviceCaps</a> and check the <b>FeatureCaps</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_vpdevcaps">DXVAHD_VPDEVCAPS</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/dxvahd/ns-dxvahd-dxvahd_stream_state_alpha_data
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class DXVAHD_STREAM_STATE_ALPHA_DATA extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * <b>If TRUE</b>, alpha blending is enabled. Otherwise, alpha blending is disabled. The default state value is <b>FALSE</b>.
     * @type {BOOL}
     */
    Enable {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Specifies the planar alpha value as a floating-point number from 0.0 (transparent) to 1.0 (opaque). 
     * 
     * If the <b>Enable</b> member is <b>FALSE</b>, this member is ignored.
     * @type {Float}
     */
    Alpha {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }
}
