#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CERT_OR_CRL_BLOB.ahk" { CERT_OR_CRL_BLOB }

/**
 * Encapsulates an array of certificates for use with Internet Key Exchange messages.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_or_crl_bundle
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_OR_CRL_BUNDLE {
    #StructPack 8

    /**
     * The number of items in the array pointed to by the <b>rgItem</b> member.
     */
    cItem : UInt32

    /**
     * A pointer to an array of certificates.
     */
    rgItem : CERT_OR_CRL_BLOB.Ptr

}
