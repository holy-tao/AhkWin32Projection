#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class PLSA_GET_APP_MODE_INFO extends IUnknown {

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
     * @param {Pointer<Integer>} UserFunction 
     * @param {Pointer<Pointer>} Argument1 
     * @param {Pointer<Pointer>} Argument2 
     * @param {Pointer<SecBuffer>} UserData_ 
     * @param {Pointer<BOOLEAN>} ReturnToLsa 
     * @returns {NTSTATUS} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(UserFunction, Argument1, Argument2, UserData_, ReturnToLsa) {
        UserFunctionMarshal := UserFunction is VarRef ? "uint*" : "ptr"
        Argument1Marshal := Argument1 is VarRef ? "ptr*" : "ptr"
        Argument2Marshal := Argument2 is VarRef ? "ptr*" : "ptr"
        ReturnToLsaMarshal := ReturnToLsa is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, UserFunctionMarshal, UserFunction, Argument1Marshal, Argument1, Argument2Marshal, Argument2, "ptr", UserData_, ReturnToLsaMarshal, ReturnToLsa, "int")
        return result
    }
}
