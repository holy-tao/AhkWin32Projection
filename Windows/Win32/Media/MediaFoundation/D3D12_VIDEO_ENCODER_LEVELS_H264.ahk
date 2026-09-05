#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the encoder levels for H.264 encoding.
 * @remarks
 * Use this enumeration to specify the encoder level in a [D3D12_VIDEO_ENCODER_LEVEL_SETTING](ns-d3d12video-d3d12_video_encoder_level_setting.md) structure.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ne-d3d12video-d3d12_video_encoder_levels_h264
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class D3D12_VIDEO_ENCODER_LEVELS_H264 extends Win32Enum {

    /**
     * Level 1.
     * Native name: D3D12_VIDEO_ENCODER_LEVELS_H264_1
     * @type {Integer (Int32)}
     */
    static 1 => 0

    /**
     * Level 1b.
     * Native name: D3D12_VIDEO_ENCODER_LEVELS_H264_1b
     * @type {Integer (Int32)}
     */
    static 1b => 1

    /**
     * Level 1.1.
     * Native name: D3D12_VIDEO_ENCODER_LEVELS_H264_11
     * @type {Integer (Int32)}
     */
    static 11 => 2

    /**
     * Level 1.2.
     * Native name: D3D12_VIDEO_ENCODER_LEVELS_H264_12
     * @type {Integer (Int32)}
     */
    static 12 => 3

    /**
     * Level 1.3.
     * Native name: D3D12_VIDEO_ENCODER_LEVELS_H264_13
     * @type {Integer (Int32)}
     */
    static 13 => 4

    /**
     * Level 2.
     * Native name: D3D12_VIDEO_ENCODER_LEVELS_H264_2
     * @type {Integer (Int32)}
     */
    static 2 => 5

    /**
     * Level 2.1.
     * Native name: D3D12_VIDEO_ENCODER_LEVELS_H264_21
     * @type {Integer (Int32)}
     */
    static 21 => 6

    /**
     * Level 2.2.
     * Native name: D3D12_VIDEO_ENCODER_LEVELS_H264_22
     * @type {Integer (Int32)}
     */
    static 22 => 7

    /**
     * Level 3.
     * Native name: D3D12_VIDEO_ENCODER_LEVELS_H264_3
     * @type {Integer (Int32)}
     */
    static 3 => 8

    /**
     * Level 3.1.
     * Native name: D3D12_VIDEO_ENCODER_LEVELS_H264_31
     * @type {Integer (Int32)}
     */
    static 31 => 9

    /**
     * Level 3.2.
     * Native name: D3D12_VIDEO_ENCODER_LEVELS_H264_32
     * @type {Integer (Int32)}
     */
    static 32 => 10

    /**
     * Level 4.
     * Native name: D3D12_VIDEO_ENCODER_LEVELS_H264_4
     * @type {Integer (Int32)}
     */
    static 4 => 11

    /**
     * Level 4.1.
     * Native name: D3D12_VIDEO_ENCODER_LEVELS_H264_41
     * @type {Integer (Int32)}
     */
    static 41 => 12

    /**
     * Level 4.2.
     * Native name: D3D12_VIDEO_ENCODER_LEVELS_H264_42
     * @type {Integer (Int32)}
     */
    static 42 => 13

    /**
     * Level 5.
     * Native name: D3D12_VIDEO_ENCODER_LEVELS_H264_5
     * @type {Integer (Int32)}
     */
    static 5 => 14

    /**
     * Level 5.1.
     * Native name: D3D12_VIDEO_ENCODER_LEVELS_H264_51
     * @type {Integer (Int32)}
     */
    static 51 => 15

    /**
     * Level 5.2.
     * Native name: D3D12_VIDEO_ENCODER_LEVELS_H264_52
     * @type {Integer (Int32)}
     */
    static 52 => 16

    /**
     * Level 6.
     * Native name: D3D12_VIDEO_ENCODER_LEVELS_H264_6
     * @type {Integer (Int32)}
     */
    static 6 => 17

    /**
     * Level 6.1.
     * Native name: D3D12_VIDEO_ENCODER_LEVELS_H264_61
     * @type {Integer (Int32)}
     */
    static 61 => 18

    /**
     * Level 6.2.
     * Native name: D3D12_VIDEO_ENCODER_LEVELS_H264_62
     * @type {Integer (Int32)}
     */
    static 62 => 19
}
