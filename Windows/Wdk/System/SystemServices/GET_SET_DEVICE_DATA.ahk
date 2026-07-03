#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct GET_SET_DEVICE_DATA {
    value : IntPtr

    __value {
        set {
            if (value is GET_SET_DEVICE_DATA) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} _Context 
     * @param {Integer} DataType 
     * @param {Integer} _Buffer 
     * @param {Integer} Offset 
     * @param {Integer} Length 
     * @returns {Integer} 
     */
    Call(_Context, DataType, _Buffer, Offset, Length) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, _ContextMarshal, _Context, UInt32, DataType, IntPtr, _Buffer, UInt32, Offset, UInt32, Length, UInt32)
        return result
    }

    /**
     * A GET_SET_DEVICE_DATA that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends GET_SET_DEVICE_DATA {
        /**
         * Creates a GET_SET_DEVICE_DATA pointer that invokes the given AHK function when called.
         * @param {Func("ptr", UInt32, IntPtr, UInt32, UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", UInt32, IntPtr, UInt32, UInt32, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
