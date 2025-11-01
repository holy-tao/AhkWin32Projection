#Requires AutoHotkey v2.0.0 64-bit

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ne-d3d12video-d3d12_video_encoder_codec_configuration_hevc_flags
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_FLAGS{

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_FLAG_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_FLAG_DISABLE_LOOP_FILTER_ACROSS_SLICES => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_FLAG_ALLOW_REQUEST_INTRA_CONSTRAINED_SLICES => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_FLAG_ENABLE_SAO_FILTER => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_FLAG_ENABLE_LONG_TERM_REFERENCES => 8

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_FLAG_USE_ASYMETRIC_MOTION_PARTITION => 16

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_FLAG_ENABLE_TRANSFORM_SKIPPING => 32

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_FLAG_USE_CONSTRAINED_INTRAPREDICTION => 64

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_FLAG_TRANSFORM_SKIP_ROTATION => 128

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_FLAG_TRANSFORM_SKIP_CONTEXT => 256

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_FLAG_IMPLICIT_RDPCM => 512

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_FLAG_EXPLICIT_RDPCM => 1024

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_FLAG_EXTENDED_PRECISION_PROCESSING => 2048

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_FLAG_INTRA_SMOOTHING_DISABLED => 4096

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_FLAG_HIGH_PRECISION_OFFSETS => 8192

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_FLAG_PERSISTENT_RICE_ADAPTATION => 16384

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_FLAG_CABAC_BYPASS_ALIGNMENT => 32768

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_FLAG_SEPARATE_COLOUR_PLANE => 65536
}
