#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class PTM_RM_NOTIFICATION extends IUnknown {

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
     * @param {Pointer<KENLISTMENT>} EnlistmentObject 
     * @param {Pointer<Void>} RMContext 
     * @param {Pointer<Void>} TransactionContext_ 
     * @param {Integer} TransactionNotification 
     * @param {Pointer<Integer>} TmVirtualClock 
     * @param {Integer} ArgumentLength 
     * @param {Pointer<Void>} Argument 
     * @returns {NTSTATUS} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(EnlistmentObject, RMContext, TransactionContext_, TransactionNotification, TmVirtualClock, ArgumentLength, Argument) {
        RMContextMarshal := RMContext is VarRef ? "ptr" : "ptr"
        TransactionContext_Marshal := TransactionContext_ is VarRef ? "ptr" : "ptr"
        TmVirtualClockMarshal := TmVirtualClock is VarRef ? "int64*" : "ptr"
        ArgumentMarshal := Argument is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ptr", EnlistmentObject, RMContextMarshal, RMContext, TransactionContext_Marshal, TransactionContext_, "uint", TransactionNotification, TmVirtualClockMarshal, TmVirtualClock, "uint", ArgumentLength, ArgumentMarshal, Argument, "int")
        return result
    }
}
