#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.System.AddressBook
 */
export default struct PFNIDLE {
    value : IntPtr

    __value {
        set {
            if (value is PFNIDLE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} param0 
     * @returns {BOOL} 
     */
    Call(param0) {
        param0Marshal := param0 is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, param0Marshal, param0, BOOL)
        return result
    }

    /**
     * A PFNIDLE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFNIDLE {
        /**
         * Creates a PFNIDLE pointer that invokes the given AHK function when called.
         * @param {Func("ptr") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
