#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D11_VIDEO_DECODER_BUFFER_TYPE.ahk" { D3D11_VIDEO_DECODER_BUFFER_TYPE }
#Import ".\D3D11_ENCRYPTED_BLOCK_INFO.ahk" { D3D11_ENCRYPTED_BLOCK_INFO }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Describes a compressed buffer for decoding. (D3D11_VIDEO_DECODER_BUFFER_DESC)
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_video_decoder_buffer_desc
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_VIDEO_DECODER_BUFFER_DESC {
    #StructPack 8

    /**
     * The type of buffer, specified as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_video_decoder_buffer_type">D3D11_VIDEO_DECODER_BUFFER_TYPE</a> enumeration.
     */
    BufferType : D3D11_VIDEO_DECODER_BUFFER_TYPE

    /**
     * Reserved.
     */
    BufferIndex : UInt32

    /**
     * The offset of the relevant data from the beginning of the buffer, in bytes. This value must be zero.
     */
    DataOffset : UInt32

    DataSize : UInt32

    /**
     * The macroblock address of the first macroblock in the buffer. The macroblock address is given in raster scan order.
     */
    FirstMBaddress : UInt32

    /**
     * The number of macroblocks of data in the buffer. This count includes skipped macroblocks.
     */
    NumMBsInBuffer : UInt32

    /**
     * Reserved. Set to zero.
     */
    Width : UInt32

    /**
     * Reserved. Set to zero.
     */
    Height : UInt32

    /**
     * Reserved. Set to zero.
     */
    Stride : UInt32

    /**
     * Reserved. Set to zero.
     */
    ReservedBits : UInt32

    /**
     * A pointer to a buffer that contains an initialization vector (IV) for encrypted data. If the decode buffer does not contain encrypted data, set this member to <b>NULL</b>.
     */
    pIV : IntPtr

    /**
     * The size of the buffer specified in the <b>pIV</b> parameter. If <b>pIV</b> is <b>NULL</b>, set this member to zero.
     */
    IVSize : UInt32

    /**
     * If <b>TRUE</b>, the video surfaces are partially encrypted.
     */
    PartialEncryption : BOOL

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_encrypted_block_info">D3D11_ENCRYPTED_BLOCK_INFO</a> structure that specifies which bytes of the surface are encrypted.
     */
    EncryptedBlockInfo : D3D11_ENCRYPTED_BLOCK_INFO

}
