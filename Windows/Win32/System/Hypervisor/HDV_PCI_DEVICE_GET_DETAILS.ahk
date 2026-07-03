#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\HDV_PCI_PNP_ID.ahk" { HDV_PCI_PNP_ID }

/**
 * HDV_PCI_DEVICE_GET_DETAILS
 * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/hdv/HdvPciDeviceGetDetails
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct HDV_PCI_DEVICE_GET_DETAILS {
    value : IntPtr

    __value {
        set {
            if (value is HDV_PCI_DEVICE_GET_DETAILS) {
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
     * @param {Pointer<HDV_PCI_PNP_ID>} pnpId 
     * @param {Integer} probedBarsCount 
     * @returns {Integer} 
     */
    Call(deviceContext, pnpId, probedBarsCount) {
        deviceContextMarshal := deviceContext is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, deviceContextMarshal, deviceContext, HDV_PCI_PNP_ID.Ptr, pnpId, UInt32, probedBarsCount, "uint*", &probedBars := 0, "HRESULT")
        return probedBars
    }

    /**
     * A HDV_PCI_DEVICE_GET_DETAILS that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends HDV_PCI_DEVICE_GET_DETAILS {
        /**
         * Creates a HDV_PCI_DEVICE_GET_DETAILS pointer that invokes the given AHK function when called.
         * @param {Func("ptr", HDV_PCI_PNP_ID, UInt32) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", HDV_PCI_PNP_ID.Ptr, UInt32, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
