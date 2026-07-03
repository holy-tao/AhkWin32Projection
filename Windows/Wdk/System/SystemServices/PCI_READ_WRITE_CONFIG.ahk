#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_READ_WRITE_CONFIG {
    value : IntPtr

    __value {
        set {
            if (value is PCI_READ_WRITE_CONFIG) {
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
     * @param {Integer} BusOffset 
     * @param {Integer} Slot 
     * @param {Integer} _Buffer 
     * @param {Integer} Offset 
     * @param {Integer} Length 
     * @returns {Integer} 
     */
    Call(_Context, BusOffset, Slot, _Buffer, Offset, Length) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, _ContextMarshal, _Context, UInt32, BusOffset, UInt32, Slot, IntPtr, _Buffer, UInt32, Offset, UInt32, Length, UInt32)
        return result
    }

    /**
     * A PCI_READ_WRITE_CONFIG that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCI_READ_WRITE_CONFIG {
        /**
         * Creates a PCI_READ_WRITE_CONFIG pointer that invokes the given AHK function when called.
         * @param {Func("ptr", UInt32, UInt32, IntPtr, UInt32, UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", UInt32, UInt32, IntPtr, UInt32, UInt32, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
