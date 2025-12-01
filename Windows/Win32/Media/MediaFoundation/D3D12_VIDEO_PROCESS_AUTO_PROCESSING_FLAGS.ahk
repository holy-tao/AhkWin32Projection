#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the automatic processing features that a video processor can support.
 * @remarks
 * This enumeration is used by the [D3D12\_FEATURE\_DATA\_VIDEO\_PROCESS\_SUPPORT](ns-d3d12video-d3d12_feature_data_video_process_support.md) structure.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ne-d3d12video-d3d12_video_process_auto_processing_flags
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_PROCESS_AUTO_PROCESSING_FLAGS extends Win32BitflagEnum{

    /**
     * No automatic processing features are supported.
     * @type {Integer (UInt32)}
     */
    static D3D12_VIDEO_PROCESS_AUTO_PROCESSING_FLAG_NONE => 0

    /**
     * Denoise is supported.
     * @type {Integer (UInt32)}
     */
    static D3D12_VIDEO_PROCESS_AUTO_PROCESSING_FLAG_DENOISE => 1

    /**
     * Deringing is supported.
     * @type {Integer (UInt32)}
     */
    static D3D12_VIDEO_PROCESS_AUTO_PROCESSING_FLAG_DERINGING => 2

    /**
     * Edge enhancement is supported.
     * @type {Integer (UInt32)}
     */
    static D3D12_VIDEO_PROCESS_AUTO_PROCESSING_FLAG_EDGE_ENHANCEMENT => 4

    /**
     * Color correction is supported.
     * @type {Integer (UInt32)}
     */
    static D3D12_VIDEO_PROCESS_AUTO_PROCESSING_FLAG_COLOR_CORRECTION => 8

    /**
     * Flesh tone mapping is supported.
     * @type {Integer (UInt32)}
     */
    static D3D12_VIDEO_PROCESS_AUTO_PROCESSING_FLAG_FLESH_TONE_MAPPING => 16

    /**
     * Image stabilization is supported.
     * @type {Integer (UInt32)}
     */
    static D3D12_VIDEO_PROCESS_AUTO_PROCESSING_FLAG_IMAGE_STABILIZATION => 32

    /**
     * Enhanced image resolution is supported.
     * @type {Integer (UInt32)}
     */
    static D3D12_VIDEO_PROCESS_AUTO_PROCESSING_FLAG_SUPER_RESOLUTION => 64

    /**
     * Anamorphic scaling is supported.
     * @type {Integer (UInt32)}
     */
    static D3D12_VIDEO_PROCESS_AUTO_PROCESSING_FLAG_ANAMORPHIC_SCALING => 128

    /**
     * Additional processing features, not described by the other flags, are available.
     * @type {Integer (UInt32)}
     */
    static D3D12_VIDEO_PROCESS_AUTO_PROCESSING_FLAG_CUSTOM => 2147483648
}
