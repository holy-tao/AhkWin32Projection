#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class D3D12_VIDEO_ENCODER_AV1_POST_ENCODE_VALUES_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_POST_ENCODE_VALUES_FLAG_NONE
     * @type {Integer (Int32)}
     */
    static FLAG_NONE => 0

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_POST_ENCODE_VALUES_FLAG_QUANTIZATION
     * @type {Integer (Int32)}
     */
    static FLAG_QUANTIZATION => 1

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_POST_ENCODE_VALUES_FLAG_QUANTIZATION_DELTA
     * @type {Integer (Int32)}
     */
    static FLAG_QUANTIZATION_DELTA => 2

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_POST_ENCODE_VALUES_FLAG_LOOP_FILTER
     * @type {Integer (Int32)}
     */
    static FLAG_LOOP_FILTER => 4

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_POST_ENCODE_VALUES_FLAG_LOOP_FILTER_DELTA
     * @type {Integer (Int32)}
     */
    static FLAG_LOOP_FILTER_DELTA => 8

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_POST_ENCODE_VALUES_FLAG_CDEF_DATA
     * @type {Integer (Int32)}
     */
    static FLAG_CDEF_DATA => 16

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_POST_ENCODE_VALUES_FLAG_CONTEXT_UPDATE_TILE_ID
     * @type {Integer (Int32)}
     */
    static FLAG_CONTEXT_UPDATE_TILE_ID => 32

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_POST_ENCODE_VALUES_FLAG_COMPOUND_PREDICTION_MODE
     * @type {Integer (Int32)}
     */
    static FLAG_COMPOUND_PREDICTION_MODE => 64

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_POST_ENCODE_VALUES_FLAG_PRIMARY_REF_FRAME
     * @type {Integer (Int32)}
     */
    static FLAG_PRIMARY_REF_FRAME => 128

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_POST_ENCODE_VALUES_FLAG_REFERENCE_INDICES
     * @type {Integer (Int32)}
     */
    static FLAG_REFERENCE_INDICES => 256
}
