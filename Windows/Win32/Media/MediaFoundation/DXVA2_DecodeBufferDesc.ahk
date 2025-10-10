#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a buffer sent from a decoder to a DirectX Video Acceleration (DXVA) device.
 * @remarks
 * 
  * This structure corresponds closely to the <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/dxva/ns-dxva-_dxva_bufferdescription">DXVA_BufferDescription</a> structure in DXVA 1, but some of the fields are no longer used in DXVA 2.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dxva2api/ns-dxva2api-dxva2_decodebufferdesc
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class DXVA2_DecodeBufferDesc extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * 
     * @type {Integer}
     */
    CompressedBufferType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Reserved. Set to zero.
     * @type {Integer}
     */
    BufferIndex {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Specifies the offset of the relevant data from the beginning of the buffer, in bytes. Currently this value must be zero.
     * @type {Integer}
     */
    DataOffset {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Specifies the amount of relevant data in the buffer, in bytes. The location of the last byte of content in the buffer is <b>DataOffset</b> + <b>DataSize</b> − 1.
     * @type {Integer}
     */
    DataSize {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Specifies the macroblock address of the first macroblock in the buffer. The macroblock address is given in raster scan order.
     * @type {Integer}
     */
    FirstMBaddress {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Specifies the number of macroblocks of data in the buffer. This count includes skipped macroblocks. This value must be zero if the data buffer type is one of the following: picture decoding parameters, inverse-quantization matrix, AYUV, IA44/AI44, DPXD, Highlight, or DCCMD.
     * @type {Integer}
     */
    NumMBsInBuffer {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Reserved. Set to zero.
     * @type {Integer}
     */
    Width {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Reserved. Set to zero.
     * @type {Integer}
     */
    Height {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Reserved. Set to zero.
     * @type {Integer}
     */
    Stride {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Reserved. Set to zero.
     * @type {Integer}
     */
    ReservedBits {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Pointer to a byte array that contains an initialization vector (IV) for encrypted data. If the decode buffer does not contain encrypted data, set this member to <b>NULL</b>.
     *           If the decode buffer contains encrypted data, the contents of <b>pvPVPState</b> depends on the type of encryption. For <b>D3DCRYPTOTYPE_AES128_CTR</b>, the <b>pvPVPState</b> member points to a <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_aes_ctr_iv">DXVA2_AES_CTR_IV</a> structure.
     * @type {Pointer<Void>}
     */
    pvPVPState {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
