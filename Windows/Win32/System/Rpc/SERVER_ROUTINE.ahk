#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct SERVER_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is SERVER_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @returns {Integer} 
     */
    Call() {
        result := DllCall(this.value, Int32)
        return result
    }

    /**
     * A SERVER_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SERVER_ROUTINE {
        /**
         * Creates a SERVER_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func() => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 0)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 0 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [Int32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
