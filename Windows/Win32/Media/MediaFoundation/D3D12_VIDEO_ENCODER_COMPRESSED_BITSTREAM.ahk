#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Encapsulates the compressed bitstream output for the encoding operation.
 * @remarks
 * The output bitstream is expected to contain the subregion headers, but not the picture, sequence, video or other headers. The host is responsible for coding those headers and generating the complete bitstream.
  * 
  * In subregion frame partitioning, all subregions for a given frame encoding operation output must be placed in top/down, left/right order and must be contiguous.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_encoder_compressed_bitstream
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_COMPRESSED_BITSTREAM extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A pointer to a [ID3D12Resource](../d3d12/nn-d3d12-id3d12resource) containing the compressed bitstream buffer. Note that the resource buffer size is not the available size for this encoding operation because *FrameStartOffset* needs to be taken into account against this size.
     * @type {Pointer<ID3D12Resource>}
     */
    pBuffer {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A UINT64 specifying th offset into the compressed bitstream where the encoder may start adding the current frame output.
     * @type {Integer}
     */
    FrameStartOffset {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
