#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\EXCEPTION_POINTERS.ahk" { EXCEPTION_POINTERS }

/**
 * An application-defined function that serves as a vectored exception handler.
 * @remarks
 * The handler should not call functions that acquire synchronization objects or allocate memory, because this can cause problems. Typically, the handler will simply access the exception record and return.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/nc-winnt-pvectored_exception_handler
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct PVECTORED_EXCEPTION_HANDLER {
    value : IntPtr

    __value {
        set {
            if (value is PVECTORED_EXCEPTION_HANDLER) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<EXCEPTION_POINTERS>} ExceptionInfo A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-exception_pointers">EXCEPTION_POINTERS</a> structure that receives the exception record.
     * @returns {Integer} To return control to the point at which the exception occurred, return EXCEPTION_CONTINUE_EXECUTION (0xffffffff). To continue the handler search, return EXCEPTION_CONTINUE_SEARCH (0x0).
     */
    Call(ExceptionInfo) {
        result := DllCall(this.value, EXCEPTION_POINTERS.Ptr, ExceptionInfo, Int32)
        return result
    }

    /**
     * A PVECTORED_EXCEPTION_HANDLER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PVECTORED_EXCEPTION_HANDLER {
        /**
         * Creates a PVECTORED_EXCEPTION_HANDLER pointer that invokes the given AHK function when called.
         * @param {Func(EXCEPTION_POINTERS) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [EXCEPTION_POINTERS.Ptr, Int32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
