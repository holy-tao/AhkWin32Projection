#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Environment
 * @version v4.0.30319
 */
class VBS_BASIC_ENCLAVE_BASIC_CALL_GENERATE_KEY extends IUnknown {

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
     * @param {Pointer<ENCLAVE_VBS_BASIC_KEY_REQUEST>} KeyRequest 
     * @param {Integer} RequestedKeySize 
     * @param {Pointer<Integer>} ReturnedKey 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(KeyRequest, RequestedKeySize, ReturnedKey) {
        ReturnedKeyMarshal := ReturnedKey is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, "ptr", KeyRequest, "uint", RequestedKeySize, ReturnedKeyMarshal, ReturnedKey, "int")
        return result
    }
}
