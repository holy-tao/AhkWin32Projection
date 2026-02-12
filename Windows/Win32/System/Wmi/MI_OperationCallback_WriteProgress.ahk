#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class MI_OperationCallback_WriteProgress extends IUnknown {

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
     * @param {Pointer<MI_Operation>} operation 
     * @param {Pointer<Void>} callbackContext 
     * @param {Pointer<Integer>} activity 
     * @param {Pointer<Integer>} currentOperation 
     * @param {Pointer<Integer>} statusDescription 
     * @param {Integer} percentageComplete 
     * @param {Integer} secondsRemaining 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(operation, callbackContext, activity, currentOperation, statusDescription, percentageComplete, secondsRemaining) {
        callbackContextMarshal := callbackContext is VarRef ? "ptr" : "ptr"
        activityMarshal := activity is VarRef ? "ushort*" : "ptr"
        currentOperationMarshal := currentOperation is VarRef ? "ushort*" : "ptr"
        statusDescriptionMarshal := statusDescription is VarRef ? "ushort*" : "ptr"

        ComCall(3, this, "ptr", operation, callbackContextMarshal, callbackContext, activityMarshal, activity, currentOperationMarshal, currentOperation, statusDescriptionMarshal, statusDescription, "uint", percentageComplete, "uint", secondsRemaining)
    }
}
