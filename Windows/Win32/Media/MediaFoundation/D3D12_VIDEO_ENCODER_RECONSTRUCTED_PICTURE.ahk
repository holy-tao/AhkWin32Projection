#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents the reconstructed picture generated from the input frame passed to the encode operation.
 * @remarks
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
     * A [ID3D12Resource](../d3d12/nn-d3d12-id3d12resource) representing the reconstructed picture generated from the input frame.
     * @type {Pointer<ID3D12Resource>}
     */
    pReconstructedPicture {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A UINT64 specifying the subresource index for *pReconstructedPicture*.
     * @type {Integer}
     */
    ReconstructedPictureSubresource {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
