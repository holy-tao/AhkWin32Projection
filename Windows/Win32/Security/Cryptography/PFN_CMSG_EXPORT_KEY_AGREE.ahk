#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Encrypts and exports the content encryption key for a key agreement recipient of an enveloped message.
 * @remarks
 * For each recipient key, the <b>PFN_CMSG_EXPORT_KEY_AGREE</b> function must update the   <b>EncryptedKey</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cmsg_key_agree_key_encrypt_info">CMSG_KEY_AGREE_KEY_ENCRYPT_INFO</a> structure referred to by the <b>rgpKeyAgreeKeyEncryptInfo</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cmsg_key_agree_encrypt_info">CMSG_KEY_AGREE_ENCRYPT_INFO</a> structure pointed to by the <i>pKeyAgreeEncryptInfo</i> parameter. This function must use the <b>pfnAlloc</b> and <b>pfnFree</b> members of the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cmsg_content_encrypt_info">CMSG_CONTENT_ENCRYPT_INFO</a> structure pointed to by the <i>pContentEncryptInfo</i> parameter to manage memory for any values that it updates.
 * 
 * If, upon entry,  the <b>dwEncryptFlags</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cmsg_content_encrypt_info">CMSG_CONTENT_ENCRYPT_INFO</a> structure pointed to by the <i>pContentEncryptInfo</i> member is set to <b>CMSG_CONTENT_ENCRYPT_PAD_ENCODED_LEN_FLAG</b>, the ephemeral <b>PublicKey</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_public_key_info">CERT_PUBLIC_KEY_INFO</a> structure referred to by the <b>OriginatorPublicKeyInfo</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cmsg_key_agree_encrypt_info">CMSG_KEY_AGREE_ENCRYPT_INFO</a> structure pointed to by the <i>pKeyAgreeEncryptInfo</i> parameter should be padded with zeros to always obtain the same maximum encoded length. <div class="alert"><b>Note</b>  The length of the generated ephemeral Y public key can vary depending on the number of leading zero bits.</div>
 * <div> </div>
 * 
 * 
 * You can use <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/cryptography-functions">OID Support Functions</a> to deploy this callback function. Wincrypt.h defines the following constants for this purpose.
 * 
 * You must define different callback functions for CAPI1 keys and Cryptography API: Next Generation (CNG) keys. Both functions have the same signature but use different OIDs. Which function is called depends on the value of the  <b>fCNG</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cmsg_content_encrypt_info">CMSG_CONTENT_ENCRYPT_INFO</a> structure pointed to by the <i>pContentEncryptInfo</i> parameter. The following table shows the relationship between the callback function and the value of the <b>fCNG</b> member.
 * 
 * <table>
 * <tr>
 * <th>fCNG value</th>
 * <th>Constant</th>
 * <th>Definition</th>
 * </tr>
 * <tr>
 * <td><b>FALSE</b></td>
 * <td>CMSG_OID_EXPORT_KEY_AGREE_FUNC or CMSG_OID_CAPI1_EXPORT_KEY_AGREE_FUNC</td>
 * <td>"CryptMsgDllExportKeyAgree"</td>
 * </tr>
 * <tr>
 * <td><b>TRUE</b></td>
 * <td>CMSG_OID_CNG_EXPORT_KEY_AGREE_FUNC</td>
 * <td>"CryptMsgDllCNGExportKeyAgree"</td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api//content/wincrypt/nc-wincrypt-pfn_cmsg_export_key_agree
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class PFN_CMSG_EXPORT_KEY_AGREE extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {Pointer<CMSG_CONTENT_ENCRYPT_INFO>} pContentEncryptInfo 
     * @param {Pointer<CMSG_KEY_AGREE_RECIPIENT_ENCODE_INFO>} pKeyAgreeEncodeInfo 
     * @param {Pointer<CMSG_KEY_AGREE_ENCRYPT_INFO>} pKeyAgreeEncryptInfo 
     * @param {Integer} dwFlags 
     * @returns {BOOL} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(pContentEncryptInfo, pKeyAgreeEncodeInfo, pKeyAgreeEncryptInfo, dwFlags) {
        static pvReserved := 0 ;Reserved parameters must always be NULL

        result := ComCall(3, this, "ptr", pContentEncryptInfo, "ptr", pKeyAgreeEncodeInfo, "ptr", pKeyAgreeEncryptInfo, "uint", dwFlags, "ptr", pvReserved, "int")
        return result
    }
}
