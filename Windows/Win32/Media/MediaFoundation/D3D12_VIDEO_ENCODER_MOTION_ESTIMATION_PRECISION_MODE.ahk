#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies motion estimation precision modes for video encoding.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ne-d3d12video-d3d12_video_encoder_motion_estimation_precision_mode
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_ENCODER_MOTION_ESTIMATION_PRECISION_MODE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * No limit in the precision for motion estimation vectors. This mode allows the maximum precision supported by the driver.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_MOTION_ESTIMATION_PRECISION_MODE_MAXIMUM => 0

    /**
     * The precision for motion estimation vectors has to be at most full pixel.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_MOTION_ESTIMATION_PRECISION_MODE_FULL_PIXEL => 1

    /**
     * The precision for motion estimation vectors has to be at most half pixel.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_MOTION_ESTIMATION_PRECISION_MODE_HALF_PIXEL => 2

    /**
     * The precision for motion estimation vectors has to be at most quarter pixel.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_MOTION_ESTIMATION_PRECISION_MODE_QUARTER_PIXEL => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_MOTION_ESTIMATION_PRECISION_MODE_EIGHTH_PIXEL => 4
}
