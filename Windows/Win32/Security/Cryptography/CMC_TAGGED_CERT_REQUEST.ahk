#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }

/**
 * Used in the CMC_TAGGED_REQUEST structure.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cmc_tagged_cert_request
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CMC_TAGGED_CERT_REQUEST {
    #StructPack 8

    /**
     * <b>DWORD</b> identifying the tagged <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate request</a>.
     */
    dwBodyPartID : UInt32

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DER_BLOB</a> structure that contains a signed request for a certificate.
     */
    SignedCertRequest : CRYPT_INTEGER_BLOB

}
