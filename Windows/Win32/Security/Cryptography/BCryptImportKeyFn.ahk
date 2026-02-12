#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class BCryptImportKeyFn extends IUnknown {

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
     * @param {BCRYPT_ALG_HANDLE} hAlgorithm 
     * @param {BCRYPT_KEY_HANDLE} hImportKey 
     * @param {PWSTR} pszBlobType 
     * @param {Pointer<BCRYPT_KEY_HANDLE>} phKey 
     * @param {Pointer} pbKeyObject 
     * @param {Integer} cbKeyObject 
     * @param {Pointer} pbInput 
     * @param {Integer} cbInput 
     * @param {Integer} dwFlags 
     * @returns {NTSTATUS} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hAlgorithm, hImportKey, pszBlobType, phKey, pbKeyObject, cbKeyObject, pbInput, cbInput, dwFlags) {
        hAlgorithm := hAlgorithm is Win32Handle ? NumGet(hAlgorithm, "ptr") : hAlgorithm
        hImportKey := hImportKey is Win32Handle ? NumGet(hImportKey, "ptr") : hImportKey
        pszBlobType := pszBlobType is String ? StrPtr(pszBlobType) : pszBlobType

        result := ComCall(3, this, "ptr", hAlgorithm, "ptr", hImportKey, "ptr", pszBlobType, "ptr", phKey, "ptr", pbKeyObject, "uint", cbKeyObject, "ptr", pbInput, "uint", cbInput, "uint", dwFlags, "int")
        return result
    }
}
