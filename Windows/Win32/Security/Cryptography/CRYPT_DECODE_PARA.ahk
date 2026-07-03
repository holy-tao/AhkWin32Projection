#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Used by the CryptDecodeObjectEx function to provide access to memory allocation and memory freeing callback functions.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-crypt_decode_para
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_DECODE_PARA {
    #StructPack 8

    /**
     * The size, in bytes, of this structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * This member is an optional pointer to a callback function used to allocate memory.
     */
    pfnAlloc : IntPtr

    /**
     * This member is an optional pointer to a callback function used to free memory allocated by the allocate callback function.
     */
    pfnFree : IntPtr

}
