#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_ASYNC_RETRIEVAL_COMPLETION {
    #StructPack 8

    pfnCompletion : IntPtr

    pvCompletion : IntPtr

}
