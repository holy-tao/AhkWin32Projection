#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D11_TEX2D_VPIV.ahk" { D3D11_TEX2D_VPIV }
#Import ".\D3D11_VPIV_DIMENSION.ahk" { D3D11_VPIV_DIMENSION }

/**
 * Describes a video processor input view.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_video_processor_input_view_desc
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_VIDEO_PROCESSOR_INPUT_VIEW_DESC {
    #StructPack 4

    /**
     * The surface format. If zero, the driver uses the DXGI format that was used to create the resource. If you are using feature level 9, the value must be zero.
     */
    FourCC : UInt32

    /**
     * The resource type of the view, specified as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_vpiv_dimension">D3D11_VPIV_DIMENSION</a> enumeration.
     */
    ViewDimension : D3D11_VPIV_DIMENSION

    Texture2D : D3D11_TEX2D_VPIV

}
