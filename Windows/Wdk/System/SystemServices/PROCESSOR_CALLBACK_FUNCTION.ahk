#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class PROCESSOR_CALLBACK_FUNCTION extends IUnknown {

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
     * @param {Pointer<Void>} CallbackContext 
     * @param {Pointer<KE_PROCESSOR_CHANGE_NOTIFY_CONTEXT>} ChangeContext 
     * @param {Pointer<Integer>} OperationStatus 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(CallbackContext, ChangeContext, OperationStatus) {
        CallbackContextMarshal := CallbackContext is VarRef ? "ptr" : "ptr"
        OperationStatusMarshal := OperationStatus is VarRef ? "int*" : "ptr"

        ComCall(3, this, CallbackContextMarshal, CallbackContext, "ptr", ChangeContext, OperationStatusMarshal, OperationStatus)
    }
}
