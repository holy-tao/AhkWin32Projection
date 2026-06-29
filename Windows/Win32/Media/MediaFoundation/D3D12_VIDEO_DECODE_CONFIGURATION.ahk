#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_VIDEO_FRAME_CODED_INTERLACE_TYPE.ahk" { D3D12_VIDEO_FRAME_CODED_INTERLACE_TYPE }
#Import ".\D3D12_BITSTREAM_ENCRYPTION_TYPE.ahk" { D3D12_BITSTREAM_ENCRYPTION_TYPE }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Describes the configuration for a video decoder.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_decode_configuration
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_DECODE_CONFIGURATION {
    #StructPack 4

    /**
     * A GUID identifying the profile for the decoder, such as D3D12\_VIDEO\_DECODE\_PROFILE\_H264 or D3D12\_VIDEO\_DECODE\_PROFILE\_HEVC\_MAIN. For a list of supported GUIDs, see [Direct3D 12 Video GUIDs](/windows/desktop/medfound/direct3d-12-video-guids).
     */
    DecodeProfile : Guid

    /**
     * A member of the [D3D12\_BITSTREAM\_ENCRYPTION\_TYPE](ne-d3d12video-d3d12_bitstream_encryption_type.md) enumeration specifying the type of bitstream encryption.  For no encryption, use D3D12\_BITSTREAM\_ENCRYPTION\_TYPE\_NONE.
     */
    BitstreamEncryption : D3D12_BITSTREAM_ENCRYPTION_TYPE

    /**
     * A member of the [D3D12\_VIDEO\_FRAME\_CODED\_INTERLACE\_TYPE](ne-d3d12video-d3d12_video_frame_coded_interlace_type.md) enumeration the desired interlace type used by the coded frames.
     */
    InterlaceType : D3D12_VIDEO_FRAME_CODED_INTERLACE_TYPE

}
