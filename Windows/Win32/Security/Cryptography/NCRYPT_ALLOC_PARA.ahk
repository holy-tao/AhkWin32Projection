#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Enables you to specify custom functions that can be used to allocate and free data.
 * @see https://learn.microsoft.com/windows/win32/api/ncrypt/ns-ncrypt-ncrypt_alloc_para
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct NCRYPT_ALLOC_PARA {
    #StructPack 8

    /**
     * The size, in bytes, of this structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * Address of a custom function that can allocate memory.
     */
    pfnAlloc : IntPtr

    /**
     * Address of a function that can free memory allocated by the function specified by the <b>pfnAlloc</b> member.
     */
    pfnFree : IntPtr

}
