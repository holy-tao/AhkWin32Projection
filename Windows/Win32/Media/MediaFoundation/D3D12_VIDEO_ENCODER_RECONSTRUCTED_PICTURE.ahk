#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_encoder_reconstructed_picture
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_RECONSTRUCTED_PICTURE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {ID3D12Resource}
     */
    pReconstructedPicture {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ReconstructedPictureSubresource {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
