#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies support for protected resources in video operations.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ne-d3d12video-d3d12_video_protected_resource_support_flags
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_PROTECTED_RESOURCE_SUPPORT_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
