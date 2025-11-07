#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\HCRYPTPROV_LEGACY.ahk

/**
 * Contains information used to verify a message signature. It contains the signer index and signer public key.
 * @remarks
 * 
 * If <b>dwSignerType</b> is CMSG_VERIFY_SIGNER_NULL, the signature is expected to contain only the unencrypted hash octets.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-cmsg_ctrl_verify_signature_ex_para
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CMSG_CTRL_VERIFY_SIGNATURE_EX_PARA extends Win32Struct
{
    static sizeof => 32

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
     * <b>Windows Server 2003 and Windows XP:  </b>A handle to the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">cryptographic provider</a> used to verify the signature. If <b>NULL</b>, the cryptographic provider specified in <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptmsgopentodecode">CryptMsgOpenToDecode</a> is used. If the <i>hCryptProv</i> in <b>CryptMsgOpenToDecode</b> is also <b>NULL</b>, the default provider according to the signer's public key <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a> (OID) is used.This member's data type is <b>HCRYPTPROV</b>.
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
     * The index of the signer in the message.
     * @type {Integer}
     */
    dwSignerIndex {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The structure that contains the signer information. The following table shows the predefined values and the structures indicated.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CMSG_VERIFY_SIGNER_PUBKEY"></a><a id="cmsg_verify_signer_pubkey"></a><dl>
     * <dt><b>CMSG_VERIFY_SIGNER_PUBKEY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_public_key_info">CERT_PUBLIC_KEY_INFO</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CMSG_VERIFY_SIGNER_CERT"></a><a id="cmsg_verify_signer_cert"></a><dl>
     * <dt><b>CMSG_VERIFY_SIGNER_CERT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_context">CERT_CONTEXT</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CMSG_VERIFY_SIGNER_CHAIN"></a><a id="cmsg_verify_signer_chain"></a><dl>
     * <dt><b>CMSG_VERIFY_SIGNER_CHAIN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_chain_context">CERT_CHAIN_CONTEXT</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CMSG_VERIFY_SIGNER_NULL"></a><a id="cmsg_verify_signer_null"></a><dl>
     * <dt><b>CMSG_VERIFY_SIGNER_NULL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>NULL</b>
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwSignerType {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_public_key_info">CERT_PUBLIC_KEY_INFO</a> structure, a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate context</a>, a chain context, or <b>NULL</b> depending on the value of <b>dwSignerType</b>.
     * @type {Pointer<Void>}
     */
    pvSigner {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 32
    }
}
