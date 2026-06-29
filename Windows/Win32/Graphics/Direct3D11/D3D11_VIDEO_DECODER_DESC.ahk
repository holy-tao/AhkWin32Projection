#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Dxgi\Common\DXGI_FORMAT.ahk" { DXGI_FORMAT }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Describes a video stream for a Microsoft Direct3D 11 video decoder or video processor.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_video_decoder_desc
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_VIDEO_DECODER_DESC {
    #StructPack 4

    /**
     * The decoding profile. To get the list of profiles supported by the device, call the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodevice-getvideodecoderprofile">ID3D11VideoDevice::GetVideoDecoderProfile</a> method.
     */
    Guid : Guid

    /**
     * The width of the video frame, in pixels.
     */
    SampleWidth : UInt32

    /**
     * The height of the video frame, in pixels.
     */
    SampleHeight : UInt32

    /**
     * The output surface format, specified as a <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a> value.
     */
    OutputFormat : DXGI_FORMAT

}
