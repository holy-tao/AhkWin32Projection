#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Mapi
 */
export default struct LPMAPILOGOFF {
    value : IntPtr

    __value {
        set {
            if (value is LPMAPILOGOFF) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} lhSession 
     * @param {Pointer} ulUIParam 
     * @param {Integer} flFlags 
     * @param {Integer} ulReserved 
     * @returns {Integer} 
     */
    Call(lhSession, ulUIParam, flFlags, ulReserved) {
        result := DllCall(this.value, IntPtr, lhSession, IntPtr, ulUIParam, UInt32, flFlags, UInt32, ulReserved, UInt32)
        return result
    }

    /**
     * A LPMAPILOGOFF that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPMAPILOGOFF {
        /**
         * Creates a LPMAPILOGOFF pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, IntPtr, UInt32, UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, IntPtr, UInt32, UInt32, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
