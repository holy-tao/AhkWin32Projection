#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the layout in memory of a stereo 3D video frame.
 * @remarks
 * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12video/ne-d3d12video-d3d12_video_frame_stereo_format
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_FRAME_STEREO_FORMAT{

    /**
     * No stereo format is specified.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_FRAME_STEREO_FORMAT_NONE => 0

    /**
     * The sample does not contain stereo data. If the stereo format is not specified, this value is the default.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_FRAME_STEREO_FORMAT_MONO => 1

    /**
     * Frame 0 and frame 1 are packed side-by-side, as shown in the following diagram.
 * 
 * ![Horizontal stereo format showing the frame 0 pixels on the left of a grid of pixels and the frame 1 pixels on the right](./images/stereo_format_horizontal.png)
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_FRAME_STEREO_FORMAT_HORIZONTAL => 2

    /**
     * Frame 0 and frame 1 are packed top-to-bottom, as shown in the following diagram.
 * 
 * ![Vertical stereo format showing the frame 0 pixels on the top of a grid of pixels and the frame 1 pixels on the bottom](./images/stereo_format_horizontal.png)
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_FRAME_STEREO_FORMAT_VERTICAL => 3

    /**
     * Frame 0 and frame 1 are placed in separate resources
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_FRAME_STEREO_FORMAT_SEPARATE => 4
}
