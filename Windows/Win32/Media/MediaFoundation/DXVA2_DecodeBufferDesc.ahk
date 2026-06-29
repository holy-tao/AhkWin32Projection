#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes a buffer sent from a decoder to a DirectX Video Acceleration (DXVA) device.
 * @remarks
 * This structure corresponds closely to the <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/dxva/ns-dxva-_dxva_bufferdescription">DXVA_BufferDescription</a> structure in DXVA 1, but some of the fields are no longer used in DXVA 2.
 * @see https://learn.microsoft.com/windows/win32/api/dxva2api/ns-dxva2api-dxva2_decodebufferdesc
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct DXVA2_DecodeBufferDesc {
    #StructPack 8

    CompressedBufferType : UInt32

    /**
     * Reserved. Set to zero.
     */
    BufferIndex : UInt32

    /**
     * Specifies the offset of the relevant data from the beginning of the buffer, in bytes. Currently this value must be zero.
     */
    DataOffset : UInt32

    /**
     * Specifies the amount of relevant data in the buffer, in bytes. The location of the last byte of content in the buffer is <b>DataOffset</b> + <b>DataSize</b> − 1.
     */
    DataSize : UInt32

    /**
     * Specifies the macroblock address of the first macroblock in the buffer. The macroblock address is given in raster scan order.
     */
    FirstMBaddress : UInt32

    /**
     * Specifies the number of macroblocks of data in the buffer. This count includes skipped macroblocks. This value must be zero if the data buffer type is one of the following: picture decoding parameters, inverse-quantization matrix, AYUV, IA44/AI44, DPXD, Highlight, or DCCMD.
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
     * Pointer to a byte array that contains an initialization vector (IV) for encrypted data. If the decode buffer does not contain encrypted data, set this member to <b>NULL</b>.
     *           If the decode buffer contains encrypted data, the contents of <b>pvPVPState</b> depends on the type of encryption. For <b>D3DCRYPTOTYPE_AES128_CTR</b>, the <b>pvPVPState</b> member points to a <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_aes_ctr_iv">DXVA2_AES_CTR_IV</a> structure.
     */
    pvPVPState : IntPtr

}
