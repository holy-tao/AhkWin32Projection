#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a sub sample mapping block.
 * @remarks
 * 
 * Values in the sub sample mapping blocks are relative to the start of the decode buffer.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11_1/ns-d3d11_1-d3d11_video_decoder_sub_sample_mapping_block
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_VIDEO_DECODER_SUB_SAMPLE_MAPPING_BLOCK extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The number of clear (non-encrypted) bytes at the start of the block.
     * @type {Integer}
     */
    ClearSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The number of encrypted bytes following the clear bytes.
     * @type {Integer}
     */
    EncryptedSize {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
