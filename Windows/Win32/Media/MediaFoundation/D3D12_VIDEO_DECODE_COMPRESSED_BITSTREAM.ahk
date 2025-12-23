#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a compressed bitstream from which video is decoded.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_decode_compressed_bitstream
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_DECODE_COMPRESSED_BITSTREAM extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * A pointer to an [ID3D12Resource](/windows/desktop/api/d3d12/nn-d3d12-id3d12resource) representing the source buffer containing the compressed bitstream to decode.
     * @type {ID3D12Resource}
     */
    pBuffer {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The offset to the beginning of the first slice.  This offset has alignment requirements based on the tier value of the video decoder. For more information on decoding tiers, see [D3D12_VIDEO_DECODE_TIER](ne-d3d12video-d3d12_video_decode_tier.md).
     * @type {Integer}
     */
    Offset {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The size of the subregion of *pBuffer* that contains the bitstream.
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
