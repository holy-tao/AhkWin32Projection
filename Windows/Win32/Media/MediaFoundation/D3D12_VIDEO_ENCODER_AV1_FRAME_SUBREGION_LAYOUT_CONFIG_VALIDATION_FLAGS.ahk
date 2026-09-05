#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class D3D12_VIDEO_ENCODER_AV1_FRAME_SUBREGION_LAYOUT_CONFIG_VALIDATION_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_FRAME_SUBREGION_LAYOUT_CONFIG_VALIDATION_FLAG_NONE
     * @type {Integer (Int32)}
     */
    static FLAG_NONE => 0

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_FRAME_SUBREGION_LAYOUT_CONFIG_VALIDATION_FLAG_NOT_SPECIFIED
     * @type {Integer (Int32)}
     */
    static FLAG_NOT_SPECIFIED => 1

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_FRAME_SUBREGION_LAYOUT_CONFIG_VALIDATION_FLAG_CODEC_CONSTRAINT
     * @type {Integer (Int32)}
     */
    static FLAG_CODEC_CONSTRAINT => 2

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_FRAME_SUBREGION_LAYOUT_CONFIG_VALIDATION_FLAG_HARDWARE_CONSTRAINT
     * @type {Integer (Int32)}
     */
    static FLAG_HARDWARE_CONSTRAINT => 4

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_FRAME_SUBREGION_LAYOUT_CONFIG_VALIDATION_FLAG_ROWS_COUNT
     * @type {Integer (Int32)}
     */
    static FLAG_ROWS_COUNT => 8

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_FRAME_SUBREGION_LAYOUT_CONFIG_VALIDATION_FLAG_COLS_COUNT
     * @type {Integer (Int32)}
     */
    static FLAG_COLS_COUNT => 16

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_FRAME_SUBREGION_LAYOUT_CONFIG_VALIDATION_FLAG_WIDTH
     * @type {Integer (Int32)}
     */
    static FLAG_WIDTH => 32

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_FRAME_SUBREGION_LAYOUT_CONFIG_VALIDATION_FLAG_AREA
     * @type {Integer (Int32)}
     */
    static FLAG_AREA => 64

    /**
     * Native name: D3D12_VIDEO_ENCODER_AV1_FRAME_SUBREGION_LAYOUT_CONFIG_VALIDATION_FLAG_TOTAL_TILES
     * @type {Integer (Int32)}
     */
    static FLAG_TOTAL_TILES => 128
}
