#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_SMIME_CAPABILITY.ahk" { CRYPT_SMIME_CAPABILITY }

/**
 * Contains a prioritized array of supported capabilities.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-crypt_smime_capabilities
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_SMIME_CAPABILITIES {
    #StructPack 8

    /**
     * Count of elements in the <b>rgCapability</b> array.
     */
    cCapability : UInt32

    /**
     * Prioritized array of pointers to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_smime_capability">CRYPT_SMIME_CAPABILITY</a> structures each indicating a capability or preference of a user.
     */
    rgCapability : CRYPT_SMIME_CAPABILITY.Ptr

}
