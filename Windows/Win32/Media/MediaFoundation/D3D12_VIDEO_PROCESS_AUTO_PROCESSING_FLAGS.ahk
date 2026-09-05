#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the automatic processing features that a video processor can support.
 * @remarks
 * This enumeration is used by the [D3D12\_FEATURE\_DATA\_VIDEO\_PROCESS\_SUPPORT](ns-d3d12video-d3d12_feature_data_video_process_support.md) structure.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ne-d3d12video-d3d12_video_process_auto_processing_flags
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class D3D12_VIDEO_PROCESS_AUTO_PROCESSING_FLAGS extends Win32BitflagEnum {

    /**
     * No automatic processing features are supported.
     * Native name: D3D12_VIDEO_PROCESS_AUTO_PROCESSING_FLAG_NONE
     * @type {Integer (UInt32)}
     */
    static FLAG_NONE => 0

    /**
     * Denoise is supported.
     * Native name: D3D12_VIDEO_PROCESS_AUTO_PROCESSING_FLAG_DENOISE
     * @type {Integer (UInt32)}
     */
    static FLAG_DENOISE => 1

    /**
     * Deringing is supported.
     * Native name: D3D12_VIDEO_PROCESS_AUTO_PROCESSING_FLAG_DERINGING
     * @type {Integer (UInt32)}
     */
    static FLAG_DERINGING => 2

    /**
     * Edge enhancement is supported.
     * Native name: D3D12_VIDEO_PROCESS_AUTO_PROCESSING_FLAG_EDGE_ENHANCEMENT
     * @type {Integer (UInt32)}
     */
    static FLAG_EDGE_ENHANCEMENT => 4

    /**
     * Color correction is supported.
     * Native name: D3D12_VIDEO_PROCESS_AUTO_PROCESSING_FLAG_COLOR_CORRECTION
     * @type {Integer (UInt32)}
     */
    static FLAG_COLOR_CORRECTION => 8

    /**
     * Flesh tone mapping is supported.
     * Native name: D3D12_VIDEO_PROCESS_AUTO_PROCESSING_FLAG_FLESH_TONE_MAPPING
     * @type {Integer (UInt32)}
     */
    static FLAG_FLESH_TONE_MAPPING => 16

    /**
     * Image stabilization is supported.
     * Native name: D3D12_VIDEO_PROCESS_AUTO_PROCESSING_FLAG_IMAGE_STABILIZATION
     * @type {Integer (UInt32)}
     */
    static FLAG_IMAGE_STABILIZATION => 32

    /**
     * Enhanced image resolution is supported.
     * Native name: D3D12_VIDEO_PROCESS_AUTO_PROCESSING_FLAG_SUPER_RESOLUTION
     * @type {Integer (UInt32)}
     */
    static FLAG_SUPER_RESOLUTION => 64

    /**
     * Anamorphic scaling is supported.
     * Native name: D3D12_VIDEO_PROCESS_AUTO_PROCESSING_FLAG_ANAMORPHIC_SCALING
     * @type {Integer (UInt32)}
     */
    static FLAG_ANAMORPHIC_SCALING => 128

    /**
     * Additional processing features, not described by the other flags, are available.
     * Native name: D3D12_VIDEO_PROCESS_AUTO_PROCESSING_FLAG_CUSTOM
     * @type {Integer (UInt32)}
     */
    static FLAG_CUSTOM => 2147483648
}
