#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes a sub sample mapping block.
 * @remarks
 * Values in the sub sample mapping blocks are relative to the start of the decode buffer.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11_1/ns-d3d11_1-d3d11_video_decoder_sub_sample_mapping_block
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_VIDEO_DECODER_SUB_SAMPLE_MAPPING_BLOCK {
    #StructPack 4

    /**
     * The number of clear (non-encrypted) bytes at the start of the block.
     */
    ClearSize : UInt32

    /**
     * The number of encrypted bytes following the clear bytes.
     */
    EncryptedSize : UInt32

}
