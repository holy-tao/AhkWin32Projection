#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Imports a content encryption key for a key transport recipient of an enveloped message. (PFN_CMSG_IMPORT_KEY_TRANS)
 * @remarks
 * You can use <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/cryptography-functions">OID Support Functions</a> to deploy this callback function. Wincrypt.h defines the following constants for this purpose.
 * 
 * <table>
 * <tr>
 * <th>Constant</th>
 * <th>Definition</th>
 * </tr>
 * <tr>
 * <td>CMSG_OID_IMPORT_KEY_TRANS_FUNC or CMSG_OID_CAPI1_IMPORT_KEY_TRANS_FUNC</td>
 * <td>"CryptMsgDllImportKeyTrans"</td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api//content/wincrypt/nc-wincrypt-pfn_cmsg_import_key_trans
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class PFN_CMSG_IMPORT_KEY_TRANS extends IUnknown {

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
     * @param {Pointer<CRYPT_ALGORITHM_IDENTIFIER>} pContentEncryptionAlgorithm 
     * @param {Pointer<CMSG_CTRL_KEY_TRANS_DECRYPT_PARA>} pKeyTransDecryptPara 
     * @param {Integer} dwFlags 
     * @param {Pointer<Pointer>} phContentEncryptKey 
     * @returns {BOOL} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(pContentEncryptionAlgorithm, pKeyTransDecryptPara, dwFlags, phContentEncryptKey) {
        static pvReserved := 0 ;Reserved parameters must always be NULL

        phContentEncryptKeyMarshal := phContentEncryptKey is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", pContentEncryptionAlgorithm, "ptr", pKeyTransDecryptPara, "uint", dwFlags, "ptr", pvReserved, phContentEncryptKeyMarshal, phContentEncryptKey, "int")
        return result
    }
}
