#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines features that a Microsoft DirectX Video Acceleration High Definition (DXVA-HD) device can support.
 * @see https://docs.microsoft.com/windows/win32/api//dxvahd/ne-dxvahd-dxvahd_feature_caps
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class DXVAHD_FEATURE_CAPS{

    /**
     * The device can set the alpha values on the video output. See <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_blt_state_alpha_fill_data">DXVAHD_BLT_STATE_ALPHA_FILL_DATA</a>.
     * @type {Integer (Int32)}
     */
    static DXVAHD_FEATURE_CAPS_ALPHA_FILL => 1

    /**
     * The device can downsample the video output. See <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_blt_state_constriction_data">DXVAHD_BLT_STATE_CONSTRICTION_DATA</a>.
     * @type {Integer (Int32)}
     */
    static DXVAHD_FEATURE_CAPS_CONSTRICTION => 2

    /**
     * The device can perform luma keying. See <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_stream_state_luma_key_data">DXVAHD_STREAM_STATE_LUMA_KEY_DATA</a>.
     * @type {Integer (Int32)}
     */
    static DXVAHD_FEATURE_CAPS_LUMA_KEY => 4

    /**
     * The device can apply alpha values from color palette entries. See <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_stream_state_alpha_data">DXVAHD_STREAM_STATE_ALPHA_DATA</a>.
     * @type {Integer (Int32)}
     */
    static DXVAHD_FEATURE_CAPS_ALPHA_PALETTE => 8
}
