#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\EXPERIMENTAL_WEBAUTHN_CTAPCBOR_ECC_PUBLIC_KEY.ahk" { EXPERIMENTAL_WEBAUTHN_CTAPCBOR_ECC_PUBLIC_KEY }

/**
 * @namespace Windows.Win32.Security.Authentication.WebAuthn
 */
export default struct EXPERIMENTAL_WEBAUTHN_CTAPCBOR_HMAC_SALT_EXTENSION {
    #StructPack 8

    dwVersion : UInt32

    pKeyAgreement : EXPERIMENTAL_WEBAUTHN_CTAPCBOR_ECC_PUBLIC_KEY.Ptr

    cbEncryptedSalt : UInt32

    pbEncryptedSalt : IntPtr

    cbSaltAuth : UInt32

    pbSaltAuth : IntPtr

}
