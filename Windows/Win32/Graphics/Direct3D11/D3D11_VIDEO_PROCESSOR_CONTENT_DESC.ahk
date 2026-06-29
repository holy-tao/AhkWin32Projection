#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D11_VIDEO_FRAME_FORMAT.ahk" { D3D11_VIDEO_FRAME_FORMAT }
#Import "..\Dxgi\Common\DXGI_RATIONAL.ahk" { DXGI_RATIONAL }
#Import ".\D3D11_VIDEO_USAGE.ahk" { D3D11_VIDEO_USAGE }

/**
 * Describes a video stream for a video processor.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_video_processor_content_desc
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_VIDEO_PROCESSOR_CONTENT_DESC {
    #StructPack 4

    /**
     * A member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_video_frame_format">D3D11_VIDEO_FRAME_FORMAT</a> enumeration that describes how the video stream is interlaced.
     */
    InputFrameFormat : D3D11_VIDEO_FRAME_FORMAT

    /**
     * The frame rate of the input video stream, specified as a <a href="https://docs.microsoft.com/windows/desktop/api/dxgicommon/ns-dxgicommon-dxgi_rational">DXGI_RATIONAL</a> structure.
     */
    InputFrameRate : DXGI_RATIONAL

    /**
     * The width of the input frames, in pixels.
     */
    InputWidth : UInt32

    /**
     * The height of the input frames, in pixels.
     */
    InputHeight : UInt32

    /**
     * The frame rate of the output video stream, specified as a <a href="https://docs.microsoft.com/windows/desktop/api/dxgicommon/ns-dxgicommon-dxgi_rational">DXGI_RATIONAL</a> structure.
     */
    OutputFrameRate : DXGI_RATIONAL

    /**
     * The width of the output frames, in pixels.
     */
    OutputWidth : UInt32

    /**
     * The height of the output frames, in pixels.
     */
    OutputHeight : UInt32

    /**
     * A member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_video_usage">D3D11_VIDEO_USAGE</a> enumeration that describes how the video processor will be used. The value indicates the desired trade-off between speed and video quality. The driver uses this flag as a hint when it creates the video processor.
     */
    Usage : D3D11_VIDEO_USAGE

}
