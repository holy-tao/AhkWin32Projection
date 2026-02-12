#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Called by CryptImportPublicKeyInfoEx2 to decode the public key algorithm identifier, load the algorithm provider, and import the key pair.
 * @remarks
 * You can use <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/cryptography-functions">OID Support Functions</a> to deploy this callback function. Wincrypt.h defines the following constant for this purpose.
 * 
 * <table>
 * <tr>
 * <th>Constant</th>
 * <th>Definition</th>
 * </tr>
 * <tr>
 * <td>CRYPT_OID_IMPORT_PUBLIC_KEY_INFO_EX2_FUNC</td>
 * <td>"CryptDllImportPublicKeyInfoEx2"</td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api//content/wincrypt/nc-wincrypt-pfn_import_public_key_info_ex2_func
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class PFN_IMPORT_PUBLIC_KEY_INFO_EX2_FUNC extends IUnknown {

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
     * @param {Pointer<CERT_PUBLIC_KEY_INFO>} pInfo 
     * @param {Integer} dwFlags 
     * @param {Pointer<Void>} pvAuxInfo 
     * @param {Pointer<BCRYPT_KEY_HANDLE>} phKey 
     * @returns {BOOL} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(dwCertEncodingType, pInfo, dwFlags, pvAuxInfo, phKey) {
        pvAuxInfoMarshal := pvAuxInfo is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "uint", dwCertEncodingType, "ptr", pInfo, "uint", dwFlags, pvAuxInfoMarshal, pvAuxInfo, "ptr", phKey, "int")
        return result
    }
}
