#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * HDV_PCI_DEVICE_INITIALIZE
 * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/hdv/HdvPciDeviceInitialize
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct HDV_PCI_DEVICE_INITIALIZE {
    value : IntPtr

    __value {
        set {
            if (value is HDV_PCI_DEVICE_INITIALIZE) {
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
     * @returns {HRESULT} |Parameter|Description|
     * |---|---|---|---|---|---|---|---|
     * |`DeviceContext` |Context pointer that was supplied to HdvCreateDeviceInstance|
     * |    |    |
     * 
     * 
     * |Return Value     |Description|
     * |---|---|
     * |`S_OK` | Returned if function succeeds.|
     * |`HRESULT` | An error code is returned if the function fails.
     * |     |     |
     */
    Call(deviceContext) {
        deviceContextMarshal := deviceContext is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, deviceContextMarshal, deviceContext, "HRESULT")
        return result
    }

    /**
     * A HDV_PCI_DEVICE_INITIALIZE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends HDV_PCI_DEVICE_INITIALIZE {
        /**
         * Creates a HDV_PCI_DEVICE_INITIALIZE pointer that invokes the given AHK function when called.
         * @param {Func("ptr") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
