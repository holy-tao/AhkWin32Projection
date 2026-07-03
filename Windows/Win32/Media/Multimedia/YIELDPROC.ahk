#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Multimedia
 */
export default struct YIELDPROC {
    value : IntPtr

    __value {
        set {
            if (value is YIELDPROC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} mciId 
     * @param {Integer} dwYieldData 
     * @returns {Integer} 
     */
    Call(mciId, dwYieldData) {
        result := DllCall(this.value, UInt32, mciId, UInt32, dwYieldData, UInt32)
        return result
    }

    /**
     * A YIELDPROC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends YIELDPROC {
        /**
         * Creates a YIELDPROC pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, UInt32, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
