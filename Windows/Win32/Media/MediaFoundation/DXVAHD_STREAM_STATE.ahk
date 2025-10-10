#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies state parameters for an input stream to a Microsoft DirectX Video Acceleration High Definition (DXVA-HD) video processor.
 * @see https://docs.microsoft.com/windows/win32/api//dxvahd/ne-dxvahd-dxvahd_stream_state
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class DXVAHD_STREAM_STATE{

    /**
     * Specifies the video format of the input stream. The state data is a  <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_stream_state_d3dformat_data">DXVAHD_STREAM_STATE_D3DFORMAT_DATA</a> structure.
     * @type {Integer (Int32)}
     */
    static DXVAHD_STREAM_STATE_D3DFORMAT => 0

    /**
     * Specifies how the input stream is interlaced. The state data is a  <a href="https://docs.microsoft.com/windows/win32/api/dxvahd/ns-dxvahd-dxvahd_stream_state_frame_format_data">DXVAHD_STREAM_STATE_FRAME_FORMAT_DATA</a> structure.
     * @type {Integer (Int32)}
     */
    static DXVAHD_STREAM_STATE_FRAME_FORMAT => 1

    /**
     * Specifies the color space for the input stream. The state data is a <a href="https://docs.microsoft.com/windows/win32/api/dxvahd/ns-dxvahd-dxvahd_stream_state_input_color_space_data">DXVAHD_STREAM_STATE_INPUT_COLOR_SPACE_DATA</a>  structure.
     * @type {Integer (Int32)}
     */
    static DXVAHD_STREAM_STATE_INPUT_COLOR_SPACE => 2

    /**
     * Specifies the output frame rate. The state data is a  <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_stream_state_output_rate_data">DXVAHD_STREAM_STATE_OUTPUT_RATE_DATA</a> structure.
     * @type {Integer (Int32)}
     */
    static DXVAHD_STREAM_STATE_OUTPUT_RATE => 3

    /**
     * Specifies the source rectangle. The source rectangle defines which portion of the input sample is blitted to the destination surface. The state data is a  <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_stream_state_source_rect_data">DXVAHD_STREAM_STATE_SOURCE_RECT_DATA</a> structure.
     * @type {Integer (Int32)}
     */
    static DXVAHD_STREAM_STATE_SOURCE_RECT => 4

    /**
     * Specifies the destination rectangle. The destination rectangle defines which portion of the destination rectangle receives the blit. The state data is a  <a href="https://docs.microsoft.com/windows/win32/api/dxvahd/ns-dxvahd-dxvahd_stream_state_destination_rect_data">DXVAHD_STREAM_STATE_DESTINATION_RECT_DATA</a> structure.
     * @type {Integer (Int32)}
     */
    static DXVAHD_STREAM_STATE_DESTINATION_RECT => 5

    /**
     * Specifies the planar alpha value for this input stream. The state data is a  <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_stream_state_alpha_data">DXVAHD_STREAM_STATE_ALPHA_DATA</a> structure.
     * @type {Integer (Int32)}
     */
    static DXVAHD_STREAM_STATE_ALPHA => 6

    /**
     * Specifies the color-palette entries. The state data is a  <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_stream_state_palette_data">DXVAHD_STREAM_STATE_PALETTE_DATA</a> structure.
 * 
 *  This setting is used for palettized input formats, such as AI44 and IA44.
     * @type {Integer (Int32)}
     */
    static DXVAHD_STREAM_STATE_PALETTE => 7

    /**
     * Specifies the luma key. The state data is a  <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_stream_state_luma_key_data">DXVAHD_STREAM_STATE_LUMA_KEY_DATA</a> structure.
 * 
 * This state is applicable only if the device supports luma keying. To find out if the device supports luma keying, check for the <b>DXVAHD_FEATURE_CAPS_LUMA_KEY</b> flag in the <b>FeatureCaps </b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_vpdevcaps">DXVAHD_VPDEVCAPS</a> capabilities structure.
     * @type {Integer (Int32)}
     */
    static DXVAHD_STREAM_STATE_LUMA_KEY => 8

    /**
     * Specifies the pixel aspect ratio of the source and destination surfaces. The state data is a  <a href="https://docs.microsoft.com/windows/win32/api/dxvahd/ns-dxvahd-dxvahd_stream_state_aspect_ratio_data">DXVAHD_STREAM_STATE_ASPECT_RATIO_DATA</a> structure.
     * @type {Integer (Int32)}
     */
    static DXVAHD_STREAM_STATE_ASPECT_RATIO => 9

    /**
     * Specifies the brightness filter. The state data is a  <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_stream_state_filter_data">DXVAHD_STREAM_STATE_FILTER_DATA</a> structure.
     * @type {Integer (Int32)}
     */
    static DXVAHD_STREAM_STATE_FILTER_BRIGHTNESS => 100

    /**
     * Specifies the contrast filter. The state data is a  <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_stream_state_filter_data">DXVAHD_STREAM_STATE_FILTER_DATA</a> structure.
     * @type {Integer (Int32)}
     */
    static DXVAHD_STREAM_STATE_FILTER_CONTRAST => 101

    /**
     * Specifies the hue filter. The state data is a <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_stream_state_filter_data">DXVAHD_STREAM_STATE_FILTER_DATA</a>  structure.
     * @type {Integer (Int32)}
     */
    static DXVAHD_STREAM_STATE_FILTER_HUE => 102

    /**
     * Specifies the saturation filter. The state data is a  <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_stream_state_filter_data">DXVAHD_STREAM_STATE_FILTER_DATA</a> structure.
     * @type {Integer (Int32)}
     */
    static DXVAHD_STREAM_STATE_FILTER_SATURATION => 103

    /**
     * Specifies the noise-reduction filter. The state data is a  <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_stream_state_filter_data">DXVAHD_STREAM_STATE_FILTER_DATA</a> structure.
     * @type {Integer (Int32)}
     */
    static DXVAHD_STREAM_STATE_FILTER_NOISE_REDUCTION => 104

    /**
     * Specifies the edge-enhancement filter. The state data is a  <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_stream_state_filter_data">DXVAHD_STREAM_STATE_FILTER_DATA</a> structure.
     * @type {Integer (Int32)}
     */
    static DXVAHD_STREAM_STATE_FILTER_EDGE_ENHANCEMENT => 105

    /**
     * Specifies the anamorphic-scaling value. The state data is a  <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_stream_state_filter_data">DXVAHD_STREAM_STATE_FILTER_DATA</a> structure.
     * @type {Integer (Int32)}
     */
    static DXVAHD_STREAM_STATE_FILTER_ANAMORPHIC_SCALING => 106

    /**
     * Specifies that the state data contains a private DXVA-HD stream state.  The state data is a  <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_stream_state_private_data">DXVAHD_STREAM_STATE_PRIVATE_DATA</a> structure.
 * 
 * Use this state for proprietary or device-specific parameters.
     * @type {Integer (Int32)}
     */
    static DXVAHD_STREAM_STATE_PRIVATE => 1000
}
