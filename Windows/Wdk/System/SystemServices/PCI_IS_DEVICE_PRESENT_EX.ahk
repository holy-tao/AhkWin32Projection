#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PCI_DEVICE_PRESENCE_PARAMETERS.ahk" { PCI_DEVICE_PRESENCE_PARAMETERS }
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_IS_DEVICE_PRESENT_EX {
    value : IntPtr

    __value {
        set {
            if (value is PCI_IS_DEVICE_PRESENT_EX) {
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
     * @param {Pointer<PCI_DEVICE_PRESENCE_PARAMETERS>} Parameters 
     * @returns {BOOLEAN} 
     */
    Call(_Context, Parameters) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, _ContextMarshal, _Context, PCI_DEVICE_PRESENCE_PARAMETERS.Ptr, Parameters, BOOLEAN)
        return result
    }

    /**
     * A PCI_IS_DEVICE_PRESENT_EX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCI_IS_DEVICE_PRESENT_EX {
        /**
         * Creates a PCI_IS_DEVICE_PRESENT_EX pointer that invokes the given AHK function when called.
         * @param {Func("ptr", PCI_DEVICE_PRESENCE_PARAMETERS) => BOOLEAN} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", PCI_DEVICE_PRESENCE_PARAMETERS.Ptr, BOOLEAN])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
