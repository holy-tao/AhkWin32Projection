#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies an orientation operation to be performed by a video processor.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ne-d3d12video-d3d12_video_process_orientation
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_PROCESS_ORIENTATION {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * No change in orientation. 0 degrees.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_PROCESS_ORIENTATION_DEFAULT => 0

    /**
     * The image is flipped horizontally.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_PROCESS_ORIENTATION_FLIP_HORIZONTAL => 1

    /**
     * The image is rotated 90 degrees clockwise.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_PROCESS_ORIENTATION_CLOCKWISE_90 => 2

    /**
     * The image is rotated 90 degrees clockwise and then flipped horizontally.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_PROCESS_ORIENTATION_CLOCKWISE_90_FLIP_HORIZONTAL => 3

    /**
     * The image is rotated 180 degrees clockwise.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_PROCESS_ORIENTATION_CLOCKWISE_180 => 4

    /**
     * The image is flipped vertically.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_PROCESS_ORIENTATION_FLIP_VERTICAL => 5

    /**
     * The image is rotated 270 degrees clockwise.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_PROCESS_ORIENTATION_CLOCKWISE_270 => 6

    /**
     * The image is rotated 270 degrees clockwise and then flipped horizontally.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_PROCESS_ORIENTATION_CLOCKWISE_270_FLIP_HORIZONTAL => 7
}
