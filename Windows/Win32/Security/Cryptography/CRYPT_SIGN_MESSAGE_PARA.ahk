#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk
#Include .\CRYPT_ALGORITHM_IDENTIFIER.ahk

/**
 * The CRYPT_SIGN_MESSAGE_PARA structure contains information for signing messages using a specified signing certificate context.
 * @remarks
 * The <b>HashEncryptionAlgorithm</b> and <b>pvHashEncryptionAuxInfo</b> members can only be used if CRYPT_SIGN_MESSAGE_PARA_HAS_CMS_FIELDS is defined.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-crypt_sign_message_para
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_SIGN_MESSAGE_PARA extends Win32Struct
{
    static sizeof => 120

    static packingSize => 8

    /**
     * Size of this structure in bytes.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type of encoding used. It is always acceptable to specify both the certificate and <a href="https://docs.microsoft.com/windows/desktop/SecGloss/m-gly">message encoding types</a> by combining them with a bitwise-<b>OR</b> operation as shown in the following example:
     * 
     * X509_ASN_ENCODING | PKCS_7_ASN_ENCODING
     * 
     * Currently defined encoding types are:
     * 
     * <ul>
     * <li>X509_ASN_ENCODING</li>
     * <li>PKCS_7_ASN_ENCODING</li>
     * </ul>
     * @type {Integer}
     */
    dwMsgEncodingType {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_context">CERT_CONTEXT</a> to be used in the signing.
     * 
     * Either the CERT_KEY_PROV_INFO_PROP_ID, or CERT_KEY_CONTEXT_PROP_ID property must be set for the context to provide access to the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">private signature key</a>.
     * @type {Pointer<CERT_CONTEXT>}
     */
    pSigningCert {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * CRYPT_ALGORITHM_IDENTIFIER containing the hashing algorithm used to hash the data to be signed.
     * @type {CRYPT_ALGORITHM_IDENTIFIER}
     */
    HashAlgorithm{
        get {
            if(!this.HasProp("__HashAlgorithm"))
                this.__HashAlgorithm := CRYPT_ALGORITHM_IDENTIFIER(this.ptr + 16)
            return this.__HashAlgorithm
        }
    }

    /**
     * Not currently used, and must be set to <b>NULL</b>.
     * @type {Pointer<Void>}
     */
    pvHashAuxInfo {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Number of elements in the <b>rgpMsgCert</b> array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_context">CERT_CONTEXT</a> structures. If set to zero no certificates are included in the signed message.
     * @type {Integer}
     */
    cMsgCert {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Array of pointers to <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_context">CERT_CONTEXT</a> structures to be included in the signed message. If the <b>pSigningCert</b> is to be included, a pointer to it must be in the <b>rgpMsgCert</b> array.
     * @type {Pointer<CERT_CONTEXT>}
     */
    rgpMsgCert {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Number of elements in the <b>rgpMsgCrl</b> array of pointers to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crl_context">CRL_CONTEXT</a> structures. If set to zero, no <b>CRL_CONTEXT</b> structures are included in the signed message.
     * @type {Integer}
     */
    cMsgCrl {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * Array of pointers to <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crl_context">CRL_CONTEXT</a> structures to be included in the signed message.
     * @type {Pointer<CRL_CONTEXT>}
     */
    rgpMsgCrl {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * Number of elements in the <b>rgAuthAttr</b> array. If no authenticated attributes are present in <b>rgAuthAttr</b>, this member is set to zero.
     * @type {Integer}
     */
    cAuthAttr {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * Array of pointers to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_attribute">CRYPT_ATTRIBUTE</a> structures, each holding authenticated attribute information. If there are authenticated attributes present, the PKCS #9 standard dictates that there must be at least two attributes present, the content type <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a> (OID), and the hash of the message itself. These attributes are automatically added by the system.
     * @type {Pointer<CRYPT_ATTRIBUTE>}
     */
    rgAuthAttr {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * Number of elements in the <b>rgUnauthAttr</b> array. If no unauthenticated attributes are present in <b>rgUnauthAttr</b>, this member is zero.
     * @type {Integer}
     */
    cUnauthAttr {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * Array of pointers to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_attribute">CRYPT_ATTRIBUTE</a> structures each holding an unauthenticated attribute information. Unauthenticated attributes can be used to contain <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">countersignatures</a>, among other uses.
     * @type {Pointer<CRYPT_ATTRIBUTE>}
     */
    rgUnauthAttr {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * Normally zero. If the encoded output is to be a CMSG_SIGNED <a href="https://docs.microsoft.com/windows/desktop/SecGloss/i-gly">inner content</a> of an outer cryptographic message such as a CMSG_ENVELOPED message, the CRYPT_MESSAGE_BARE_CONTENT_OUT_FLAG must be set. If it is not set, the message will be encoded as an <i>inner content</i> type of CMSG_DATA. 
     * 
     * 
     * 
     * 
     * CRYPT_MESSAGE_ENCAPSULATED_CONTENT_OUT_FLAG can be set to encapsulate non-data <a href="https://docs.microsoft.com/windows/desktop/SecGloss/i-gly">inner content</a> into an OCTET STRING. CRYPT_MESSAGE_KEYID_SIGNER_FLAG can be set to identify signers by their Key Identifier and not their Issuer and Serial Number.
     * 
     * CRYPT_MESSAGE_SILENT_KEYSET_FLAG can be set to suppress any UI by the CSP. For more information about the CRYPT_SILENT flag, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptacquirecontexta">CryptAcquireContext</a>.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 112, "uint")
        set => NumPut("uint", value, this, 112)
    }

    /**
     * Normally zero. Set to the encoding type of the input message if that input to be signed is the encoded output of another cryptographic message.
     * @type {Integer}
     */
    dwInnerContentType {
        get => NumGet(this, 116, "uint")
        set => NumPut("uint", value, this, 116)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 120
    }
}
