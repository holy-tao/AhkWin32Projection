#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PCI_COMMON_CONFIG.ahk" { PCI_COMMON_CONFIG }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_LINE_TO_PIN {
    value : IntPtr

    __value {
        set {
            if (value is PCI_LINE_TO_PIN) {
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
     * @param {Pointer<PCI_COMMON_CONFIG>} PciNewData 
     * @param {Pointer<PCI_COMMON_CONFIG>} PciOldData 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(_Context, PciNewData, PciOldData) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        DllCall(this.value, _ContextMarshal, _Context, PCI_COMMON_CONFIG.Ptr, PciNewData, PCI_COMMON_CONFIG.Ptr, PciOldData)
    }

    /**
     * A PCI_LINE_TO_PIN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCI_LINE_TO_PIN {
        /**
         * Creates a PCI_LINE_TO_PIN pointer that invokes the given AHK function when called.
         * @param {Func("ptr", PCI_COMMON_CONFIG, PCI_COMMON_CONFIG) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", PCI_COMMON_CONFIG.Ptr, PCI_COMMON_CONFIG.Ptr, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
