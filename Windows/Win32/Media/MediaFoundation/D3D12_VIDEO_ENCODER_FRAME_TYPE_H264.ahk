#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the type of an H.264 video frame.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ne-d3d12video-d3d12_video_encoder_frame_type_h264
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_ENCODER_FRAME_TYPE_H264 {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * I-Frame. Completely intra-coded frame.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_FRAME_TYPE_H264_I_FRAME => 0

    /**
     * P-Frame. Allows references to past frames.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_FRAME_TYPE_H264_P_FRAME => 1

    /**
     * B-Frame. Allows references to both past and future (in display order) frames.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_FRAME_TYPE_H264_B_FRAME => 2

    /**
     * Instantaneous decode refresh frame. Special type of I-frame where no frame after it can reference any frame before it.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_FRAME_TYPE_H264_IDR_FRAME => 3
}
