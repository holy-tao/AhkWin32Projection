#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class PFN_CMSG_EXPORT_ENCRYPT_KEY extends IUnknown {

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
     * @param {Pointer} hCryptProv 
     * @param {Pointer} hEncryptKey 
     * @param {Pointer<CERT_PUBLIC_KEY_INFO>} pPublicKeyInfo 
     * @param {Pointer} pbData 
     * @param {Pointer<Integer>} pcbData 
     * @returns {BOOL} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hCryptProv, hEncryptKey, pPublicKeyInfo, pbData, pcbData) {
        pcbDataMarshal := pcbData is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", hCryptProv, "ptr", hEncryptKey, "ptr", pPublicKeyInfo, "ptr", pbData, pcbDataMarshal, pcbData, "int")
        return result
    }
}
