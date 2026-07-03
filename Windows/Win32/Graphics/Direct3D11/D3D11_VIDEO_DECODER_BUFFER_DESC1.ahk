#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D11_VIDEO_DECODER_BUFFER_TYPE.ahk" { D3D11_VIDEO_DECODER_BUFFER_TYPE }
#Import ".\D3D11_VIDEO_DECODER_SUB_SAMPLE_MAPPING_BLOCK.ahk" { D3D11_VIDEO_DECODER_SUB_SAMPLE_MAPPING_BLOCK }

/**
 * Describes a compressed buffer for decoding. (D3D11_VIDEO_DECODER_BUFFER_DESC1)
 * @see https://learn.microsoft.com/windows/win32/api/d3d11_1/ns-d3d11_1-d3d11_video_decoder_buffer_desc1
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_VIDEO_DECODER_BUFFER_DESC1 {
    #StructPack 8

    /**
     * The type of buffer.
     */
    BufferType : D3D11_VIDEO_DECODER_BUFFER_TYPE

    /**
     * The offset of the relevant data from the beginning of the buffer, in bytes. This value must be zero.
     */
    DataOffset : UInt32

    /**
     * Size of the relevant data.
     */
    DataSize : UInt32

    /**
     * A pointer to a buffer that contains an initialization vector (IV) for encrypted data. If the decode buffer does not contain encrypted data, set this member to NULL.
     */
    pIV : IntPtr

    /**
     * The size of the buffer specified in the <i>pIV</i> parameter. If <i>pIV</i> is NULL, set this member to zero.
     */
    IVSize : UInt32

    /**
     * A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/ns-d3d11_1-d3d11_video_decoder_sub_sample_mapping_block">D3D11_VIDEO_DECODER_SUB_SAMPLE_MAPPING_BLOCK</a> structures, which indicates exactly which bytes in the decode buffer are encrypted and which are in the clear.  If the decode buffer does not contain encrypted data, set this member to NULL.
     * 
     * Values in the sub sample mapping blocks are relative to the start of the decode buffer.
     */
    pSubSampleMappingBlock : D3D11_VIDEO_DECODER_SUB_SAMPLE_MAPPING_BLOCK.Ptr

    /**
     * The number of <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/ns-d3d11_1-d3d11_video_decoder_sub_sample_mapping_block">D3D11_VIDEO_DECODER_SUB_SAMPLE_MAPPING_BLOCK</a> structures specified in the <i>pSubSampleMappingBlocks</i> parameter. If <i>pSubSampleMappingBlocks</i> is NULL, set this member to zero.
     */
    SubSampleMappingCount : UInt32

}
