#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_OPTIONAL_METADATA_ENABLE_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_OPTIONAL_METADATA_ENABLE_FLAG_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_OPTIONAL_METADATA_ENABLE_FLAG_QP_MAP => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_OPTIONAL_METADATA_ENABLE_FLAG_SATD_MAP => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_OPTIONAL_METADATA_ENABLE_FLAG_RC_BIT_ALLOCATION_MAP => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_OPTIONAL_METADATA_ENABLE_FLAG_FRAME_PSNR => 8

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_OPTIONAL_METADATA_ENABLE_FLAG_SUBREGIONS_PSNR => 16
}
