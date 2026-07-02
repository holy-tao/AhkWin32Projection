#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HDV_PCI_BAR_SELECTOR.ahk" { HDV_PCI_BAR_SELECTOR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * HDV_PCI_READ_INTERCEPTED_MEMORY
 * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/hdv/HdvPciReadInterceptedMemory
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct HDV_PCI_READ_INTERCEPTED_MEMORY {
    value : IntPtr

    __value {
        set {
            if (value is HDV_PCI_READ_INTERCEPTED_MEMORY) {
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
     * @param {HDV_PCI_BAR_SELECTOR} barIndex 
     * @param {Integer} offset 
     * @param {Integer} length 
     * @returns {Integer} 
     */
    Call(deviceContext, barIndex, offset, length) {
        deviceContextMarshal := deviceContext is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, deviceContextMarshal, deviceContext, HDV_PCI_BAR_SELECTOR, barIndex, Int64, offset, Int64, length, "char*", &value := 0, "HRESULT")
        return value
    }

    /**
     * A HDV_PCI_READ_INTERCEPTED_MEMORY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends HDV_PCI_READ_INTERCEPTED_MEMORY {
        /**
         * Creates a HDV_PCI_READ_INTERCEPTED_MEMORY pointer that invokes the given AHK function when called.
         * @param {Func("ptr", HDV_PCI_BAR_SELECTOR, Int64, Int64) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", HDV_PCI_BAR_SELECTOR, Int64, Int64, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
