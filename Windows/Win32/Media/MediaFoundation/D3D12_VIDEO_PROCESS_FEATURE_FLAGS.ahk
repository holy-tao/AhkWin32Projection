#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the features that a video processor can support.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ne-d3d12video-d3d12_video_process_feature_flags
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_PROCESS_FEATURE_FLAGS extends Win32BitflagEnum{

    /**
     * No features are supported.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_PROCESS_FEATURE_FLAG_NONE => 0

    /**
     * The video processor can set alpha values on the output pixels. The alpha fill mode is used in <a href="ns-d3d12video-d3d12_video_process_output_stream_desc.md">D3D12_VIDEO_PROCESS_OUTPUT_STREAM_DESC</a>.  <a href="ne-d3d12video-d3d12_video_process_alpha_fill_mode.md">D3D12_VIDEO_PROCESS_ALPHA_FILL_MODE_OPAQUE</a> must be always supported.  The background, destination, and source stream modes are only supported when the driver reports D3D12_VIDEO_PROCESS_FEATURE_FLAG_ALPHA_FILL.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_PROCESS_FEATURE_FLAG_ALPHA_FILL => 1

    /**
     * The video processor can perform luma keying.  Luma keying is configured via the **D3D12_VIDEO_PROCESS_LUMA_KEY** member of the <a href="ns-d3d12video-d3d12_video_process_input_stream_arguments.md">D3D12_VIDEO_PROCESS_INPUT_STREAM_ARGUMENTS</a> structure. For more information see <a href=ns-d3d12video-d3d12_video_process_luma_key"">D3D12_VIDEO_PROCESS_LUMA_KEY</a>.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_PROCESS_FEATURE_FLAG_LUMA_KEY => 2

    /**
     * The video processor can support 3D stereo video. For more information, see <a href="ne-d3d12video-d3d12_video_frame_stereo_format.md">D3D12_VIDEO_FRAME_STEREO_FORMAT</a>.
     * 
     * All drivers setting this capability must support the following stereo formats: D3D12_VIDEO_PROCESS_STEREO_FORMAT_HORIZONTAL, D3D12_VIDEO_PROCESS_STEREO_FORMAT_VERTICAL, and D3D12_VIDEO_PROCESS_STEREO_FORMAT_SEPARATE.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_PROCESS_FEATURE_FLAG_STEREO => 4

    /**
     * The driver can rotate the input data either 90, 180, or 270 degrees clockwise as part of the video processing operation.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_PROCESS_FEATURE_FLAG_ROTATION => 8

    /**
     * The driver can flip the input data horizontally or vertically, together or separately with a video rotation operation.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_PROCESS_FEATURE_FLAG_FLIP => 16

    /**
     * Alpha blending and a planar alpha may be set in the **AlphaBlending** member of the <a href="ns-d3d12video-d3d12_video_process_input_stream_arguments.md">D3D12_VIDEO_PROCESS_INPUT_STREAM_ARGUMENTS</a> structure.  For more information see <a href="ns-d3d12video-d3d12_video_process_alpha_blending.md">D3D12_VIDEO_PROCESS_ALPHA_BLENDING</a>.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_PROCESS_FEATURE_FLAG_ALPHA_BLENDING => 32

    /**
     * The driver supports changing the pixel aspect ratio.  If the driver does not report this capability, then the **SourceAspectRatio** and **DestinationAspectRatio** members of <a href="ns-d3d12video-d3d12_video_process_input_stream_arguments.md">D3D12_VIDEO_PROCESS_INPUT_STREAM_ARGUMENTS</a> structure must indicate a 1:1 aspect ratio.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_PROCESS_FEATURE_FLAG_PIXEL_ASPECT_RATIO => 64
}
