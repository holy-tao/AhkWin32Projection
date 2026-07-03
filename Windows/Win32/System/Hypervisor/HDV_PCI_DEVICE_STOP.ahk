#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * HDV_PCI_DEVICE_STOP
 * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/hdv/HdvPciDeviceStop
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct HDV_PCI_DEVICE_STOP {
    value : IntPtr

    __value {
        set {
            if (value is HDV_PCI_DEVICE_STOP) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} deviceContext 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(deviceContext) {
        deviceContextMarshal := deviceContext is VarRef ? "ptr" : "ptr"

        DllCall(this.value, deviceContextMarshal, deviceContext)
    }

    /**
     * A HDV_PCI_DEVICE_STOP that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends HDV_PCI_DEVICE_STOP {
        /**
         * Creates a HDV_PCI_DEVICE_STOP pointer that invokes the given AHK function when called.
         * @param {Func("ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
