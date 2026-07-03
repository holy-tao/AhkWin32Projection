#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Extends the timeout for a call to a resource type control code. The PEXTEND_RES_TYPE_CONTROL_CALL type defines a pointer to this function.
 * @see https://learn.microsoft.com/windows/win32/api/resapi/nc-resapi-pextend_res_type_control_call
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PEXTEND_RES_TYPE_CONTROL_CALL {
    value : IntPtr

    __value {
        set {
            if (value is PEXTEND_RES_TYPE_CONTROL_CALL) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} _context The context to the resource type control code that was called.
     * @param {Integer} newTimeoutInMs The new timeout, in milliseconds.
     * @returns {Integer} <b>ERROR_SUCCESS</b> if the operation is successful; otherwise, a system error code.
     */
    Call(_context, newTimeoutInMs) {
        result := DllCall(this.value, Int64, _context, UInt32, newTimeoutInMs, UInt32)
        return result
    }

    /**
     * A PEXTEND_RES_TYPE_CONTROL_CALL that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PEXTEND_RES_TYPE_CONTROL_CALL {
        /**
         * Creates a PEXTEND_RES_TYPE_CONTROL_CALL pointer that invokes the given AHK function when called.
         * @param {Func(Int64, UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [Int64, UInt32, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
