#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PEX_TIMER.ahk" { PEX_TIMER }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct EXT_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is EXT_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PEX_TIMER} Timer 
     * @param {Pointer<Void>} _Context 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(Timer, _Context) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        DllCall(this.value, PEX_TIMER, Timer, _ContextMarshal, _Context)
    }

    /**
     * A EXT_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends EXT_CALLBACK {
        /**
         * Creates a EXT_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(PEX_TIMER, "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PEX_TIMER, "ptr", IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
