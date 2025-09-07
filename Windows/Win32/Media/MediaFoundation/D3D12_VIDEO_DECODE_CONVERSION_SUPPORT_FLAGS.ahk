#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies whether a video decode conversion operation is supported.
 * @remarks
 * This enumeration is used by the [D3D12\_FEATURE\_DATA\_VIDEO\_DECODE\_CONVERSION\_SUPPORT](ns-d3d12video-d3d12_feature_data_video_decode_conversion_support.md) structure.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ne-d3d12video-d3d12_video_decode_conversion_support_flags
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_DECODE_CONVERSION_SUPPORT_FLAGS{

    /**
     * The video decode conversion operation isn't supported.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_DECODE_CONVERSION_SUPPORT_FLAG_NONE => 0

    /**
     * The video decode conversion operation is supported.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_DECODE_CONVERSION_SUPPORT_FLAG_SUPPORTED => 1
}
