#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\WEBAUTHN_X5C.ahk" { WEBAUTHN_X5C }

/**
 * The structure containing the common data for an attestation.
 * @see https://learn.microsoft.com/windows/win32/api/webauthn/ns-webauthn-webauthn_common_attestation
 * @namespace Windows.Win32.Security.Authentication.WebAuthn
 */
export default struct WEBAUTHN_COMMON_ATTESTATION {
    #StructPack 8

    /**
     * Version of this structure, to allow for modifications in the future. This field is required and should be set to **CURRENT_VERSION**.
     */
    dwVersion : UInt32

    /**
     * The hash and padding algorithm. This won't be set for _fido-u2f_ which assumes **"ES256"**.
     */
    pwszAlg : PWSTR

    /**
     * The COSE algorithm identifier. This value is a number identifying a cryptographic algorithm. The algorithm identifiers _should_ be values registered in the [IANA COSE Algorithms registry](https://w3c.github.io/webauthn/#biblio-iana-cose-algs-reg), for instance, -7 for "ES256" and -257 for "RS256".
     */
    lAlg : Int32

    /**
     * The signature that was generated for this attestation.
     */
    cbSignature : UInt32

    /**
     * A pointer to the signature that was generated for this attestation.
     */
    pbSignature : IntPtr

    /**
     * Array of X.509 DER encoded certificates. The first certificate is the signer, leaf certificate. This is set for **Full Basic Attestation**. If not set, then this is a **Self Attestation**.
     */
    cX5c : UInt32

    /**
     * A pointer to the array of X.509 certificates.
     */
    pX5c : WEBAUTHN_X5C.Ptr

    /**
     * A pointer to the version of the attestation statement. (This is set for tpm.)
     */
    pwszVer : PWSTR

    /**
     * The size of the certificate information. (This is set for tpm.)
     */
    cbCertInfo : UInt32

    /**
     * A pointer to the certificate information. (This is set for tpm.)
     */
    pbCertInfo : IntPtr

    /**
     * The size of the public key area. (This is set for tpm.)
     */
    cbPubArea : UInt32

    /**
     * A pointer to the public key area. (This is set for tpm.)
     */
    pbPubArea : IntPtr

}
