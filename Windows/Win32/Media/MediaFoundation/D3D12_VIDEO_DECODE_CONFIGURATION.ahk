#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the configuration for a video decoder.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_decode_configuration
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_DECODE_CONFIGURATION extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A GUID identifying the profile for the decoder, such as D3D12\_VIDEO\_DECODE\_PROFILE\_H264 or D3D12\_VIDEO\_DECODE\_PROFILE\_HEVC\_MAIN. For a list of supported GUIDs, see [Direct3D 12 Video GUIDs](/windows/desktop/medfound/direct3d-12-video-guids).
     * @type {Pointer<Guid>}
     */
    DecodeProfile {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A member of the [D3D12\_BITSTREAM\_ENCRYPTION\_TYPE](ne-d3d12video-d3d12_bitstream_encryption_type.md) enumeration specifying the type of bitstream encryption.  For no encryption, use D3D12\_BITSTREAM\_ENCRYPTION\_TYPE\_NONE.
     * @type {Integer}
     */
    BitstreamEncryption {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * A member of the [D3D12\_VIDEO\_FRAME\_CODED\_INTERLACE\_TYPE](ne-d3d12video-d3d12_video_frame_coded_interlace_type.md) enumeration the desired interlace type used by the coded frames.
     * @type {Integer}
     */
    InterlaceType {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }
}
