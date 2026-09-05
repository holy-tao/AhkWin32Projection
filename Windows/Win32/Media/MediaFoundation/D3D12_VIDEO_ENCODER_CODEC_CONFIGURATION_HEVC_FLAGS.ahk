#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies configuration flags for HEVC video encoding.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ne-d3d12video-d3d12_video_encoder_codec_configuration_hevc_flags
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_FLAGS extends Win32BitflagEnum {

    /**
     * None.
     * Native name: D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_FLAG_NONE
     * @type {Integer (Int32)}
     */
    static FLAG_NONE => 0

    /**
     * Disables loop filtering across slices.
     * Native name: D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_FLAG_DISABLE_LOOP_FILTER_ACROSS_SLICES
     * @type {Integer (Int32)}
     */
    static FLAG_DISABLE_LOOP_FILTER_ACROSS_SLICES => 1

    /**
     * Allows the usage of the intra constrained slices flag in picture control. This mode restricts the motion vector search range to the region box of the current slice, i.e. motion vectors outside the slice boundary can't be used.
     * Native name: D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_FLAG_ALLOW_REQUEST_INTRA_CONSTRAINED_SLICES
     * @type {Integer (Int32)}
     */
    static FLAG_ALLOW_REQUEST_INTRA_CONSTRAINED_SLICES => 2

    /**
     * Enables the sample adaptive offset filter.
     * Native name: D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_FLAG_ENABLE_SAO_FILTER
     * @type {Integer (Int32)}
     */
    static FLAG_ENABLE_SAO_FILTER => 4

    /**
     * Enables the usage of long term references in the picture reference management structures for HEVC.
     * Native name: D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_FLAG_ENABLE_LONG_TERM_REFERENCES
     * @type {Integer (Int32)}
     */
    static FLAG_ENABLE_LONG_TERM_REFERENCES => 8

    /**
     * Enables asymetric motion partitioning.
     * 
     * **Note** If [D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_HEVC_FLAG_ASYMETRIC_MOTION_PARTITION_REQUIRED](ne-d3d12video-d3d12_video_encoder_codec_configuration_support_hevc_flags.md) was reported, this flag must be enabled.
     * Native name: D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_FLAG_USE_ASYMETRIC_MOTION_PARTITION
     * @type {Integer (Int32)}
     */
    static FLAG_USE_ASYMETRIC_MOTION_PARTITION => 16

    /**
     * Enables transform skipping.
     * Native name: D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_FLAG_ENABLE_TRANSFORM_SKIPPING
     * @type {Integer (Int32)}
     */
    static FLAG_ENABLE_TRANSFORM_SKIPPING => 32

    /**
     * Enables constrained intra prediction. This refers to constrained_intra_pred_flag in the PPS.
     * Native name: D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_FLAG_USE_CONSTRAINED_INTRAPREDICTION
     * @type {Integer (Int32)}
     */
    static FLAG_USE_CONSTRAINED_INTRAPREDICTION => 64

    /**
     * Native name: D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_FLAG_TRANSFORM_SKIP_ROTATION
     * @type {Integer (Int32)}
     */
    static FLAG_TRANSFORM_SKIP_ROTATION => 128

    /**
     * Native name: D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_FLAG_TRANSFORM_SKIP_CONTEXT
     * @type {Integer (Int32)}
     */
    static FLAG_TRANSFORM_SKIP_CONTEXT => 256

    /**
     * Native name: D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_FLAG_IMPLICIT_RDPCM
     * @type {Integer (Int32)}
     */
    static FLAG_IMPLICIT_RDPCM => 512

    /**
     * Native name: D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_FLAG_EXPLICIT_RDPCM
     * @type {Integer (Int32)}
     */
    static FLAG_EXPLICIT_RDPCM => 1024

    /**
     * Native name: D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_FLAG_EXTENDED_PRECISION_PROCESSING
     * @type {Integer (Int32)}
     */
    static FLAG_EXTENDED_PRECISION_PROCESSING => 2048

    /**
     * Native name: D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_FLAG_INTRA_SMOOTHING_DISABLED
     * @type {Integer (Int32)}
     */
    static FLAG_INTRA_SMOOTHING_DISABLED => 4096

    /**
     * Native name: D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_FLAG_HIGH_PRECISION_OFFSETS
     * @type {Integer (Int32)}
     */
    static FLAG_HIGH_PRECISION_OFFSETS => 8192

    /**
     * Native name: D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_FLAG_PERSISTENT_RICE_ADAPTATION
     * @type {Integer (Int32)}
     */
    static FLAG_PERSISTENT_RICE_ADAPTATION => 16384

    /**
     * Native name: D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_FLAG_CABAC_BYPASS_ALIGNMENT
     * @type {Integer (Int32)}
     */
    static FLAG_CABAC_BYPASS_ALIGNMENT => 32768

    /**
     * Native name: D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_FLAG_SEPARATE_COLOUR_PLANE
     * @type {Integer (Int32)}
     */
    static FLAG_SEPARATE_COLOUR_PLANE => 65536

    /**
     * Native name: D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_FLAG_TEMPORAL_MVP_ENABLED
     * @type {Integer (Int32)}
     */
    static FLAG_TEMPORAL_MVP_ENABLED => 131072

    /**
     * Native name: D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_FLAG_STRONG_INTRA_SMOOTHING_ENABLED
     * @type {Integer (Int32)}
     */
    static FLAG_STRONG_INTRA_SMOOTHING_ENABLED => 262144
}
