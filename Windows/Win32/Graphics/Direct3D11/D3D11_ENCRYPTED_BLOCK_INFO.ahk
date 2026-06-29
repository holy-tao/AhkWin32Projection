#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies which bytes in a video surface are encrypted.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_encrypted_block_info
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_ENCRYPTED_BLOCK_INFO {
    #StructPack 4

    /**
     * The number of bytes that are encrypted at the start of the buffer.
     */
    NumEncryptedBytesAtBeginning : UInt32

    /**
     * The number of bytes that are skipped after the first <b>NumEncryptedBytesAtBeginning</b> bytes, and then after each block of <b>NumBytesInEncryptPattern</b> bytes. Skipped bytes are not encrypted.
     */
    NumBytesInSkipPattern : UInt32

    /**
     * The number of bytes that are encrypted after each block of skipped bytes.
     */
    NumBytesInEncryptPattern : UInt32

}
