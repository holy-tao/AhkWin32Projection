#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.AddressBook
 */
export default struct LPALLOCATEMORE {
    value : IntPtr

    __value {
        set {
            if (value is LPALLOCATEMORE) {
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
     * @param {Pointer<Void>} lpObject 
     * @param {Pointer<Pointer<Void>>} lppBuffer 
     * @returns {Integer} 
     */
    Call(cbSize, lpObject, lppBuffer) {
        lpObjectMarshal := lpObject is VarRef ? "ptr" : "ptr"
        lppBufferMarshal := lppBuffer is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, UInt32, cbSize, lpObjectMarshal, lpObject, lppBufferMarshal, lppBuffer, Int32)
        return result
    }

    /**
     * A LPALLOCATEMORE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPALLOCATEMORE {
        /**
         * Creates a LPALLOCATEMORE pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, "ptr", "ptr*") => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, "ptr", "ptr*", Int32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
