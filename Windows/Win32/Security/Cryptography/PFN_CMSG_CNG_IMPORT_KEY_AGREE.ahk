#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Decrypts a content encryption key (CEK) that is intended for a key agreement recipient.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptmsgcontrol">CryptMsgControl</a> function calls this function for the following operations specified by the <i>dwCtrlType</i> parameter:
 * 
 * <b>CMSG_CTRL_KEY_AGREE_DECRYPT</b>
 * You can use <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/cryptography-functions">OID Support Functions</a> to deploy this callback function. Wincrypt.h defines the following constant for this purpose.
 * 
 * <table>
 * <tr>
 * <th>Constant</th>
 * <th>Definition</th>
 * </tr>
 * <tr>
 * <td>CMSG_OID_CNG_IMPORT_KEY_AGREE_FUNC</td>
 * <td>"CryptMsgDllCNGImportKeyAgree"</td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api//content/wincrypt/nc-wincrypt-pfn_cmsg_cng_import_key_agree
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class PFN_CMSG_CNG_IMPORT_KEY_AGREE extends IUnknown {

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
     * @param {Pointer<CMSG_CNG_CONTENT_DECRYPT_INFO>} pCNGContentDecryptInfo 
     * @param {Pointer<CMSG_CTRL_KEY_AGREE_DECRYPT_PARA>} pKeyAgreeDecryptPara 
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
    Invoke(pCNGContentDecryptInfo, pKeyAgreeDecryptPara, dwFlags) {
        static pvReserved := 0 ;Reserved parameters must always be NULL

        result := ComCall(3, this, "ptr", pCNGContentDecryptInfo, "ptr", pKeyAgreeDecryptPara, "uint", dwFlags, "ptr", pvReserved, "int")
        return result
    }
}
