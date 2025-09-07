#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies which bytes are encrypted in a protected video surface.
 * @see https://learn.microsoft.com/windows/win32/medfound/d3dencrypted-block-info
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DENCRYPTED_BLOCK_INFO extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * The number of bytes that are encrypted at the start of the buffer.
     * @type {Integer}
     */
    NumEncryptedBytesAtBeginning {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The number of bytes that are skipped after the first **NumEncryptedBytesAtBeginning** bytes, and then after each block of **NumBytesInEncryptPattern** bytes. Skipped bytes are not encrypted.
     * @type {Integer}
     */
    NumBytesInSkipPattern {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The number of bytes that are encrypted after each block of skipped bytes.
     * @type {Integer}
     */
    NumBytesInEncryptPattern {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
