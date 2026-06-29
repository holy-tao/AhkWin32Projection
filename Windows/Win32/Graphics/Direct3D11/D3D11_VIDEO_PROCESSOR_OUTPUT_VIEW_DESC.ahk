#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D11_TEX2D_ARRAY_VPOV.ahk" { D3D11_TEX2D_ARRAY_VPOV }
#Import ".\D3D11_VPOV_DIMENSION.ahk" { D3D11_VPOV_DIMENSION }
#Import ".\D3D11_TEX2D_VPOV.ahk" { D3D11_TEX2D_VPOV }

/**
 * Describes a video processor output view.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_video_processor_output_view_desc
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_VIDEO_PROCESSOR_OUTPUT_VIEW_DESC {
    #StructPack 4

    /**
     * The resource type of the view, specified as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_vpov_dimension">D3D11_VPOV_DIMENSION</a> enumeration.
     */
    ViewDimension : D3D11_VPOV_DIMENSION

    Texture2D : D3D11_TEX2D_VPOV

    static __New() {
        DefineProp(this.Prototype, 'Texture2DArray', { type: D3D11_TEX2D_ARRAY_VPOV, offset: 4 })
        this.DeleteProp("__New")
    }
}
