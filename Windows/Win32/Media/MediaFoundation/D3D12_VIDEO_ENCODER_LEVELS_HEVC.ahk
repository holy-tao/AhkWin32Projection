#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the encoder levels for High Efficiency Video Coding (HEVC) encoding.
 * @remarks
 * Use this enumeration to specify the encoder tier in a [D3D12_VIDEO_ENCODER_LEVEL_TIER_CONSTRAINTS_HEVC](ns-d3d12video-d3d12_video_encoder_level_tier_constraints_hevc.md) structure.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ne-d3d12video-d3d12_video_encoder_levels_hevc
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class D3D12_VIDEO_ENCODER_LEVELS_HEVC extends Win32Enum {

    /**
     * Level 1.
     * Native name: D3D12_VIDEO_ENCODER_LEVELS_HEVC_1
     * @type {Integer (Int32)}
     */
    static 1 => 0

    /**
     * Level 2.
     * Native name: D3D12_VIDEO_ENCODER_LEVELS_HEVC_2
     * @type {Integer (Int32)}
     */
    static 2 => 1

    /**
     * Level 2.1.
     * Native name: D3D12_VIDEO_ENCODER_LEVELS_HEVC_21
     * @type {Integer (Int32)}
     */
    static 21 => 2

    /**
     * Level 3.
     * Native name: D3D12_VIDEO_ENCODER_LEVELS_HEVC_3
     * @type {Integer (Int32)}
     */
    static 3 => 3

    /**
     * Level 3.1.
     * Native name: D3D12_VIDEO_ENCODER_LEVELS_HEVC_31
     * @type {Integer (Int32)}
     */
    static 31 => 4

    /**
     * Level 4.
     * Native name: D3D12_VIDEO_ENCODER_LEVELS_HEVC_4
     * @type {Integer (Int32)}
     */
    static 4 => 5

    /**
     * Level 4.1.
     * Native name: D3D12_VIDEO_ENCODER_LEVELS_HEVC_41
     * @type {Integer (Int32)}
     */
    static 41 => 6

    /**
     * Level 5.
     * Native name: D3D12_VIDEO_ENCODER_LEVELS_HEVC_5
     * @type {Integer (Int32)}
     */
    static 5 => 7

    /**
     * Level 5.1.
     * Native name: D3D12_VIDEO_ENCODER_LEVELS_HEVC_51
     * @type {Integer (Int32)}
     */
    static 51 => 8

    /**
     * Level 5.2.
     * Native name: D3D12_VIDEO_ENCODER_LEVELS_HEVC_52
     * @type {Integer (Int32)}
     */
    static 52 => 9

    /**
     * Level 6.
     * Native name: D3D12_VIDEO_ENCODER_LEVELS_HEVC_6
     * @type {Integer (Int32)}
     */
    static 6 => 10

    /**
     * Level 6.1.
     * Native name: D3D12_VIDEO_ENCODER_LEVELS_HEVC_61
     * @type {Integer (Int32)}
     */
    static 61 => 11

    /**
     * Level 6.2.
     * Native name: D3D12_VIDEO_ENCODER_LEVELS_HEVC_62
     * @type {Integer (Int32)}
     */
    static 62 => 12
}
