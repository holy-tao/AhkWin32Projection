#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D11_VIDEO_DECODER_BUFFER_TYPE.ahk" { D3D11_VIDEO_DECODER_BUFFER_TYPE }
#Import ".\D3D11_VIDEO_DECODER_SUB_SAMPLE_MAPPING_BLOCK.ahk" { D3D11_VIDEO_DECODER_SUB_SAMPLE_MAPPING_BLOCK }

/**
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_VIDEO_DECODER_BUFFER_DESC2 {
    #StructPack 8

    BufferType : D3D11_VIDEO_DECODER_BUFFER_TYPE

    DataOffset : UInt32

    DataSize : UInt32

    pIV : IntPtr

    IVSize : UInt32

    pSubSampleMappingBlock : D3D11_VIDEO_DECODER_SUB_SAMPLE_MAPPING_BLOCK.Ptr

    SubSampleMappingCount : UInt32

    cBlocksStripeEncrypted : UInt32

    cBlocksStripeClear : UInt32

}
