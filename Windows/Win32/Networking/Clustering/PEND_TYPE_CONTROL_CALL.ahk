#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PEND_TYPE_CONTROL_CALL {
    value : IntPtr

    __value {
        set {
            if (value is PEND_TYPE_CONTROL_CALL) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} _context 
     * @param {Integer} _status 
     * @returns {Integer} 
     */
    Call(_context, _status) {
        result := DllCall(this.value, Int64, _context, UInt32, _status, UInt32)
        return result
    }

    /**
     * A PEND_TYPE_CONTROL_CALL that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PEND_TYPE_CONTROL_CALL {
        /**
         * Creates a PEND_TYPE_CONTROL_CALL pointer that invokes the given AHK function when called.
         * @param {Func(Int64, UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [Int64, UInt32, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
