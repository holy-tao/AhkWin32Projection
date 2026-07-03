#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct SET_VIRTUAL_DEVICE_DATA {
    value : IntPtr

    __value {
        set {
            if (value is SET_VIRTUAL_DEVICE_DATA) {
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
     * @param {Integer} VirtualFunction 
     * @param {Integer} _Buffer 
     * @param {Integer} Offset 
     * @param {Integer} Length 
     * @returns {Integer} 
     */
    Call(_Context, VirtualFunction, _Buffer, Offset, Length) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, _ContextMarshal, _Context, UInt16, VirtualFunction, IntPtr, _Buffer, UInt32, Offset, UInt32, Length, UInt32)
        return result
    }

    /**
     * A SET_VIRTUAL_DEVICE_DATA that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SET_VIRTUAL_DEVICE_DATA {
        /**
         * Creates a SET_VIRTUAL_DEVICE_DATA pointer that invokes the given AHK function when called.
         * @param {Func("ptr", UInt16, IntPtr, UInt32, UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", UInt16, IntPtr, UInt32, UInt32, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
