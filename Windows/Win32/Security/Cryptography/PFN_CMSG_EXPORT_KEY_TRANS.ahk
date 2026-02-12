#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Encrypts and exports the content encryption key for a key transport recipient of an enveloped message.
 * @remarks
 * The <b>PFN_CMSG_EXPORT_KEY_TRANS</b> function must update the <b>EncryptedKey</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cmsg_key_trans_encrypt_info">CMSG_KEY_TRANS_ENCRYPT_INFO</a> structure pointed to by the <i>pKeyTransEncryptInfo</i> parameter. This function must use the <b>pfnAlloc</b> and <b>pfnFree</b> members of the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cmsg_content_encrypt_info">CMSG_CONTENT_ENCRYPT_INFO</a> structure pointed to by the <i>pContentEncryptInfo</i> parameter to manage memory allocation for the encrypted key.
 * 
 * You can use <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/cryptography-functions">OID Support Functions</a> to deploy this callback function. Wincrypt.h defines the following constants for this purpose.
 * 
 * You must define different callback functions for CAPI1 keys and Cryptography API: Next Generation (CNG) keys. Both functions have the same signature but use different OIDs. Which function is called depends on the value of the <b>fCNG</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cmsg_content_encrypt_info">CMSG_CONTENT_ENCRYPT_INFO</a> structure pointed to by the <i>pContentEncryptInfo</i> parameter. The following table shows the relationship between the callback function and the value of the <b>fCNG</b> member.
 * 
 * <table>
 * <tr>
 * <th>fCNG value</th>
 * <th>Constant</th>
 * <th>Definition</th>
 * </tr>
 * <tr>
 * <td>FALSE</td>
 * <td>CMSG_OID_EXPORT_KEY_TRANS_FUNC or CMSG_OID_CAPI1_EXPORT_KEY_TRANS_FUNC</td>
 * <td>"CryptMsgDllExportKeyTrans"</td>
 * </tr>
 * <tr>
 * <td>TRUE</td>
 * <td>CMSG_OID_CNG_EXPORT_KEY_TRANS_FUNC</td>
 * <td>"CryptMsgDllCNGExportKeyTrans"</td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api//content/wincrypt/nc-wincrypt-pfn_cmsg_export_key_trans
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class PFN_CMSG_EXPORT_KEY_TRANS extends IUnknown {

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
     * @param {Pointer<CMSG_KEY_TRANS_RECIPIENT_ENCODE_INFO>} pKeyTransEncodeInfo 
     * @param {Pointer<CMSG_KEY_TRANS_ENCRYPT_INFO>} pKeyTransEncryptInfo 
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
    Invoke(pContentEncryptInfo, pKeyTransEncodeInfo, pKeyTransEncryptInfo, dwFlags) {
        static pvReserved := 0 ;Reserved parameters must always be NULL

        result := ComCall(3, this, "ptr", pContentEncryptInfo, "ptr", pKeyTransEncodeInfo, "ptr", pKeyTransEncryptInfo, "uint", dwFlags, "ptr", pvReserved, "int")
        return result
    }
}
