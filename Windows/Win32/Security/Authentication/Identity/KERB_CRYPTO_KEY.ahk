#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KERB_CRYPTO_KEY_TYPE.ahk" { KERB_CRYPTO_KEY_TYPE }

/**
 * Contains information about a Kerberos cryptographic session key.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-kerb_crypto_key
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct KERB_CRYPTO_KEY {
    #StructPack 8

    KeyType : KERB_CRYPTO_KEY_TYPE

    /**
     * Specifies the length, in bytes, of the cryptographic <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">session key</a>.
     */
    Length : UInt32

    /**
     * Contains the cryptographic session key.
     */
    Value : IntPtr

}
