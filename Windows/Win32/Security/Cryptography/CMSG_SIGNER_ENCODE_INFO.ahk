#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_ATTRIBUTE.ahk" { CRYPT_ATTRIBUTE }
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import ".\NCRYPT_KEY_HANDLE.ahk" { NCRYPT_KEY_HANDLE }
#Import ".\CRYPT_ALGORITHM_IDENTIFIER.ahk" { CRYPT_ALGORITHM_IDENTIFIER }
#Import ".\CERT_INFO.ahk" { CERT_INFO }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Contains signer information. It is passed to CryptMsgCountersign, CryptMsgCountersignEncoded, and optionally to CryptMsgOpenToEncode as a member of the CMSG_SIGNED_ENCODE_INFO structure, if the dwMsgType parameter is CMSG_SIGNED.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cmsg_signer_encode_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CMSG_SIGNER_ENCODE_INFO {
    #StructPack 8

    /**
     * The size, in bytes, of this structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_info">CERT_INFO</a> structure that contains the  
     * 
     * 
     * <b>Issuer</b>, <b>SerialNumber</b>, and <b>SubjectPublicKeyInfo</b> members.
     * 
     * The <b>pbData</b> members of the <b>Issuer</b> and <b>SerialNumber</b> structures combined uniquely identify a certificate. The <b>Algorithm</b> member of the <b>SubjectPublicKeyInfo</b> structure specifies the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/h-gly">hash</a> encryption algorithm used.
     */
    pCertInfo : CERT_INFO.Ptr

    hCryptProv : IntPtr

    /**
     * Specifies the private key to be used. This member is not used when the <i>hNCryptKey</i> member is used. 
     * 
     * 
     * 
     * 
     * If <b>dwKeySpec</b> is zero, then the default AT_KEYEXCHANGE value is used.
     * 
     * The following <b>dwKeySpec</b> values are defined for the default provider.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AT_KEYEXCHANGE"></a><a id="at_keyexchange"></a><dl>
     * <dt><b>AT_KEYEXCHANGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Keys used to encrypt/decrypt session keys.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AT_SIGNATURE"></a><a id="at_signature"></a><dl>
     * <dt><b>AT_SIGNATURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Keys used to create and verify digital signatures.
     * 
     * </td>
     * </tr>
     * </table>
     */
    dwKeySpec : UInt32

    /**
     * A 
     * 						<a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a> structure that specifies the hash algorithm.
     */
    HashAlgorithm : CRYPT_ALGORITHM_IDENTIFIER

    /**
     * Not used. This member must be set to <b>NULL</b>.
     */
    pvHashAuxInfo : IntPtr

    /**
     * The number of elements in the <b>rgAuthAttr</b> array. If no authenticated attributes are present in <b>rgAuthAttr</b>, then <b>cAuthAttr</b> is zero.
     */
    cAuthAttr : UInt32

    /**
     * An array of pointers to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_attribute">CRYPT_ATTRIBUTE</a> structures, each of which contains authenticated attribute information. 
     * 
     * 
     * 
     * 
     * The PKCS #9 standard dictates that if there are any attributes, there must be at least two: the content type <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a> (OID) and the hash of the message. These attributes are automatically added by the system.
     */
    rgAuthAttr : CRYPT_ATTRIBUTE.Ptr

    /**
     * The number of elements in the <b>rgUnauthAttr</b> array. If there are no unauthenticated attributes, <b>cUnauthAttr</b> is zero.
     */
    cUnauthAttr : UInt32

    /**
     * An array of pointers to <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_attribute">CRYPT_ATTRIBUTE</a> structures, each of which contains unauthenticated attribute information. Unauthenticated attributes can contain <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">countersignatures</a>, among other uses.
     */
    rgUnauthAttr : CRYPT_ATTRIBUTE.Ptr

    static __New() {
        DefineProp(this.Prototype, 'hNCryptKey', { type: NCRYPT_KEY_HANDLE, offset: 16 })
        this.DeleteProp("__New")
    }
}
