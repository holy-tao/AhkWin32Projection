#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains a signed BLOB.
 * @see https://learn.microsoft.com/windows/win32/SecCrypto/signer-context
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct SIGNER_CONTEXT {
    #StructPack 8

    /**
     * The size, in bytes, of the structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * The size, in bytes, of the **pbBlob** member.
     */
    cbBlob : UInt32

    /**
     * A pointer to the signed BLOB.
     */
    pbBlob : IntPtr

}
