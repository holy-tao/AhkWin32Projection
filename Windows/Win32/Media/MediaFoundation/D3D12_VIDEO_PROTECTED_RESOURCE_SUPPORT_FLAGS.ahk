#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies support for protected resources in video operations.
 * @remarks
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12video/ne-d3d12video-d3d12_video_protected_resource_support_flags
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_PROTECTED_RESOURCE_SUPPORT_FLAGS{

    /**
     * Protected resources are not supported.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_PROTECTED_RESOURCE_SUPPORT_FLAG_NONE => 0

    /**
     * Protected resources are supported.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_PROTECTED_RESOURCE_SUPPORT_FLAG_SUPPORTED => 1
}
