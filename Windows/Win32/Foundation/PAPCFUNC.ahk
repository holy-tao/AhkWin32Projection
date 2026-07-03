#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * An application-defined completion routine. Specify this address when calling the QueueUserAPC function.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/nc-winnt-papcfunc
 * @namespace Windows.Win32.Foundation
 */
export default struct PAPCFUNC {
    value : IntPtr

    __value {
        set {
            if (value is PAPCFUNC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} Parameter The data passed to the function using the <i>dwData</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-queueuserapc">QueueUserAPC</a> function.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(Parameter) {
        DllCall(this.value, IntPtr, Parameter)
    }

    /**
     * A PAPCFUNC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PAPCFUNC {
        /**
         * Creates a PAPCFUNC pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
