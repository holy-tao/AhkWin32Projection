#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * Called by GINA to specify the context pointer passed by Winlogon as the first parameter to all future calls to GINA functions.
 * @remarks
 * If the GINA must call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nc-winwlx-pwlx_sas_notify">WlxSasNotify</a> from the <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nf-winwlx-wlxinitialize">WlxInitialize</a> function, it should first call <b>WlxSetContextPointer</b> to let Winlogon associate a context with the GINA.
 * @see https://learn.microsoft.com/windows/win32/api/winwlx/nc-winwlx-pwlx_set_context_pointer
 * @namespace Windows.Win32.Security.WinWlx
 */
export default struct PWLX_SET_CONTEXT_POINTER {
    value : IntPtr

    __value {
        set {
            if (value is PWLX_SET_CONTEXT_POINTER) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} hWlx Specifies the Winlogon handle passed to GINA in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nf-winwlx-wlxinitialize">WlxInitialize</a> call.
     * @param {Pointer<Void>} pWlxContext Pointer to the new context that Winlogon will use in future calls to GINA.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(hWlx, pWlxContext) {
        pWlxContextMarshal := pWlxContext is VarRef ? "ptr" : "ptr"

        DllCall(this.value, HANDLE, hWlx, pWlxContextMarshal, pWlxContext)
    }

    /**
     * A PWLX_SET_CONTEXT_POINTER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PWLX_SET_CONTEXT_POINTER {
        /**
         * Creates a PWLX_SET_CONTEXT_POINTER pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, "ptr", IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
