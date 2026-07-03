#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\KEVENT.ahk" { KEVENT }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct PFSRTL_STACK_OVERFLOW_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is PFSRTL_STACK_OVERFLOW_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} _Context 
     * @param {Pointer<KEVENT>} Event 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(_Context, Event) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        DllCall(this.value, _ContextMarshal, _Context, KEVENT.Ptr, Event)
    }

    /**
     * A PFSRTL_STACK_OVERFLOW_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFSRTL_STACK_OVERFLOW_ROUTINE {
        /**
         * Creates a PFSRTL_STACK_OVERFLOW_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func("ptr", KEVENT) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", KEVENT.Ptr, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
