#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PRJ_CALLBACK_DATA.ahk" { PRJ_CALLBACK_DATA }

/**
 * Notifies the provider that an operation by an earlier invocation of a callback should be canceled.
 * @remarks
 * Every invocation of a provider callback has a <i>callbackData</i> parameter with a <b>CommandId</b> field. If a provider supplies an implementation of this callback, it should keep track of the <b>CommandId</b> values of callbacks that it processes asynchronously, i.e. callbacks from which it has returned <b>HRESULT_FROM_WIN32(ERROR_IO_PENDING)</b> but not yet completed by calling <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nf-projectedfslib-prjcompletecommand">PrjCompleteCommand</a>. If the provider receives this callback, it indicates that the I/O that caused the earlier callback to be invoked was canceled, either explicitly or because the thread it was issued on terminated. The provider should cancel processing the callback invocation identified by <b>CommandId</b> as soon as possible. 
 * 
 * 
 * Calling <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nf-projectedfslib-prjcompletecommand">PrjCompleteCommand</a> for the <b>CommandId</b> in this callback's callbackData is not an error, however it is a no-op because the I/O that caused the callback invocation identified by <b>CommandId</b> has already ended. 
 * 
 * 
 * ProjFS will invoke <i>PRJ_CANCEL_COMMAND_CB</i> for a given <b>CommandId</b> only after the callback to be canceled is invoked. However if the provider is configured to allow more than one concurrently running worker thread, the cancellation and original invocation may run concurrently. The provider must be able to handle this situation.
 * 
 *  
 * This callback is optional. If the provider does not supply an implementation of this callback, none of the other callbacks will be cancellable. The provider will process all callbacks synchronously.
 * @see https://learn.microsoft.com/windows/win32/api/projectedfslib/nc-projectedfslib-prj_cancel_command_cb
 * @namespace Windows.Win32.Storage.ProjectedFileSystem
 */
export default struct PRJ_CANCEL_COMMAND_CB {
    value : IntPtr

    __value {
        set {
            if (value is PRJ_CANCEL_COMMAND_CB) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<PRJ_CALLBACK_DATA>} callbackData Information about the operation. The following <i>callbackData</i> members are necessary to implement this callback:<dl>
     * <dd><b>CommandId</b> Identifies the operation to be cancelled.
     * 
     * </dd>
     * </dl>
     * @returns {String} Nothing - always returns an empty string
     */
    Call(callbackData) {
        DllCall(this.value, PRJ_CALLBACK_DATA.Ptr, callbackData)
    }

    /**
     * A PRJ_CANCEL_COMMAND_CB that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PRJ_CANCEL_COMMAND_CB {
        /**
         * Creates a PRJ_CANCEL_COMMAND_CB pointer that invokes the given AHK function when called.
         * @param {Func(PRJ_CALLBACK_DATA) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PRJ_CALLBACK_DATA.Ptr, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
