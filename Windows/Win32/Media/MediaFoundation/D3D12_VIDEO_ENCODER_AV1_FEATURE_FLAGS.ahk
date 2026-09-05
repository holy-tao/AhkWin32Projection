#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class D3D12_VIDEO_ENCODER_AV1_FEATURE_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_FEATURE_FLAG_NONE
     * @type {Integer (Int32)}
     */
    static FLAG_NONE => 0

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_FEATURE_FLAG_128x128_SUPERBLOCK
     * @type {Integer (Int32)}
     */
    static FLAG_128x128_SUPERBLOCK => 1

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_FEATURE_FLAG_FILTER_INTRA
     * @type {Integer (Int32)}
     */
    static FLAG_FILTER_INTRA => 2

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_FEATURE_FLAG_INTRA_EDGE_FILTER
     * @type {Integer (Int32)}
     */
    static FLAG_INTRA_EDGE_FILTER => 4

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_FEATURE_FLAG_INTERINTRA_COMPOUND
     * @type {Integer (Int32)}
     */
    static FLAG_INTERINTRA_COMPOUND => 8

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_FEATURE_FLAG_MASKED_COMPOUND
     * @type {Integer (Int32)}
     */
    static FLAG_MASKED_COMPOUND => 16

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_FEATURE_FLAG_WARPED_MOTION
     * @type {Integer (Int32)}
     */
    static FLAG_WARPED_MOTION => 32

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_FEATURE_FLAG_DUAL_FILTER
     * @type {Integer (Int32)}
     */
    static FLAG_DUAL_FILTER => 64

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_FEATURE_FLAG_JNT_COMP
     * @type {Integer (Int32)}
     */
    static FLAG_JNT_COMP => 128

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_FEATURE_FLAG_FORCED_INTEGER_MOTION_VECTORS
     * @type {Integer (Int32)}
     */
    static FLAG_FORCED_INTEGER_MOTION_VECTORS => 256

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_FEATURE_FLAG_SUPER_RESOLUTION
     * @type {Integer (Int32)}
     */
    static FLAG_SUPER_RESOLUTION => 512

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_FEATURE_FLAG_LOOP_RESTORATION_FILTER
     * @type {Integer (Int32)}
     */
    static FLAG_LOOP_RESTORATION_FILTER => 1024

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_FEATURE_FLAG_PALETTE_ENCODING
     * @type {Integer (Int32)}
     */
    static FLAG_PALETTE_ENCODING => 2048

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_FEATURE_FLAG_CDEF_FILTERING
     * @type {Integer (Int32)}
     */
    static FLAG_CDEF_FILTERING => 4096

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_FEATURE_FLAG_INTRA_BLOCK_COPY
     * @type {Integer (Int32)}
     */
    static FLAG_INTRA_BLOCK_COPY => 8192

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_FEATURE_FLAG_FRAME_REFERENCE_MOTION_VECTORS
     * @type {Integer (Int32)}
     */
    static FLAG_FRAME_REFERENCE_MOTION_VECTORS => 16384

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_FEATURE_FLAG_ORDER_HINT_TOOLS
     * @type {Integer (Int32)}
     */
    static FLAG_ORDER_HINT_TOOLS => 32768

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_FEATURE_FLAG_AUTO_SEGMENTATION
     * @type {Integer (Int32)}
     */
    static FLAG_AUTO_SEGMENTATION => 65536

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_FEATURE_FLAG_CUSTOM_SEGMENTATION
     * @type {Integer (Int32)}
     */
    static FLAG_CUSTOM_SEGMENTATION => 131072

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_FEATURE_FLAG_LOOP_FILTER_DELTAS
     * @type {Integer (Int32)}
     */
    static FLAG_LOOP_FILTER_DELTAS => 262144

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_FEATURE_FLAG_QUANTIZATION_DELTAS
     * @type {Integer (Int32)}
     */
    static FLAG_QUANTIZATION_DELTAS => 524288

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_FEATURE_FLAG_QUANTIZATION_MATRIX
     * @type {Integer (Int32)}
     */
    static FLAG_QUANTIZATION_MATRIX => 1048576

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_FEATURE_FLAG_REDUCED_TX_SET
     * @type {Integer (Int32)}
     */
    static FLAG_REDUCED_TX_SET => 2097152

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_FEATURE_FLAG_MOTION_MODE_SWITCHABLE
     * @type {Integer (Int32)}
     */
    static FLAG_MOTION_MODE_SWITCHABLE => 4194304

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_FEATURE_FLAG_ALLOW_HIGH_PRECISION_MV
     * @type {Integer (Int32)}
     */
    static FLAG_ALLOW_HIGH_PRECISION_MV => 8388608

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_FEATURE_FLAG_SKIP_MODE_PRESENT
     * @type {Integer (Int32)}
     */
    static FLAG_SKIP_MODE_PRESENT => 16777216

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_FEATURE_FLAG_DELTA_LF_PARAMS
     * @type {Integer (Int32)}
     */
    static FLAG_DELTA_LF_PARAMS => 33554432

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_FEATURE_FLAG_DISABLE_CDF_UPDATE_UNSUPPORTED
     * @type {Integer (Int32)}
     */
    static FLAG_DISABLE_CDF_UPDATE_UNSUPPORTED => 67108864
}
