#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Verifies a signature.
 * @see https://learn.microsoft.com/windows/win32/api//content/cryptxml/nc-cryptxml-cryptxmldllverifysignature
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CryptXmlDllVerifySignature extends IUnknown {

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
     * @param {Pointer<CRYPT_XML_ALGORITHM>} pSignatureMethod 
     * @param {BCRYPT_KEY_HANDLE} hKey_ 
     * @param {Pointer} pbInput 
     * @param {Integer} cbInput 
     * @param {Pointer} pbSignature 
     * @param {Integer} cbSignature 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(pSignatureMethod, hKey_, pbInput, cbInput, pbSignature, cbSignature) {
        hKey_ := hKey_ is Win32Handle ? NumGet(hKey_, "ptr") : hKey_

        result := ComCall(3, this, "ptr", pSignatureMethod, "ptr", hKey_, "ptr", pbInput, "uint", cbInput, "ptr", pbSignature, "uint", cbSignature, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
