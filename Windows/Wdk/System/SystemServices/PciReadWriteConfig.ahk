#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PCI_SLOT_NUMBER.ahk" { PCI_SLOT_NUMBER }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PciReadWriteConfig {
    value : IntPtr

    __value {
        set {
            if (value is PciReadWriteConfig) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Pointer>} BusHandler 
     * @param {PCI_SLOT_NUMBER} Slot 
     * @param {Integer} _Buffer 
     * @param {Integer} Offset 
     * @param {Integer} Length 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(BusHandler, Slot, _Buffer, Offset, Length) {
        BusHandlerMarshal := BusHandler is VarRef ? "ptr*" : "ptr"

        DllCall(this.value, BusHandlerMarshal, BusHandler, PCI_SLOT_NUMBER, Slot, IntPtr, _Buffer, UInt32, Offset, UInt32, Length)
    }

    /**
     * A PciReadWriteConfig that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PciReadWriteConfig {
        /**
         * Creates a PciReadWriteConfig pointer that invokes the given AHK function when called.
         * @param {Func("ptr*", PCI_SLOT_NUMBER, IntPtr, UInt32, UInt32) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr*", PCI_SLOT_NUMBER, IntPtr, UInt32, UInt32, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
