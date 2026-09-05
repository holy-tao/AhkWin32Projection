#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies support for protected resources in video operations.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ne-d3d12video-d3d12_video_protected_resource_support_flags
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class D3D12_VIDEO_PROTECTED_RESOURCE_SUPPORT_FLAGS extends Win32BitflagEnum {

    /**
     * Protected resources are not supported.
     * Native name: D3D12_VIDEO_PROTECTED_RESOURCE_SUPPORT_FLAG_NONE
     * @type {Integer (Int32)}
     */
    static FLAG_NONE => 0

    /**
     * Protected resources are supported.
     * Native name: D3D12_VIDEO_PROTECTED_RESOURCE_SUPPORT_FLAG_SUPPORTED
     * @type {Integer (Int32)}
     */
    static FLAG_SUPPORTED => 1
}
