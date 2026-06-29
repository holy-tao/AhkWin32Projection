#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Graphics\Dxgi\Common\DXGI_RATIONAL.ahk" { DXGI_RATIONAL }
#Import "..\..\Graphics\Dxgi\Common\DXGI_COLOR_SPACE_TYPE.ahk" { DXGI_COLOR_SPACE_TYPE }
#Import "..\..\Graphics\Dxgi\Common\DXGI_FORMAT.ahk" { DXGI_FORMAT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\D3D12_VIDEO_PROCESS_ALPHA_FILL_MODE.ahk" { D3D12_VIDEO_PROCESS_ALPHA_FILL_MODE }

/**
 * Specifies output stream arguments for the output passed to ID3D12VideoProcessCommandList::ProcessFrames.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_process_output_stream_desc
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_PROCESS_OUTPUT_STREAM_DESC {
    #StructPack 4

    /**
     * A [DXGI_FORMAT](/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format) structure specifying the format of the output resources.
     */
    Format : DXGI_FORMAT

    /**
     * A [DXGI_COLOR_SPACE_TYPE](/windows/desktop/api/dxgicommon/ne-dxgicommon-dxgi_color_space_type) value that specifies the colorspace for the video processor output surface.
     */
    ColorSpace : DXGI_COLOR_SPACE_TYPE

    /**
     * A value from the [D3D12_VIDEO_PROCESS_ALPHA_FILL_MODE](ne-d3d12video-d3d12_video_process_alpha_fill_mode.md) enumeration specifying the alpha fill mode for data that the video processor writes to the render target.
     */
    AlphaFillMode : D3D12_VIDEO_PROCESS_ALPHA_FILL_MODE

    /**
     * The zero-based index of an input stream. This parameter is used if *AlphaFillMode* is [D3D12_VIDEO_PROCESS_ALPHA_FILL_MODE_SOURCE_STREAM](ne-d3d12video-d3d12_video_process_alpha_fill_mode.md). Otherwise, the parameter is ignored.
     */
    AlphaFillModeSourceStreamIndex : UInt32

    /**
     * The video processor uses the background color to fill areas of the target rectangle that do not contain a video image. Areas outside the target rectangle are not affected.  The meaning of the values are specified by the *ColorSpace* parameter.
     * 
     * | BackgroundColor   | YCbCrA   | RGBA    |
     * |-------------------|----------|---------|
     * | BackgroundColor[0]| Y        | R       |
     * | BackgroundColor[1]| Cb       | G       |
     * | BackgroundColor[2]| Cr       | B       |
     * | BackgroundColor[3]| A        | A       |
     */
    BackgroundColor : Float32[4]

    /**
     * A [DXGI_RATIONAL](/windows/desktop/api/dxgicommon/ns-dxgicommon-dxgi_rational) structure specifying the frame rate of the output video stream.
     */
    FrameRate : DXGI_RATIONAL

    /**
     * If TRUE, stereo output is enabled. Otherwise, the video processor produces mono video frames.
     */
    EnableStereo : BOOL

}
