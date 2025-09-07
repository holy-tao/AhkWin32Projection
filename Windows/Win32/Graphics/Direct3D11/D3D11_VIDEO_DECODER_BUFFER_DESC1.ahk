#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a compressed buffer for decoding. (D3D11_VIDEO_DECODER_BUFFER_DESC1)
 * @see https://learn.microsoft.com/windows/win32/api/d3d11_1/ns-d3d11_1-d3d11_video_decoder_buffer_desc1
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_VIDEO_DECODER_BUFFER_DESC1 extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * The type of buffer.
     * @type {Integer}
     */
    BufferType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The offset of the relevant data from the beginning of the buffer, in bytes. This value must be zero.
     * @type {Integer}
     */
    DataOffset {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Size of the relevant data.
     * @type {Integer}
     */
    DataSize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * A pointer to a buffer that contains an initialization vector (IV) for encrypted data. If the decode buffer does not contain encrypted data, set this member to NULL.
     * @type {Pointer<Void>}
     */
    pIV {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * The size of the buffer specified in the <i>pIV</i> parameter. If <i>pIV</i> is NULL, set this member to zero.
     * @type {Integer}
     */
    IVSize {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/ns-d3d11_1-d3d11_video_decoder_sub_sample_mapping_block">D3D11_VIDEO_DECODER_SUB_SAMPLE_MAPPING_BLOCK</a> structures, which indicates exactly which bytes in the decode buffer are encrypted and which are in the clear.  If the decode buffer does not contain encrypted data, set this member to NULL.
     * 
     * Values in the sub sample mapping blocks are relative to the start of the decode buffer.
     * @type {Pointer<D3D11_VIDEO_DECODER_SUB_SAMPLE_MAPPING_BLOCK>}
     */
    pSubSampleMappingBlock {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * The number of <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/ns-d3d11_1-d3d11_video_decoder_sub_sample_mapping_block">D3D11_VIDEO_DECODER_SUB_SAMPLE_MAPPING_BLOCK</a> structures specified in the <i>pSubSampleMappingBlocks</i> parameter. If <i>pSubSampleMappingBlocks</i> is NULL, set this member to zero.
     * @type {Integer}
     */
    SubSampleMappingCount {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }
}
