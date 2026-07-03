#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct SORTCOMP {
    value : IntPtr

    __value {
        set {
            if (value is SORTCOMP) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} pv1 
     * @param {Pointer<Void>} pv2 
     * @returns {Integer} 
     */
    Call(pv1, pv2) {
        pv1Marshal := pv1 is VarRef ? "ptr" : "ptr"
        pv2Marshal := pv2 is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, pv1Marshal, pv1, pv2Marshal, pv2, Int32)
        return result
    }

    /**
     * A SORTCOMP that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SORTCOMP {
        /**
         * Creates a SORTCOMP pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "ptr") => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, "cdecl", ["ptr", "ptr", Int32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
