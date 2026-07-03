#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PCI_ROOT_BUS_HARDWARE_CAPABILITY.ahk" { PCI_ROOT_BUS_HARDWARE_CAPABILITY }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_ROOT_BUS_CAPABILITY {
    value : IntPtr

    __value {
        set {
            if (value is PCI_ROOT_BUS_CAPABILITY) {
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
     * @param {Pointer<PCI_ROOT_BUS_HARDWARE_CAPABILITY>} HardwareCapability 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(_Context, HardwareCapability) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        DllCall(this.value, _ContextMarshal, _Context, PCI_ROOT_BUS_HARDWARE_CAPABILITY.Ptr, HardwareCapability)
    }

    /**
     * A PCI_ROOT_BUS_CAPABILITY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCI_ROOT_BUS_CAPABILITY {
        /**
         * Creates a PCI_ROOT_BUS_CAPABILITY pointer that invokes the given AHK function when called.
         * @param {Func("ptr", PCI_ROOT_BUS_HARDWARE_CAPABILITY) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", PCI_ROOT_BUS_HARDWARE_CAPABILITY.Ptr, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
