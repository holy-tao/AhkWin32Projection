#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 * @charset Unicode
 */
class ADD_CREDENTIALS_FN_W extends IUnknown {

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
     * @param {Pointer<SecHandle>} param0 
     * @param {Pointer<Integer>} param1 
     * @param {Pointer<Integer>} param2 
     * @param {Integer} param3 
     * @param {Pointer<Void>} param4 
     * @param {Pointer<SEC_GET_KEY_FN>} param5 
     * @param {Pointer<Void>} param6 
     * @param {Pointer<Integer>} param7 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(param0, param1, param2, param3, param4, param5, param6, param7) {
        param1Marshal := param1 is VarRef ? "ushort*" : "ptr"
        param2Marshal := param2 is VarRef ? "ushort*" : "ptr"
        param4Marshal := param4 is VarRef ? "ptr" : "ptr"
        param6Marshal := param6 is VarRef ? "ptr" : "ptr"
        param7Marshal := param7 is VarRef ? "int64*" : "ptr"

        result := ComCall(3, this, "ptr", param0, param1Marshal, param1, param2Marshal, param2, "uint", param3, param4Marshal, param4, "ptr", param5, param6Marshal, param6, param7Marshal, param7, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
