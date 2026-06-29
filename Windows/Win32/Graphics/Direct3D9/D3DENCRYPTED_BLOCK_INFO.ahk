#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies which bytes are encrypted in a protected video surface.
 * @see https://learn.microsoft.com/windows/win32/medfound/d3dencrypted-block-info
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DENCRYPTED_BLOCK_INFO {
    #StructPack 4

    /**
     * The number of bytes that are encrypted at the start of the buffer.
     */
    NumEncryptedBytesAtBeginning : UInt32

    /**
     * The number of bytes that are skipped after the first **NumEncryptedBytesAtBeginning** bytes, and then after each block of **NumBytesInEncryptPattern** bytes. Skipped bytes are not encrypted.
     */
    NumBytesInSkipPattern : UInt32

    /**
     * The number of bytes that are encrypted after each block of skipped bytes.
     */
    NumBytesInEncryptPattern : UInt32

}
