#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Graphics\Dxgi\Common\DXGI_COLOR_SPACE_TYPE.ahk" { DXGI_COLOR_SPACE_TYPE }
#Import "..\..\Graphics\Dxgi\Common\DXGI_FORMAT.ahk" { DXGI_FORMAT }
#Import ".\D3D12_VIDEO_FORMAT.ahk" { D3D12_VIDEO_FORMAT }

/**
 * Describes the width, height, format, and color space of a picture buffer.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_sample
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_SAMPLE {
    #StructPack 4

    /**
     * The width of the sample.
     */
    Width : UInt32

    /**
     * The height of the sample.
     */
    Height : UInt32

    /**
     * A [D3D12_VIDEO_FORMAT](ns-d3d12video-d3d12_video_format.md) structure describing the format and colorspace of the sample.
     */
    Format : D3D12_VIDEO_FORMAT

}
