#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NCRYPT_KEY_HANDLE.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk
#Include .\CRYPT_ALGORITHM_IDENTIFIER.ahk

/**
 * Contains signer information. It is passed to CryptMsgCountersign, CryptMsgCountersignEncoded, and optionally to CryptMsgOpenToEncode as a member of the CMSG_SIGNED_ENCODE_INFO structure, if the dwMsgType parameter is CMSG_SIGNED.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cmsg_signer_encode_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CMSG_SIGNER_ENCODE_INFO extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * The size, in bytes, of this structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_info">CERT_INFO</a> structure that contains the  
     * 
     * 
     * <b>Issuer</b>, <b>SerialNumber</b>, and <b>SubjectPublicKeyInfo</b> members.
     * 
     * The <b>pbData</b> members of the <b>Issuer</b> and <b>SerialNumber</b> structures combined uniquely identify a certificate. The <b>Algorithm</b> member of the <b>SubjectPublicKeyInfo</b> structure specifies the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/h-gly">hash</a> encryption algorithm used.
     * @type {Pointer<CERT_INFO>}
     */
    pCertInfo {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer}
     */
    hCryptProv {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {NCRYPT_KEY_HANDLE}
     */
    hNCryptKey{
        get {
            if(!this.HasProp("__hNCryptKey"))
                this.__hNCryptKey := NCRYPT_KEY_HANDLE(16, this)
            return this.__hNCryptKey
        }
    }

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
     * @type {Integer}
     */
    dwKeySpec {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * A 
     * 						<a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a> structure that specifies the hash algorithm.
     * @type {CRYPT_ALGORITHM_IDENTIFIER}
     */
    HashAlgorithm{
        get {
            if(!this.HasProp("__HashAlgorithm"))
                this.__HashAlgorithm := CRYPT_ALGORITHM_IDENTIFIER(32, this)
            return this.__HashAlgorithm
        }
    }

    /**
     * Not used. This member must be set to <b>NULL</b>.
     * @type {Pointer<Void>}
     */
    pvHashAuxInfo {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * The number of elements in the <b>rgAuthAttr</b> array. If no authenticated attributes are present in <b>rgAuthAttr</b>, then <b>cAuthAttr</b> is zero.
     * @type {Integer}
     */
    cAuthAttr {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * An array of pointers to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_attribute">CRYPT_ATTRIBUTE</a> structures, each of which contains authenticated attribute information. 
     * 
     * 
     * 
     * 
     * The PKCS #9 standard dictates that if there are any attributes, there must be at least two: the content type <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a> (OID) and the hash of the message. These attributes are automatically added by the system.
     * @type {Pointer<CRYPT_ATTRIBUTE>}
     */
    rgAuthAttr {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * The number of elements in the <b>rgUnauthAttr</b> array. If there are no unauthenticated attributes, <b>cUnauthAttr</b> is zero.
     * @type {Integer}
     */
    cUnauthAttr {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * An array of pointers to <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_attribute">CRYPT_ATTRIBUTE</a> structures, each of which contains unauthenticated attribute information. Unauthenticated attributes can contain <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">countersignatures</a>, among other uses.
     * @type {Pointer<CRYPT_ATTRIBUTE>}
     */
    rgUnauthAttr {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 96
    }
}
