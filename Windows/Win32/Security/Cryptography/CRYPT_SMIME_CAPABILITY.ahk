#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * The CRYPT_SMIME_CAPABILITY structure specifies a single capability and its associated parameters. Single capabilities are grouped together into a list of CRYPT_SMIME_CAPABILITIES which can specify a prioritized list of capability preferences.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-crypt_smime_capability
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_SMIME_CAPABILITY {
    #StructPack 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">Object identifier</a> (OID) for a capability. Capabilities include signature algorithms, <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">symmetric algorithms</a>, and key enciphering algorithms. Also included are non-algorithm capabilities, which are the preference for <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">signed data</a> and the preference for unencrypted messages.
     */
    pszObjId : PSTR

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
     */
    Parameters : CRYPT_INTEGER_BLOB

}
