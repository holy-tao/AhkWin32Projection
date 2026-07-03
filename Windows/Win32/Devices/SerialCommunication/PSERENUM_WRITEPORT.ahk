#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.SerialCommunication
 */
export default struct PSERENUM_WRITEPORT {
    value : IntPtr

    __value {
        set {
            if (value is PSERENUM_WRITEPORT) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} SerPortAddress 
     * @param {Integer} Value 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(SerPortAddress, Value) {
        SerPortAddressMarshal := SerPortAddress is VarRef ? "ptr" : "ptr"

        DllCall(this.value, SerPortAddressMarshal, SerPortAddress, Int8, Value)
    }

    /**
     * A PSERENUM_WRITEPORT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PSERENUM_WRITEPORT {
        /**
         * Creates a PSERENUM_WRITEPORT pointer that invokes the given AHK function when called.
         * @param {Func("ptr", Int8) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", Int8, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
