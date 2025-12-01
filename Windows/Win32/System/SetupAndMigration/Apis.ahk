#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk

/**
 * @namespace Windows.Win32.System.SetupAndMigration
 * @version v4.0.30319
 */
class SetupAndMigration {

;@region Constants
;@endregion Constants

;@region Methods
    /**
     * Determines whether OOBE (Windows Welcome) has been completed.
     * @param {Pointer<BOOL>} isOOBEComplete Pointer to a variable that will receive the completion of OOBE upon success.
     * @returns {BOOL} <b>TRUE</b> if the OOBE completion state was successfully set. Otherwise, 
     *       <b>FALSE</b> if OOBE completion state was not set. If <b>FALSE</b>, 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> will retrieve extended error 
     *       information.
     * @see https://learn.microsoft.com/windows/win32/api/oobenotification/nf-oobenotification-oobecomplete
     */
    static OOBEComplete(isOOBEComplete) {
        isOOBECompleteMarshal := isOOBEComplete is VarRef ? "int*" : "ptr"

        A_LastError := 0

        result := DllCall("KERNEL32.dll\OOBEComplete", isOOBECompleteMarshal, isOOBEComplete, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Registers a callback to be called once OOBE (Windows Welcome) has been completed.
     * @remarks
     * If <b>RegisterWaitUntilOOBECompleted</b> returns <b>FALSE</b>, and a subsequent call to <a href="https://docs.microsoft.com/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns a value of <b>ERROR_INVALID_STATE</b>, this indicates that OOBE is already complete and there is no need to register for OOBE completion.
     * @param {Pointer<OOBE_COMPLETED_CALLBACK>} OOBECompletedCallback Pointer to an application-defined callback function that will be called upon completion of OOBE. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oobenotification/nc-oobenotification-oobe_completed_callback">OOBE_COMPLETED_CALLBACK</a>.
     * @param {Pointer<Void>} CallbackContext Pointer to the callback context. This value will be passed to the function specified by <i>OOBECompletedCallback</i>. This value can be <b>null</b>.
     * @param {Pointer<Pointer<Void>>} WaitHandle Pointer to a variable that will receive the handle to the wait callback registration.
     * @returns {BOOL} <b>TRUE</b> if the routine successfully registered the callback. Otherwise, <b>FALSE</b> is returned. If <b>FALSE</b>, <a href="https://docs.microsoft.com/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> will retrieve extended error information.
     * @see https://learn.microsoft.com/windows/win32/api/oobenotification/nf-oobenotification-registerwaituntiloobecompleted
     */
    static RegisterWaitUntilOOBECompleted(OOBECompletedCallback, CallbackContext, WaitHandle) {
        CallbackContextMarshal := CallbackContext is VarRef ? "ptr" : "ptr"
        WaitHandleMarshal := WaitHandle is VarRef ? "ptr*" : "ptr"

        A_LastError := 0

        result := DllCall("KERNEL32.dll\RegisterWaitUntilOOBECompleted", "ptr", OOBECompletedCallback, CallbackContextMarshal, CallbackContext, WaitHandleMarshal, WaitHandle, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Unregisters the callback previously registered via RegisterWaitUntilOOBECompleted.
     * @param {Pointer<Void>} WaitHandle Handle to be unregistered.
     * @returns {BOOL} <b>TRUE</b> if the callback was successfully unregistered. Otherwise, <b>FALSE</b> is returned. If <b>FALSE</b>, <a href="https://docs.microsoft.com/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> will retrieve extended error information.
     * @see https://learn.microsoft.com/windows/win32/api/oobenotification/nf-oobenotification-unregisterwaituntiloobecompleted
     */
    static UnregisterWaitUntilOOBECompleted(WaitHandle) {
        WaitHandleMarshal := WaitHandle is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("KERNEL32.dll\UnregisterWaitUntilOOBECompleted", WaitHandleMarshal, WaitHandle, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

;@endregion Methods
}
