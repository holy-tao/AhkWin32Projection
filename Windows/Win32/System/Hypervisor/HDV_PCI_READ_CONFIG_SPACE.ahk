#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * HDV_PCI_READ_CONFIG_SPACE
 * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/hdv/HdvPciReadConfigSpace
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct HDV_PCI_READ_CONFIG_SPACE {
    value : IntPtr

    __value {
        set {
            if (value is HDV_PCI_READ_CONFIG_SPACE) {
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
     * @param {Integer} offset 
     * @returns {Integer} 
     */
    Call(deviceContext, offset) {
        deviceContextMarshal := deviceContext is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, deviceContextMarshal, deviceContext, UInt32, offset, "uint*", &value := 0, "HRESULT")
        return value
    }

    /**
     * A HDV_PCI_READ_CONFIG_SPACE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends HDV_PCI_READ_CONFIG_SPACE {
        /**
         * Creates a HDV_PCI_READ_CONFIG_SPACE pointer that invokes the given AHK function when called.
         * @param {Func("ptr", UInt32) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", UInt32, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
