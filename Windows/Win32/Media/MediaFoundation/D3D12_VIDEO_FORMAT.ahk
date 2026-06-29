#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Graphics\Dxgi\Common\DXGI_COLOR_SPACE_TYPE.ahk" { DXGI_COLOR_SPACE_TYPE }
#Import "..\..\Graphics\Dxgi\Common\DXGI_FORMAT.ahk" { DXGI_FORMAT }

/**
 * Defines the combination of a pixel format and color space for a resource content description.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_format
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_FORMAT {
    #StructPack 4

    /**
     * A value from the [DXGI_FORMAT](/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format) enumeration, specifying the DXGI format of the data.
     */
    Format : DXGI_FORMAT

    /**
     * A value from the [DXGI_COLOR_SPACE_TYPE](/windows/desktop/api/dxgicommon/ne-dxgicommon-dxgi_color_space_type) enumeration, specifying the color space of the data.
     */
    ColorSpace : DXGI_COLOR_SPACE_TYPE

}
