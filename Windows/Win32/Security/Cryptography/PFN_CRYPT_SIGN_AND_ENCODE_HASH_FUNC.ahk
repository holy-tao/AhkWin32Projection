#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Called to sign and encode a computed hash.
 * @remarks
 * You can use <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/cryptography-functions">OID Support Functions</a> to deploy this callback function. Wincrypt.h defines the following constant for this purpose.
 * 
 * <table>
 * <tr>
 * <th>Constant</th>
 * <th>Definition</th>
 * </tr>
 * <tr>
 * <td>CRYPT_OID_SIGN_AND_ENCODE_HASH_FUNC</td>
 * <td>"CryptDllSignAndEncodeHash"</td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api//content/wincrypt/nc-wincrypt-pfn_crypt_sign_and_encode_hash_func
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class PFN_CRYPT_SIGN_AND_ENCODE_HASH_FUNC extends IUnknown {

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
     * @param {NCRYPT_KEY_HANDLE} hKey_ 
     * @param {Integer} dwCertEncodingType 
     * @param {Pointer<CRYPT_ALGORITHM_IDENTIFIER>} pSignatureAlgorithm 
     * @param {Pointer<Void>} pvDecodedSignPara 
     * @param {PWSTR} pwszCNGPubKeyAlgid 
     * @param {PWSTR} pwszCNGHashAlgid 
     * @param {Pointer} pbComputedHash 
     * @param {Integer} cbComputedHash 
     * @param {Pointer} pbSignature 
     * @param {Pointer<Integer>} pcbSignature 
     * @returns {BOOL} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hKey_, dwCertEncodingType, pSignatureAlgorithm, pvDecodedSignPara, pwszCNGPubKeyAlgid, pwszCNGHashAlgid, pbComputedHash, cbComputedHash, pbSignature, pcbSignature) {
        hKey_ := hKey_ is Win32Handle ? NumGet(hKey_, "ptr") : hKey_
        pwszCNGPubKeyAlgid := pwszCNGPubKeyAlgid is String ? StrPtr(pwszCNGPubKeyAlgid) : pwszCNGPubKeyAlgid
        pwszCNGHashAlgid := pwszCNGHashAlgid is String ? StrPtr(pwszCNGHashAlgid) : pwszCNGHashAlgid

        pvDecodedSignParaMarshal := pvDecodedSignPara is VarRef ? "ptr" : "ptr"
        pcbSignatureMarshal := pcbSignature is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", hKey_, "uint", dwCertEncodingType, "ptr", pSignatureAlgorithm, pvDecodedSignParaMarshal, pvDecodedSignPara, "ptr", pwszCNGPubKeyAlgid, "ptr", pwszCNGHashAlgid, "ptr", pbComputedHash, "uint", cbComputedHash, "ptr", pbSignature, pcbSignatureMarshal, pcbSignature, "int")
        return result
    }
}
