#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Decrypts the private key and returns the decrypted key in the pbClearTextKey parameter.
 * @see https://learn.microsoft.com/windows/win32/api//content/wincrypt/nc-wincrypt-pcrypt_decrypt_private_key_func
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class PCRYPT_DECRYPT_PRIVATE_KEY_FUNC extends IUnknown {

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
     * @param {CRYPT_ALGORITHM_IDENTIFIER} Algorithm 
     * @param {CRYPT_INTEGER_BLOB} EncryptedPrivateKey 
     * @param {Pointer} pbClearTextKey 
     * @param {Pointer<Integer>} pcbClearTextKey 
     * @param {Pointer<Void>} pVoidDecryptFunc 
     * @returns {BOOL} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(Algorithm, EncryptedPrivateKey, pbClearTextKey, pcbClearTextKey, pVoidDecryptFunc) {
        pcbClearTextKeyMarshal := pcbClearTextKey is VarRef ? "uint*" : "ptr"
        pVoidDecryptFuncMarshal := pVoidDecryptFunc is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ptr", Algorithm, "ptr", EncryptedPrivateKey, "ptr", pbClearTextKey, pcbClearTextKeyMarshal, pcbClearTextKey, pVoidDecryptFuncMarshal, pVoidDecryptFunc, "int")
        return result
    }
}
