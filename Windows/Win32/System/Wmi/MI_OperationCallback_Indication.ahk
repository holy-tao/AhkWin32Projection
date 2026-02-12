#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class MI_OperationCallback_Indication extends IUnknown {

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
     * @param {Pointer<MI_Instance>} instance 
     * @param {Pointer<Integer>} bookmark 
     * @param {Pointer<Integer>} machineID 
     * @param {Integer} moreResults 
     * @param {Integer} resultCode 
     * @param {Pointer<Integer>} errorString 
     * @param {Pointer<MI_Instance>} errorDetails 
     * @param {Pointer} resultAcknowledgement 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(operation, callbackContext, instance, bookmark, machineID, moreResults, resultCode, errorString, errorDetails, resultAcknowledgement) {
        callbackContextMarshal := callbackContext is VarRef ? "ptr" : "ptr"
        bookmarkMarshal := bookmark is VarRef ? "ushort*" : "ptr"
        machineIDMarshal := machineID is VarRef ? "ushort*" : "ptr"
        errorStringMarshal := errorString is VarRef ? "ushort*" : "ptr"

        ComCall(3, this, "ptr", operation, callbackContextMarshal, callbackContext, "ptr", instance, bookmarkMarshal, bookmark, machineIDMarshal, machineID, "char", moreResults, "int", resultCode, errorStringMarshal, errorString, "ptr", errorDetails, "ptr", resultAcknowledgement)
    }
}
