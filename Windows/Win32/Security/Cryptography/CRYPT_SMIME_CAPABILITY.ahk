#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk

/**
 * The CRYPT_SMIME_CAPABILITY structure specifies a single capability and its associated parameters. Single capabilities are grouped together into a list of CRYPT_SMIME_CAPABILITIES which can specify a prioritized list of capability preferences.
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-crypt_smime_capability
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_SMIME_CAPABILITY extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">Object identifier</a> (OID) for a capability. Capabilities include signature algorithms, <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">symmetric algorithms</a>, and key enciphering algorithms. Also included are non-algorithm capabilities, which are the preference for <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">signed data</a> and the preference for unencrypted messages.
     * @type {PSTR}
     */
    pszObjId{
        get {
            if(!this.HasProp("__pszObjId"))
                this.__pszObjId := PSTR(this.ptr + 0)
            return this.__pszObjId
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_OBJID_BLOB</a> structure that contains any parameters associated with the specified capability in <b>pszObjId</b>. 
     * 
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  For 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptencodeobject">CryptEncodeObject</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptencodeobjectex">CryptEncodeObjectEx</a> with the <i>dwCertEncodingType</i> set to X509_ASN_ENCODING, if the <b>cbData</b> member of the <b>Parameters</b> member is zero, the encoded parameters are omitted. They are not encoded as a <b>NULL</b> (05 00) as is done when encoding a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a>. This follows the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">Secure/Multipurpose Internet Mail Extensions</a> (S/MIME) specification for encoding capabilities that requires this omission.</div>
     * <div> </div>
     * @type {CRYPT_INTEGER_BLOB}
     */
    Parameters{
        get {
            if(!this.HasProp("__Parameters"))
                this.__Parameters := CRYPT_INTEGER_BLOB(this.ptr + 8)
            return this.__Parameters
        }
    }
}
