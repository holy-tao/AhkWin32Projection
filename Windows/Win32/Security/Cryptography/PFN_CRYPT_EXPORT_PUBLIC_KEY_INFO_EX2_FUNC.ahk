#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Called by CryptExportPublicKeyInfoEx to export a public key BLOB and encode it.
 * @remarks
 * You can use <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/cryptography-functions">OID Support Functions</a> to deploy this callback function. Wincrypt.h defines the following constant for this purpose.
 * 
 * <table>
 * <tr>
 * <th>Constant</th>
 * <th>Definition</th>
 * </tr>
 * <tr>
 * <td>CRYPT_OID_EXPORT_PUBLIC_KEY_INFO_EX2_FUNC</td>
 * <td>"CryptDllExportPublicKeyInfoEx2"</td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api//content/wincrypt/nc-wincrypt-pfn_crypt_export_public_key_info_ex2_func
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class PFN_CRYPT_EXPORT_PUBLIC_KEY_INFO_EX2_FUNC extends IUnknown {

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
     * @param {NCRYPT_KEY_HANDLE} hNCryptKey 
     * @param {Integer} dwCertEncodingType 
     * @param {PSTR} pszPublicKeyObjId 
     * @param {Integer} dwFlags 
     * @param {Pointer<Void>} pvAuxInfo 
     * @param {Pointer} pInfo 
     * @param {Pointer<Integer>} pcbInfo 
     * @returns {BOOL} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hNCryptKey, dwCertEncodingType, pszPublicKeyObjId, dwFlags, pvAuxInfo, pInfo, pcbInfo) {
        hNCryptKey := hNCryptKey is Win32Handle ? NumGet(hNCryptKey, "ptr") : hNCryptKey
        pszPublicKeyObjId := pszPublicKeyObjId is String ? StrPtr(pszPublicKeyObjId) : pszPublicKeyObjId

        pvAuxInfoMarshal := pvAuxInfo is VarRef ? "ptr" : "ptr"
        pcbInfoMarshal := pcbInfo is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", hNCryptKey, "uint", dwCertEncodingType, "ptr", pszPublicKeyObjId, "uint", dwFlags, pvAuxInfoMarshal, pvAuxInfo, "ptr", pInfo, pcbInfoMarshal, pcbInfo, "int")
        return result
    }
}
