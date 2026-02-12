#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Encodes SignatureMethod or DigestMethod elements for agile algorithms with default parameters.
 * @see https://learn.microsoft.com/windows/win32/api//content/cryptxml/nc-cryptxml-cryptxmldllencodealgorithm
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CryptXmlDllEncodeAlgorithm extends IUnknown {

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
     * @param {Pointer<CRYPT_XML_ALGORITHM_INFO>} pAlgInfo 
     * @param {Integer} dwCharset 
     * @param {Pointer<Void>} pvCallbackState 
     * @param {Pointer<PFN_CRYPT_XML_WRITE_CALLBACK>} pfnWrite_ 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(pAlgInfo, dwCharset, pvCallbackState, pfnWrite_) {
        pvCallbackStateMarshal := pvCallbackState is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ptr", pAlgInfo, "int", dwCharset, pvCallbackStateMarshal, pvCallbackState, "ptr", pfnWrite_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
