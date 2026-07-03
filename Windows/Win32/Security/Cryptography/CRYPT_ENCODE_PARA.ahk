#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PFN_CRYPT_ALLOC.ahk" { PFN_CRYPT_ALLOC }
#Import ".\PFN_CRYPT_FREE.ahk" { PFN_CRYPT_FREE }

/**
 * Used by the CryptEncodeObjectEx function to provide access to memory allocation and memory freeing callback functions.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-crypt_encode_para
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_ENCODE_PARA {
    #StructPack 8

    /**
     * Indicates the size, in bytes, of the structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * This member is an optional pointer to a callback function used to allocate memory.
     */
    pfnAlloc : PFN_CRYPT_ALLOC

    /**
     * This member is an optional pointer to a callback function used to free memory allocated by the allocate callback function.
     */
    pfnFree : PFN_CRYPT_FREE

}
