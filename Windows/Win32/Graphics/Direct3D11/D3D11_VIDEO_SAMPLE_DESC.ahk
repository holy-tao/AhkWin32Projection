#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Dxgi\Common\DXGI_COLOR_SPACE_TYPE.ahk" { DXGI_COLOR_SPACE_TYPE }
#Import "..\Dxgi\Common\DXGI_FORMAT.ahk" { DXGI_FORMAT }

/**
 * Describes a video sample.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11_1/ns-d3d11_1-d3d11_video_sample_desc
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_VIDEO_SAMPLE_DESC {
    #StructPack 4

    /**
     * The width of the video sample.
     */
    Width : UInt32

    /**
     * The height of the video sample.
     */
    Height : UInt32

    /**
     * The format of the video sample.
     */
    Format : DXGI_FORMAT

    /**
     * The colorspace of the sample.
     */
    ColorSpace : DXGI_COLOR_SPACE_TYPE

}
