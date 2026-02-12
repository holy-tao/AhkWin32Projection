#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Called to decode and return the hash algorithm identifier and optionally the signature parameters.
 * @remarks
 * Memory for the <i>ppvDecodedSignPara</i> and <i>ppwszCNGHashAlgid</i> parameters must be allocated by using the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localalloc">LocalAlloc</a> function.
 * 
 * You can use <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/cryptography-functions">OID Support Functions</a> to deploy this callback function. Wincrypt.h defines the following constant for this purpose.
 * 
 * <table>
 * <tr>
 * <th>Constant</th>
 * <th>Definition</th>
 * </tr>
 * <tr>
 * <td>CRYPT_OID_EXTRACT_ENCODED_SIGNATURE_PARAMETERS_FUNC</td>
 * <td>"CryptDllExtractEncodedSignatureParameters"</td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api//content/wincrypt/nc-wincrypt-pfn_crypt_extract_encoded_signature_parameters_func
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class PFN_CRYPT_EXTRACT_ENCODED_SIGNATURE_PARAMETERS_FUNC extends IUnknown {

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
     * @param {Integer} dwCertEncodingType 
     * @param {Pointer<CRYPT_ALGORITHM_IDENTIFIER>} pSignatureAlgorithm 
     * @param {Pointer<Pointer<Void>>} ppvDecodedSignPara 
     * @param {Pointer<PWSTR>} ppwszCNGHashAlgid 
     * @returns {BOOL} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(dwCertEncodingType, pSignatureAlgorithm, ppvDecodedSignPara, ppwszCNGHashAlgid) {
        ppvDecodedSignParaMarshal := ppvDecodedSignPara is VarRef ? "ptr*" : "ptr"
        ppwszCNGHashAlgidMarshal := ppwszCNGHashAlgid is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "uint", dwCertEncodingType, "ptr", pSignatureAlgorithm, ppvDecodedSignParaMarshal, ppvDecodedSignPara, ppwszCNGHashAlgidMarshal, ppwszCNGHashAlgid, "int")
        return result
    }
}
