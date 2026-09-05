#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class D3D12_VIDEO_ENCODER_RATE_CONTROL_FRAME_ANALYSIS_SUPPORT_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: D3D12_VIDEO_ENCODER_RATE_CONTROL_FRAME_ANALYSIS_SUPPORT_FLAG_NONE
     * @type {Integer (Int32)}
     */
    static FLAG_NONE => 0

    /**
     * Native name: D3D12_VIDEO_ENCODER_RATE_CONTROL_FRAME_ANALYSIS_SUPPORT_FLAG_INTRACODED_FRAME_SUPPORTED
     * @type {Integer (Int32)}
     */
    static FLAG_INTRACODED_FRAME_SUPPORTED => 1

    /**
     * Native name: D3D12_VIDEO_ENCODER_RATE_CONTROL_FRAME_ANALYSIS_SUPPORT_FLAG_UNIDIR_INTER_FRAME_SUPPORTED
     * @type {Integer (Int32)}
     */
    static FLAG_UNIDIR_INTER_FRAME_SUPPORTED => 2

    /**
     * Native name: D3D12_VIDEO_ENCODER_RATE_CONTROL_FRAME_ANALYSIS_SUPPORT_FLAG_BIDIR_INTER_FRAME_SUPPORTED
     * @type {Integer (Int32)}
     */
    static FLAG_BIDIR_INTER_FRAME_SUPPORTED => 4

    /**
     * Native name: D3D12_VIDEO_ENCODER_RATE_CONTROL_FRAME_ANALYSIS_SUPPORT_FLAG_EXTERNAL_DPB_DOWNSCALING
     * @type {Integer (Int32)}
     */
    static FLAG_EXTERNAL_DPB_DOWNSCALING => 8

    /**
     * Native name: D3D12_VIDEO_ENCODER_RATE_CONTROL_FRAME_ANALYSIS_SUPPORT_FLAG_DYNAMIC_1ST_PASS_SKIP
     * @type {Integer (Int32)}
     */
    static FLAG_DYNAMIC_1ST_PASS_SKIP => 16

    /**
     * Native name: D3D12_VIDEO_ENCODER_RATE_CONTROL_FRAME_ANALYSIS_SUPPORT_FLAG_DYNAMIC_DOWNSCALE_FACTOR_CHANGE_KEY_FRAME
     * @type {Integer (Int32)}
     */
    static FLAG_DYNAMIC_DOWNSCALE_FACTOR_CHANGE_KEY_FRAME => 32

    /**
     * Native name: D3D12_VIDEO_ENCODER_RATE_CONTROL_FRAME_ANALYSIS_SUPPORT_FLAG_SUPPORTED
     * @type {Integer (Int32)}
     */
    static FLAG_SUPPORTED => 7
}
