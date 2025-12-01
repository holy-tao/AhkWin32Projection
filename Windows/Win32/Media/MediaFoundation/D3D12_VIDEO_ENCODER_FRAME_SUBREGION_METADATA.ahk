#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents video encoder frame subregion metadata.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_encoder_frame_subregion_metadata
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_FRAME_SUBREGION_METADATA extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Output field that receives the sizes in bytes of each subregion. Subregions sizes must include both the subregion initial padding, the subregion header and the subregion payload.
     * @type {Integer}
     */
    bSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Output field that receives the padding size in bytes that needs to be skipped at the beginning of every subregion. This padding size is included in the size reported above.
     * 
     * For example, let *pFrameSubregionsSizes* be an array of *bSize* for each slice. With this information, along with *pFrameSubregionsSizes*, the user can extract individual subregions from the output bitstream buffer by calculating i-th subregion start offset as `pBuffer + FrameStartOffset + sum j = (0, (i-1)){ pFrameSubregionsSizes[j] } + pFrameSubregionsStartOffsets[i]` and reading `pFrameSubregionsSizes[i]` bytes.
     * @type {Integer}
     */
    bStartOffset {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Output parameter that receives the sizes in bits of each subregion header.
     * With this information, in addition to extracting the full subregion from the bitstream as explained above, the user can extract the subregions payload/headers directly without needing to parse the full subregion bitstream.
     * @type {Integer}
     */
    bHeaderSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
