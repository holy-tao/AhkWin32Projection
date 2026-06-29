#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Dxgi\Common\DXGI_FORMAT.ahk

/**
 * Describes a video stream for a Microsoft Direct3D 11 video decoder or video processor.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_video_decoder_desc
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
class D3D11_VIDEO_DECODER_DESC extends Win32Struct {
    static sizeof => 28

    static packingSize => 4

    /**
     * The decoding profile. To get the list of profiles supported by the device, call the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodevice-getvideodecoderprofile">ID3D11VideoDevice::GetVideoDecoderProfile</a> method.
     * @type {Guid}
     */
    Guid {
        get {
            if(!this.HasProp("__Guid"))
                this.__Guid := Guid(0, this)
            return this.__Guid
        }
    }

    /**
     * The width of the video frame, in pixels.
     * @type {Integer}
     */
    SampleWidth {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The height of the video frame, in pixels.
     * @type {Integer}
     */
    SampleHeight {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * The output surface format, specified as a <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a> value.
     * @type {DXGI_FORMAT}
     */
    OutputFormat {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }
}
