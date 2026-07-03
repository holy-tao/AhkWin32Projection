#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Multimedia
 */
export default struct DRIVERMSGPROC {
    value : IntPtr

    __value {
        set {
            if (value is DRIVERMSGPROC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {Integer} param1 
     * @param {Pointer} param2 
     * @param {Pointer} param3 
     * @param {Pointer} param4 
     * @returns {Integer} 
     */
    Call(param0, param1, param2, param3, param4) {
        result := DllCall(this.value, UInt32, param0, UInt32, param1, IntPtr, param2, IntPtr, param3, IntPtr, param4, UInt32)
        return result
    }

    /**
     * A DRIVERMSGPROC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends DRIVERMSGPROC {
        /**
         * Creates a DRIVERMSGPROC pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, UInt32, IntPtr, IntPtr, IntPtr) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, UInt32, IntPtr, IntPtr, IntPtr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
