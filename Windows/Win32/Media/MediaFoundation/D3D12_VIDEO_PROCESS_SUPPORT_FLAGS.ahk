#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies whether a video format and colorspace conversion operation is supported.
 * @remarks
 * This enumeration is used by the [D3D12_FEATURE_DATA_VIDEO_PROCESS_SUPPORT](ns-d3d12video-d3d12_feature_data_video_process_support.md) structure.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ne-d3d12video-d3d12_video_process_support_flags
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_PROCESS_SUPPORT_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The conversion from the source format and colorspace to destination format and colorspace are not supported.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_PROCESS_SUPPORT_FLAG_NONE => 0

    /**
     * The conversion from the source format and colorspace to destination format and colorspace are are supported.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_PROCESS_SUPPORT_FLAG_SUPPORTED => 1
}
