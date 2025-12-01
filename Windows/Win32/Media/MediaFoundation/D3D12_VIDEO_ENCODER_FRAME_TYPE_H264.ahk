#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of an H.264 video frame.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ne-d3d12video-d3d12_video_encoder_frame_type_h264
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_FRAME_TYPE_H264 extends Win32Enum{

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
