#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * An application-defined function. If the FLS slot is in use, FlsCallback is called on fiber deletion, thread exit, and when an FLS index is freed.
 * @remarks
 * Each FLS index has an associated 
 * <b>FlsCallback</b> function. The callback function can be used for any purpose, but it is intended to be used primarily to free memory.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/nc-winnt-pfls_callback_function
 * @namespace Windows.Win32.System.Threading
 */
export default struct PFLS_CALLBACK_FUNCTION {
    value : IntPtr

    __value {
        set {
            if (value is PFLS_CALLBACK_FUNCTION) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} lpFlsData The value stored in the FLS slot for the calling fiber.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(lpFlsData) {
        lpFlsDataMarshal := lpFlsData is VarRef ? "ptr" : "ptr"

        DllCall(this.value, lpFlsDataMarshal, lpFlsData)
    }

    /**
     * A PFLS_CALLBACK_FUNCTION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFLS_CALLBACK_FUNCTION {
        /**
         * Creates a PFLS_CALLBACK_FUNCTION pointer that invokes the given AHK function when called.
         * @param {Func("ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
