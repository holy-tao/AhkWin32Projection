#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PCI_COMMON_CONFIG.ahk" { PCI_COMMON_CONFIG }
#Import ".\PCI_SLOT_NUMBER.ahk" { PCI_SLOT_NUMBER }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PciPin2Line {
    value : IntPtr

    __value {
        set {
            if (value is PciPin2Line) {
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
     * @param {Pointer<Pointer>} RootHandler 
     * @param {PCI_SLOT_NUMBER} SlotNumber 
     * @param {Pointer<PCI_COMMON_CONFIG>} PciData 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(BusHandler, RootHandler, SlotNumber, PciData) {
        BusHandlerMarshal := BusHandler is VarRef ? "ptr*" : "ptr"
        RootHandlerMarshal := RootHandler is VarRef ? "ptr*" : "ptr"

        DllCall(this.value, BusHandlerMarshal, BusHandler, RootHandlerMarshal, RootHandler, PCI_SLOT_NUMBER, SlotNumber, PCI_COMMON_CONFIG.Ptr, PciData)
    }

    /**
     * A PciPin2Line that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PciPin2Line {
        /**
         * Creates a PciPin2Line pointer that invokes the given AHK function when called.
         * @param {Func("ptr*", "ptr*", PCI_SLOT_NUMBER, PCI_COMMON_CONFIG) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr*", "ptr*", PCI_SLOT_NUMBER, PCI_COMMON_CONFIG.Ptr, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
