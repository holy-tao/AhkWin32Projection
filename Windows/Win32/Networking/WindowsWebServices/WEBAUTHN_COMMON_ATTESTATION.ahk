#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * The structure containing the common data for an attestation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/webauthn/ns-webauthn-webauthn_common_attestation
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WEBAUTHN_COMMON_ATTESTATION extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * Version of this structure, to allow for modifications in the future. This field is required and should be set to **CURRENT_VERSION**.
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The hash and padding algorithm. This won't be set for _fido-u2f_ which assumes **"ES256"**.
     * @type {PWSTR}
     */
    pwszAlg{
        get {
            if(!this.HasProp("__pwszAlg"))
                this.__pwszAlg := PWSTR(this.ptr + 8)
            return this.__pwszAlg
        }
    }

    /**
     * The COSE algorithm identifier. This value is a number identifying a cryptographic algorithm. The algorithm identifiers _should_ be values registered in the [IANA COSE Algorithms registry](https://w3c.github.io/webauthn/#biblio-iana-cose-algs-reg), for instance, -7 for "ES256" and -257 for "RS256".
     * @type {Integer}
     */
    lAlg {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * The signature that was generated for this attestation.
     * @type {Integer}
     */
    cbSignature {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * A pointer to the signature that was generated for this attestation.
     * @type {Pointer<Byte>}
     */
    pbSignature {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Array of X.509 DER encoded certificates. The first certificate is the signer, leaf certificate. This is set for **Full Basic Attestation**. If not set, then this is a **Self Attestation**.
     * @type {Integer}
     */
    cX5c {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * A pointer to the array of X.509 certificates.
     * @type {Pointer<WEBAUTHN_X5C>}
     */
    pX5c {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * A pointer to the version of the attestation statement. (This is set for tpm.)
     * @type {PWSTR}
     */
    pwszVer{
        get {
            if(!this.HasProp("__pwszVer"))
                this.__pwszVer := PWSTR(this.ptr + 48)
            return this.__pwszVer
        }
    }

    /**
     * The size of the certificate information. (This is set for tpm.)
     * @type {Integer}
     */
    cbCertInfo {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * A pointer to the certificate information. (This is set for tpm.)
     * @type {Pointer<Byte>}
     */
    pbCertInfo {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * The size of the public key area. (This is set for tpm.)
     * @type {Integer}
     */
    cbPubArea {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * A pointer to the public key area. (This is set for tpm.)
     * @type {Pointer<Byte>}
     */
    pbPubArea {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }
}
