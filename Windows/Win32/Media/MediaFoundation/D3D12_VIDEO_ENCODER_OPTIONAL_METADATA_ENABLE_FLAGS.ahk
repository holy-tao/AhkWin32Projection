#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class D3D12_VIDEO_ENCODER_OPTIONAL_METADATA_ENABLE_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: D3D12_VIDEO_ENCODER_OPTIONAL_METADATA_ENABLE_FLAG_NONE
     * @type {Integer (Int32)}
     */
    static FLAG_NONE => 0

    /**
     * Native name: D3D12_VIDEO_ENCODER_OPTIONAL_METADATA_ENABLE_FLAG_QP_MAP
     * @type {Integer (Int32)}
     */
    static FLAG_QP_MAP => 1

    /**
     * Native name: D3D12_VIDEO_ENCODER_OPTIONAL_METADATA_ENABLE_FLAG_SATD_MAP
     * @type {Integer (Int32)}
     */
    static FLAG_SATD_MAP => 2

    /**
     * Native name: D3D12_VIDEO_ENCODER_OPTIONAL_METADATA_ENABLE_FLAG_RC_BIT_ALLOCATION_MAP
     * @type {Integer (Int32)}
     */
    static FLAG_RC_BIT_ALLOCATION_MAP => 4

    /**
     * Native name: D3D12_VIDEO_ENCODER_OPTIONAL_METADATA_ENABLE_FLAG_FRAME_PSNR
     * @type {Integer (Int32)}
     */
    static FLAG_FRAME_PSNR => 8

    /**
     * Native name: D3D12_VIDEO_ENCODER_OPTIONAL_METADATA_ENABLE_FLAG_SUBREGIONS_PSNR
     * @type {Integer (Int32)}
     */
    static FLAG_SUBREGIONS_PSNR => 16
}
