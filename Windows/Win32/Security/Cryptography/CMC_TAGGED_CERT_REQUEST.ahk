#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk

/**
 * Used in the CMC_TAGGED_REQUEST structure.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cmc_tagged_cert_request
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CMC_TAGGED_CERT_REQUEST extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * <b>DWORD</b> identifying the tagged <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate request</a>.
     * @type {Integer}
     */
    dwBodyPartID {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DER_BLOB</a> structure that contains a signed request for a certificate.
     * @type {CRYPT_INTEGER_BLOB}
     */
    SignedCertRequest{
        get {
            if(!this.HasProp("__SignedCertRequest"))
                this.__SignedCertRequest := CRYPT_INTEGER_BLOB(8, this)
            return this.__SignedCertRequest
        }
    }
}
