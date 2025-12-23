#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies how the output alpha values are calculated for Microsoft DirectX Video Acceleration High Definition (DXVA-HD) blit operations.
 * @remarks
 * The <b>Mode</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_blt_state_alpha_fill_data">DXVAHD_BLT_STATE_ALPHA_FILL_DATA</a> structure has this enumeration type. That member specifies the alpha-fill mode for the input stream identified by the <b>StreamNumber</b> member of the same structure. To set the alpha-fill mode, call  <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nf-dxvahd-idxvahd_videoprocessor-setvideoprocessbltstate">IDXVAHD_VideoProcessor::SetVideoProcessBltState</a>.
 * 
 * To find out which modes the device supports, call the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nf-dxvahd-idxvahd_device-getvideoprocessordevicecaps">IDXVAHD_Device::GetVideoProcessorDeviceCaps</a> method. If the device sets the <b>DXVAHD_FEATURE_CAPS_ALPHA_FILL</b> flag in the <b>FeatureCaps</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_vpdevcaps">DXVAHD_VPDEVCAPS</a> structure, the DXVA-HD device supports any of the modes listed here. Otherwise, the alpha-fill mode must be <b>DXVAHD_ALPHA_FILL_MODE_OPAQUE</b>.
 * @see https://learn.microsoft.com/windows/win32/api/dxvahd/ne-dxvahd-dxvahd_alpha_fill_mode
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class DXVAHD_ALPHA_FILL_MODE extends Win32Enum{

    /**
     * Alpha values inside the target rectangle are set to opaque.
     * @type {Integer (Int32)}
     */
    static DXVAHD_ALPHA_FILL_MODE_OPAQUE => 0

    /**
     * Alpha values inside the target rectangle are set to the alpha value specified in the background color. See <a href="https://docs.microsoft.com/windows/win32/api/dxvahd/ns-dxvahd-dxvahd_blt_state_background_color_data">DXVAHD_BLT_STATE_BACKGROUND_COLOR</a>.
     * @type {Integer (Int32)}
     */
    static DXVAHD_ALPHA_FILL_MODE_BACKGROUND => 1

    /**
     * Existing alpha values remain unchanged in the output surface.
     * @type {Integer (Int32)}
     */
    static DXVAHD_ALPHA_FILL_MODE_DESTINATION => 2

    /**
     * Alpha values from the input stream  are scaled and copied to the corresponding destination rectangle for that stream. If the input stream does not have alpha data, the DXVA-HD device sets the alpha values in the target rectangle to an opaque value. If the input stream is disabled or the source rectangle is empty, the alpha values in the target rectangle are not modified.
     * @type {Integer (Int32)}
     */
    static DXVAHD_ALPHA_FILL_MODE_SOURCE_STREAM => 3
}
