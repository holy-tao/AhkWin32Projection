#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PFN_CRYPT_ASYNC_RETRIEVAL_COMPLETION_FUNC.ahk" { PFN_CRYPT_ASYNC_RETRIEVAL_COMPLETION_FUNC }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_ASYNC_RETRIEVAL_COMPLETION {
    #StructPack 8

    pfnCompletion : PFN_CRYPT_ASYNC_RETRIEVAL_COMPLETION_FUNC

    pvCompletion : IntPtr

}
