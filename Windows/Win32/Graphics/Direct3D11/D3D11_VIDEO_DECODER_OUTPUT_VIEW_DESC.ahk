#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D3D11_VDOV_DIMENSION.ahk" { D3D11_VDOV_DIMENSION }
#Import ".\D3D11_TEX2D_VDOV.ahk" { D3D11_TEX2D_VDOV }

/**
 * Describes a video decoder output view.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_video_decoder_output_view_desc
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_VIDEO_DECODER_OUTPUT_VIEW_DESC {
    #StructPack 4

    /**
     * The decoding profile. To get the list of profiles supported by the device, call the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodevice-getvideodecoderprofile">ID3D11VideoDevice::GetVideoDecoderProfile</a> method.
     */
    DecodeProfile : Guid

    /**
     * The resource type of the view, specified as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_vdov_dimension">D3D11_VDOV_DIMENSION</a> enumeration.
     */
    ViewDimension : D3D11_VDOV_DIMENSION

    Texture2D : D3D11_TEX2D_VDOV

}
