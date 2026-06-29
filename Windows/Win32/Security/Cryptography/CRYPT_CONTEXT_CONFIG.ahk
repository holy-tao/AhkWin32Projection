#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_CONTEXT_CONFIG_FLAGS.ahk" { CRYPT_CONTEXT_CONFIG_FLAGS }

/**
 * Contains configuration information for a CNG context.
 * @see https://learn.microsoft.com/windows/win32/api/bcrypt/ns-bcrypt-crypt_context_config
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_CONTEXT_CONFIG {
    #StructPack 4

    dwFlags : CRYPT_CONTEXT_CONFIG_FLAGS

    dwReserved : UInt32

}
