#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct PAPPCONSTRAIN_CHANGE_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is PAPPCONSTRAIN_CHANGE_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {BOOLEAN} Constrained 
     * @param {Pointer<Void>} _Context 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(Constrained, _Context) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        DllCall(this.value, BOOLEAN, Constrained, _ContextMarshal, _Context)
    }

    /**
     * A PAPPCONSTRAIN_CHANGE_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PAPPCONSTRAIN_CHANGE_ROUTINE {
        /**
         * Creates a PAPPCONSTRAIN_CHANGE_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func(BOOLEAN, "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [BOOLEAN, "ptr", IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
