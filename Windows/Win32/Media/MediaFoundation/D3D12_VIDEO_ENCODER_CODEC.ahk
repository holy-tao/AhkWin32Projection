#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies codecs for Direct3D 12 video encoding.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ne-d3d12video-d3d12_video_encoder_codec
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_ENCODER_CODEC {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * H.264 video
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_CODEC_H264 => 0

    /**
     * High Efficiency Video Coding (HEVC) video
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_CODEC_HEVC => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_CODEC_AV1 => 2
}
