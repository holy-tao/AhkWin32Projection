#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D11_ENCRYPTED_BLOCK_INFO.ahk

/**
 * Describes a compressed buffer for decoding.
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/ns-d3d11-d3d11_video_decoder_buffer_desc
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_VIDEO_DECODER_BUFFER_DESC extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * The type of buffer, specified as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_video_decoder_buffer_type">D3D11_VIDEO_DECODER_BUFFER_TYPE</a> enumeration.
     * @type {Integer}
     */
    BufferType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    BufferIndex {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The offset of the relevant data from the beginning of the buffer, in bytes. This value must be zero.
     * @type {Integer}
     */
    DataOffset {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * 
     * @type {Integer}
     */
    DataSize {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The macroblock address of the first macroblock in the buffer. The macroblock address is given in raster scan order.
     * @type {Integer}
     */
    FirstMBaddress {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The number of macroblocks of data in the buffer. This count includes skipped macroblocks.
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
     * A pointer to a buffer that contains an initialization vector (IV) for encrypted data. If the decode buffer does not contain encrypted data, set this member to <b>NULL</b>.
     * @type {Pointer<Void>}
     */
    pIV {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * The size of the buffer specified in the <b>pIV</b> parameter. If <b>pIV</b> is <b>NULL</b>, set this member to zero.
     * @type {Integer}
     */
    IVSize {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * If <b>TRUE</b>, the video surfaces are partially encrypted.
     * @type {BOOL}
     */
    PartialEncryption {
        get => NumGet(this, 52, "int")
        set => NumPut("int", value, this, 52)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_encrypted_block_info">D3D11_ENCRYPTED_BLOCK_INFO</a> structure that specifies which bytes of the surface are encrypted.
     * @type {D3D11_ENCRYPTED_BLOCK_INFO}
     */
    EncryptedBlockInfo{
        get {
            if(!this.HasProp("__EncryptedBlockInfo"))
                this.__EncryptedBlockInfo := D3D11_ENCRYPTED_BLOCK_INFO(56, this)
            return this.__EncryptedBlockInfo
        }
    }
}
