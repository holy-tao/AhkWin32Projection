#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains a locally unique identifier (LUID) for Cryptographic Smart Card Root Information.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-root_info_luid
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct ROOT_INFO_LUID {
    #StructPack 4

    /**
     * Low-order bits.
     */
    LowPart : UInt32

    /**
     * High-order bits.
     */
    HighPart : Int32

}
