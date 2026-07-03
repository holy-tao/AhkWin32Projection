#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.AddressBook
 */
export default struct LPALLOCATEBUFFER {
    value : IntPtr

    __value {
        set {
            if (value is LPALLOCATEBUFFER) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} cbSize 
     * @param {Pointer<Pointer<Void>>} lppBuffer 
     * @returns {Integer} 
     */
    Call(cbSize, lppBuffer) {
        lppBufferMarshal := lppBuffer is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, UInt32, cbSize, lppBufferMarshal, lppBuffer, Int32)
        return result
    }

    /**
     * A LPALLOCATEBUFFER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPALLOCATEBUFFER {
        /**
         * Creates a LPALLOCATEBUFFER pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, "ptr*") => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, "ptr*", Int32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
