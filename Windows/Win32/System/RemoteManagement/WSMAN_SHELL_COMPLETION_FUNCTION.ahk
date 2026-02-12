#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The callback function that is called for shell operations, which result in a remote request.
 * @see https://learn.microsoft.com/windows/win32/api//content/wsman/nc-wsman-wsman_shell_completion_function
 * @namespace Windows.Win32.System.RemoteManagement
 * @version v4.0.30319
 */
class WSMAN_SHELL_COMPLETION_FUNCTION extends IUnknown {

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
     * @param {Pointer<Void>} operationContext 
     * @param {Integer} flags 
     * @param {Pointer<WSMAN_ERROR>} error 
     * @param {WSMAN_SHELL_HANDLE} shell_ 
     * @param {WSMAN_COMMAND_HANDLE} command 
     * @param {WSMAN_OPERATION_HANDLE} operationHandle 
     * @param {Pointer<WSMAN_RESPONSE_DATA>} data 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(operationContext, flags, error, shell_, command, operationHandle, data) {
        shell_ := shell_ is Win32Handle ? NumGet(shell_, "ptr") : shell_
        command := command is Win32Handle ? NumGet(command, "ptr") : command
        operationHandle := operationHandle is Win32Handle ? NumGet(operationHandle, "ptr") : operationHandle

        operationContextMarshal := operationContext is VarRef ? "ptr" : "ptr"

        ComCall(3, this, operationContextMarshal, operationContext, "uint", flags, "ptr", error, "ptr", shell_, "ptr", command, "ptr", operationHandle, "ptr", data)
    }
}
