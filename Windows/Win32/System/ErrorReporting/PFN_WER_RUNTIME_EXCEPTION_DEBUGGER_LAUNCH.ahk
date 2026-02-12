#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * WER calls this function to let you customize the debugger launch options and launch string.
 * @remarks
 * You must implement this function in your exception handler DLL.
 * 
 * WER uses this function to determine which debugger to launch and  whether to launch the debugger automatically or ask the user before launching the debugger. Specifying a custom debugger will override the default launch string (the AeDebug registry key contains the default launch string).
 * 
 * WER calls this callback function only if you set the <i>pbOwnershipClaimed</i> parameter of your <a href="https://docs.microsoft.com/windows/desktop/api/werapi/nc-werapi-pfn_wer_runtime_exception_event">OutOfProcessExceptionEventCallback</a> callback function to <b>TRUE</b>.
 * @see https://learn.microsoft.com/windows/win32/api//content/werapi/nc-werapi-pfn_wer_runtime_exception_debugger_launch
 * @namespace Windows.Win32.System.ErrorReporting
 * @version v4.0.30319
 */
class PFN_WER_RUNTIME_EXCEPTION_DEBUGGER_LAUNCH extends IUnknown {

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
     * @param {Pointer<Void>} pContext 
     * @param {Pointer<WER_RUNTIME_EXCEPTION_INFORMATION>} pExceptionInformation 
     * @param {Pointer<BOOL>} pbIsCustomDebugger 
     * @param {PWSTR} pwszDebuggerLaunch 
     * @param {Pointer<Integer>} pchDebuggerLaunch 
     * @param {Pointer<BOOL>} pbIsDebuggerAutolaunch 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(pContext, pExceptionInformation, pbIsCustomDebugger, pwszDebuggerLaunch, pchDebuggerLaunch, pbIsDebuggerAutolaunch) {
        pwszDebuggerLaunch := pwszDebuggerLaunch is String ? StrPtr(pwszDebuggerLaunch) : pwszDebuggerLaunch

        pContextMarshal := pContext is VarRef ? "ptr" : "ptr"
        pbIsCustomDebuggerMarshal := pbIsCustomDebugger is VarRef ? "int*" : "ptr"
        pchDebuggerLaunchMarshal := pchDebuggerLaunch is VarRef ? "uint*" : "ptr"
        pbIsDebuggerAutolaunchMarshal := pbIsDebuggerAutolaunch is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, pContextMarshal, pContext, "ptr", pExceptionInformation, pbIsCustomDebuggerMarshal, pbIsCustomDebugger, "ptr", pwszDebuggerLaunch, pchDebuggerLaunchMarshal, pchDebuggerLaunch, pbIsDebuggerAutolaunchMarshal, pbIsDebuggerAutolaunch, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
