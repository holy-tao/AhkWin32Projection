#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Flags specifying unsupported encoder features.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ne-d3d12video-d3d12_video_encoder_validation_flags
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_ENCODER_VALIDATION_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * None.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_VALIDATION_FLAG_NONE => 0

    /**
     * The specified codec is not supported.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_VALIDATION_FLAG_CODEC_NOT_SUPPORTED => 1

    /**
     * The specified input format is not supported.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_VALIDATION_FLAG_INPUT_FORMAT_NOT_SUPPORTED => 8

    /**
     * The specified codec configuration is not supported.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_VALIDATION_FLAG_CODEC_CONFIGURATION_NOT_SUPPORTED => 16

    /**
     * The specified rate control mode is not supported.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_VALIDATION_FLAG_RATE_CONTROL_MODE_NOT_SUPPORTED => 32

    /**
     * The specified rate control configuration is not supported.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_VALIDATION_FLAG_RATE_CONTROL_CONFIGURATION_NOT_SUPPORTED => 64

    /**
     * The specified intra refresh mode is not supported.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_VALIDATION_FLAG_INTRA_REFRESH_MODE_NOT_SUPPORTED => 128

    /**
     * The specified subregion layout mode is not supported.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_VALIDATION_FLAG_SUBREGION_LAYOUT_MODE_NOT_SUPPORTED => 256

    /**
     * The specified resolution is not supported.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_VALIDATION_FLAG_RESOLUTION_NOT_SUPPORTED_IN_LIST => 512

    /**
     * The specified GOP structure is not supported.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_VALIDATION_FLAG_GOP_STRUCTURE_NOT_SUPPORTED => 2048

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_VALIDATION_FLAG_SUBREGION_LAYOUT_DATA_NOT_SUPPORTED => 4096

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_VALIDATION_FLAG_QPMAP_NOT_SUPPORTED => 8192

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_VALIDATION_FLAG_DIRTY_REGIONS_NOT_SUPPORTED => 16384

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_VALIDATION_FLAG_MOTION_SEARCH_NOT_SUPPORTED => 32768

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_VALIDATION_FLAG_FRAME_ANALYSIS_NOT_SUPPORTED => 65536
}
