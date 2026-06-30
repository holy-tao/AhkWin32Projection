#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_BITSTREAM_ENCRYPTION_TYPE.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\D3D12_VIDEO_FRAME_CODED_INTERLACE_TYPE.ahk

/**
 * Describes the configuration for a video decoder.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_decode_configuration
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class D3D12_VIDEO_DECODE_CONFIGURATION extends Win32Struct {
    static sizeof => 24

    static packingSize => 4

    /**
     * A GUID identifying the profile for the decoder, such as D3D12\_VIDEO\_DECODE\_PROFILE\_H264 or D3D12\_VIDEO\_DECODE\_PROFILE\_HEVC\_MAIN. For a list of supported GUIDs, see [Direct3D 12 Video GUIDs](/windows/desktop/medfound/direct3d-12-video-guids).
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
     * A member of the [D3D12\_BITSTREAM\_ENCRYPTION\_TYPE](ne-d3d12video-d3d12_bitstream_encryption_type.md) enumeration specifying the type of bitstream encryption.  For no encryption, use D3D12\_BITSTREAM\_ENCRYPTION\_TYPE\_NONE.
     * @type {D3D12_BITSTREAM_ENCRYPTION_TYPE}
     */
    BitstreamEncryption {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * A member of the [D3D12\_VIDEO\_FRAME\_CODED\_INTERLACE\_TYPE](ne-d3d12video-d3d12_video_frame_coded_interlace_type.md) enumeration the desired interlace type used by the coded frames.
     * @type {D3D12_VIDEO_FRAME_CODED_INTERLACE_TYPE}
     */
    InterlaceType {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }
}
