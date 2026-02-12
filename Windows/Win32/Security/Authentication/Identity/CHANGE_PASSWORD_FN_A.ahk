#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 * @charset ANSI
 */
class CHANGE_PASSWORD_FN_A extends IUnknown {

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
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<Integer>} param1 
     * @param {Pointer<Integer>} param2 
     * @param {Pointer<Integer>} param3 
     * @param {Pointer<Integer>} param4 
     * @param {BOOLEAN} param5 
     * @param {Integer} param6 
     * @param {Pointer<SecBufferDesc>} param7 
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
        param0Marshal := param0 is VarRef ? "char*" : "ptr"
        param1Marshal := param1 is VarRef ? "char*" : "ptr"
        param2Marshal := param2 is VarRef ? "char*" : "ptr"
        param3Marshal := param3 is VarRef ? "char*" : "ptr"
        param4Marshal := param4 is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, param0Marshal, param0, param1Marshal, param1, param2Marshal, param2, param3Marshal, param3, param4Marshal, param4, "char", param5, "uint", param6, "ptr", param7, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
