#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifes the status of a video decode operation.
 * @remarks
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12video/ne-d3d12video-d3d12_video_decode_status
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_DECODE_STATUS{

    /**
     * The operation succeeded.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_DECODE_STATUS_OK => 0

    /**
     * There was a minor problem in the data format, but the host decoder should continue processing.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_DECODE_STATUS_CONTINUE => 1

    /**
     * There was a significant problem in the data format. The host decoder should continue processing, but should skip display.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_DECODE_STATUS_CONTINUE_SKIP_DISPLAY => 2

    /**
     * There was a severe problem in the data format. The host decoder should restart the entire decoding process, starting at a sequence or random-access entry point.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_DECODE_STATUS_RESTART => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_DECODE_STATUS_RATE_EXCEEDED => 4
}
