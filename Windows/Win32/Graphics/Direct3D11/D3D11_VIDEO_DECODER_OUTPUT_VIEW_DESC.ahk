#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\D3D11_TEX2D_VDOV.ahk
#Include .\D3D11_VDOV_DIMENSION.ahk

/**
 * Describes a video decoder output view.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_video_decoder_output_view_desc
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
class D3D11_VIDEO_DECODER_OUTPUT_VIEW_DESC extends Win32Struct {
    static sizeof => 24

    static packingSize => 4

    /**
     * The decoding profile. To get the list of profiles supported by the device, call the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodevice-getvideodecoderprofile">ID3D11VideoDevice::GetVideoDecoderProfile</a> method.
     * @type {Guid}
     */
    DecodeProfile {
        get {
            if(!this.HasProp("__DecodeProfile"))
                this.__DecodeProfile := Guid(0, this)
            return this.__DecodeProfile
        }
    }

    /**
     * The resource type of the view, specified as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_vdov_dimension">D3D11_VDOV_DIMENSION</a> enumeration.
     * @type {D3D11_VDOV_DIMENSION}
     */
    ViewDimension {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {D3D11_TEX2D_VDOV}
     */
    Texture2D {
        get {
            if(!this.HasProp("__Texture2D"))
                this.__Texture2D := D3D11_TEX2D_VDOV(20, this)
            return this.__Texture2D
        }
    }
}
