#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\HCRYPTPROV_LEGACY.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk
#Include .\CRYPT_ALGORITHM_IDENTIFIER.ahk

/**
 * Contains information needed to encode an enveloped message. It is passed to CryptMsgOpenToEncode if the dwMsgType parameter is CMSG_ENVELOPED.
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-cmsg_enveloped_encode_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CMSG_ENVELOPED_ENCODE_INFO extends Win32Struct
{
    static sizeof => 64

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
     * This member is not used and should be set to <b>NULL</b>.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>Specifies a handle to the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">cryptographic service provider</a> (CSP) used to do content encryption, recipient key encryption, and export. The private keys of the <b>hCryptProv</b> are not used. 
     * 
     * 
     * This member's data type is <b>HCRYPTPROV</b>.
     * 
     * Unless there is a strong reason for passing in a specific cryptographic provider in <b>hCryptProv</b>, pass zero to use the default RSA or DSS provider.
     * @type {HCRYPTPROV_LEGACY}
     */
    hCryptProv{
        get {
            if(!this.HasProp("__hCryptProv"))
                this.__hCryptProv := HCRYPTPROV_LEGACY(8, this)
            return this.__hCryptProv
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a> structure that contains the signature algorithm type and any associated additional parameters in encoded form. 
     * 
     * 
     * 
     * 
     * The <b>pszObjId</b> member of the structure specifies the algorithm used to encrypt the message contents.
     * 
     * The following encryption algorithms require an encoded eight byte <a href="https://docs.microsoft.com/windows/desktop/SecGloss/i-gly">initialization vector</a> (IV) in the <b>Parameters</b> member of structure. For details, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptsetkeyparam">CryptSetKeyParam</a>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CALG_DES"></a><a id="calg_des"></a><dl>
     * <dt><b>CALG_DES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * szOID_OIWSEC_desCBC
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CALG_3DES"></a><a id="calg_3des"></a><dl>
     * <dt><b>CALG_3DES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * szOID_RSA_DES_EDE3_CBC
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * If the <b>cbData</b> member of the <b>Parameters</b> member is zero, an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">Abstract Syntax Notation One</a> (ASN.1) encoded OCTET STRING containing the IV is generated using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptgenrandom">CryptGenRandom</a>.
     * 
     * The szOID_RSA_RC2CBC (CALG_RC2) algorithm requires the <b>pbData</b> member of <b>Parameters</b> to be an encoded 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_rc2_cbc_parameters">CRYPT_RC2_CBC_PARAMETERS</a> structure. If the <b>cbData</b> member of the <b>Parameters</b> member is zero, an ASN.1 encoded CRYPT_RC2_CBC_PARAMETERS is generated with a default value of 40 for the <b>dwVersion</b> member. This sets the default key length to 40 bits. This default key length can be overridden with <b>pvEncryptionAuxInfo</b> pointing to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cmsg_rc2_aux_info">CMSG_RC2_AUX_INFO</a> structure containing the desired key length.
     * 
     * <div class="alert"><b>Note</b>  On decryption, if an IV exists, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptsetkeyparam">CryptSetKeyParam</a> is called with the IV before decryption begins.</div>
     * <div> </div>
     * @type {CRYPT_ALGORITHM_IDENTIFIER}
     */
    ContentEncryptionAlgorithm{
        get {
            if(!this.HasProp("__ContentEncryptionAlgorithm"))
                this.__ContentEncryptionAlgorithm := CRYPT_ALGORITHM_IDENTIFIER(16, this)
            return this.__ContentEncryptionAlgorithm
        }
    }

    /**
     * A pointer to a structure depending on the encryption algorithm. 
     * 
     * 
     * 
     * 
     * 					
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RC2"></a><a id="rc2"></a><dl>
     * <dt><b>RC2</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cmsg_rc2_aux_info">CMSG_RC2_AUX_INFO</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RC4"></a><a id="rc4"></a><dl>
     * <dt><b>RC4</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cmsg_rc4_aux_info">CMSG_RC4_AUX_INFO</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SP3_or_compatible"></a><a id="sp3_or_compatible"></a><a id="SP3_OR_COMPATIBLE"></a><dl>
     * <dt><b>SP3 or compatible</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cmsg_sp3_compatible_aux_info">CMSG_SP3_COMPATIBLE_AUX_INFO</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="All_other_encryption_algorithms"></a><a id="all_other_encryption_algorithms"></a><a id="ALL_OTHER_ENCRYPTION_ALGORITHMS"></a><dl>
     * <dt><b>All other encryption algorithms</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>NULL</b>
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Pointer<Void>}
     */
    pvEncryptionAuxInfo {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Number of elements in the <b>rgpRecipients</b> or <b>rgCmsRecipients</b> array.
     * @type {Integer}
     */
    cRecipients {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * An array of pointers to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_info">CERT_INFO</a> structures, each containing a recipient's certificate Issuer, SerialNumber, and SubjectPublicKeyInfo. This array can only be used for recipients identified by their Issuer and serial number. If <b>rgpRecipients</b> is not <b>NULL</b>, <b>rgCmsRecipients</b> must be <b>NULL</b>.
     * @type {Pointer<CERT_INFO>}
     */
    rgpRecipients {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 64
    }
}
