#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies state parameters for blit operations when using Microsoft DirectX Video Acceleration High Definition (DXVA-HD).
 * @see https://docs.microsoft.com/windows/win32/api//dxvahd/ne-dxvahd-dxvahd_blt_state
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class DXVAHD_BLT_STATE{

    /**
     * Specifies the target rectangle, which is the area within the destination surface where the output will be drawn. The state data is a <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_blt_state_target_rect_data">DXVAHD_BLT_STATE_TARGET_RECT_DATA</a> structure.
     * @type {Integer (Int32)}
     */
    static DXVAHD_BLT_STATE_TARGET_RECT => 0

    /**
     * Specifies the background color. The state data is a <a href="https://docs.microsoft.com/windows/win32/api/dxvahd/ns-dxvahd-dxvahd_blt_state_background_color_data">DXVAHD_BLT_STATE_BACKGROUND_COLOR_DATA</a> structure.
     * @type {Integer (Int32)}
     */
    static DXVAHD_BLT_STATE_BACKGROUND_COLOR => 1

    /**
     * Specifies the output color space.  The state data is a <a href="https://docs.microsoft.com/windows/win32/api/dxvahd/ns-dxvahd-dxvahd_blt_state_output_color_space_data">DXVAHD_BLT_STATE_OUTPUT_COLOR_SPACE_DATA</a> structure.
     * @type {Integer (Int32)}
     */
    static DXVAHD_BLT_STATE_OUTPUT_COLOR_SPACE => 2

    /**
     * Specifies how DXVA-HD device calculates output alpha values.  The state data is a <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_blt_state_alpha_fill_data">DXVAHD_BLT_STATE_ALPHA_FILL_DATA</a> structure.
     * @type {Integer (Int32)}
     */
    static DXVAHD_BLT_STATE_ALPHA_FILL => 3

    /**
     * Specifies the amount of downsampling to perform on the output.  The state data is a <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_blt_state_constriction_data">DXVAHD_BLT_STATE_CONSTRICTION_DATA</a> structure.
     * @type {Integer (Int32)}
     */
    static DXVAHD_BLT_STATE_CONSTRICTION => 4

    /**
     * Specifies that the state data contains a private DXVA-HD blit state.  Use this state for proprietary or device-specific parameters. The state data is a <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_blt_state_private_data">DXVAHD_BLT_STATE_PRIVATE_DATA</a>  structure.
     * @type {Integer (Int32)}
     */
    static DXVAHD_BLT_STATE_PRIVATE => 1000
}
