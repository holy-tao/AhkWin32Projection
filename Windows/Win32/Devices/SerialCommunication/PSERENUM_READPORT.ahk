#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.SerialCommunication
 */
export default struct PSERENUM_READPORT {
    value : IntPtr

    __value {
        set {
            if (value is PSERENUM_READPORT) {
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
     * @returns {Integer} 
     */
    Call(SerPortAddress) {
        SerPortAddressMarshal := SerPortAddress is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, SerPortAddressMarshal, SerPortAddress, Int8)
        return result
    }

    /**
     * A PSERENUM_READPORT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PSERENUM_READPORT {
        /**
         * Creates a PSERENUM_READPORT pointer that invokes the given AHK function when called.
         * @param {Func("ptr") => Int8} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", Int8])
        }

        __Delete() => CallbackFree(this.value)
    }
}
