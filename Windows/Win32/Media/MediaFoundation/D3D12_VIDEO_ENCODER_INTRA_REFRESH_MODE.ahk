#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies video encoder intra refresh modes.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ne-d3d12video-d3d12_video_encoder_intra_refresh_mode
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_ENCODER_INTRA_REFRESH_MODE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The encoder does not use intra refresh.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_INTRA_REFRESH_MODE_NONE => 0

    /**
     * Row-based intra refresh mode.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_INTRA_REFRESH_MODE_ROW_BASED => 1
}
