#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the encoder profiles for H.264 encoding.
 * @remarks
 * Use this enumeration to specify the encoder profile in a [D3D12_VIDEO_ENCODER_PROFILE_DESC](ns-d3d12video-d3d12_video_encoder_profile_desc.md) structure.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ne-d3d12video-d3d12_video_encoder_profile_h264
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_ENCODER_PROFILE_H264 {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Main profile.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_PROFILE_H264_MAIN => 0

    /**
     * High profile.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_PROFILE_H264_HIGH => 1

    /**
     * High 10 profile.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_PROFILE_H264_HIGH_10 => 2
}
