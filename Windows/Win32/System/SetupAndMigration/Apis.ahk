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
     * 
     * @param {Pointer<BOOL>} isOOBEComplete 
     * @returns {BOOL} 
     */
    static OOBEComplete(isOOBEComplete) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\OOBEComplete", "ptr", isOOBEComplete, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Registers a callback to be called once OOBE (Windows Welcome) has been completed.
     * @param {Pointer<OOBE_COMPLETED_CALLBACK>} OOBECompletedCallback Pointer to an application-defined callback function that will be called upon completion of OOBE. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oobenotification/nc-oobenotification-oobe_completed_callback">OOBE_COMPLETED_CALLBACK</a>.
     * @param {Pointer<Void>} CallbackContext Pointer to the callback context. This value will be passed to the function specified by <i>OOBECompletedCallback</i>. This value can be <b>nulll</b>.
     * @param {Pointer<Void>} WaitHandle Pointer to a variable that will receive the handle to the wait callback registration.
     * @returns {BOOL} <b>TRUE</b> if the routine successfully registered the callback. Otherwise, <b>FALSE</b> is returned. If <b>FALSE</b>, <a href="/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> will retrieve extended error information.
     * @see https://docs.microsoft.com/windows/win32/api//oobenotification/nf-oobenotification-registerwaituntiloobecompleted
     */
    static RegisterWaitUntilOOBECompleted(OOBECompletedCallback, CallbackContext, WaitHandle) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\RegisterWaitUntilOOBECompleted", "ptr", OOBECompletedCallback, "ptr", CallbackContext, "ptr", WaitHandle, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Unregisters the callback previously registered via RegisterWaitUntilOOBECompleted.
     * @param {Pointer<Void>} WaitHandle Handle to be unregistered.
     * @returns {BOOL} <b>TRUE</b> if the callback was successfully unregistered. Otherwise, <b>FALSE</b> is returned. If <b>FALSE</b>, <a href="/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> will retrieve extended error information.
     * @see https://docs.microsoft.com/windows/win32/api//oobenotification/nf-oobenotification-unregisterwaituntiloobecompleted
     */
    static UnregisterWaitUntilOOBECompleted(WaitHandle) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\UnregisterWaitUntilOOBECompleted", "ptr", WaitHandle, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

;@endregion Methods
}
