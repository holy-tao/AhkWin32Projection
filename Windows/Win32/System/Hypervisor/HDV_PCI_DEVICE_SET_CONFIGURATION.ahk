#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * HDV_PCI_DEVICE_SET_CONFIGURATION
 * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/hdv/HdvPciDeviceSetConfiguration
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct HDV_PCI_DEVICE_SET_CONFIGURATION {
    value : IntPtr

    __value {
        set {
            if (value is HDV_PCI_DEVICE_SET_CONFIGURATION) {
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
     * @param {Integer} configurationValueCount 
     * @param {Pointer<PWSTR>} configurationValues 
     * @returns {HRESULT} |Parameter|Description|
     * |---|---|---|---|---|---|---|---|
     * |`DeviceContext` |Context pointer that was supplied to HdvCreateDeviceInstance|
     * |`ConfigurationValueCount` |Number of elements in the ConfigurationValues array|
     * |`ConfigurationValues` |Array with strings representing the configurations values. These strings are provided in the VM's configuration.|
     * |    |    |
     * 
     * 
     * |Return Value     |Description|
     * |---|---|
     * |`S_OK` | Returned if function succeeds.|
     * |`HRESULT` | An error code is returned if the function fails.
     * |     |     |
     */
    Call(deviceContext, configurationValueCount, configurationValues) {
        deviceContextMarshal := deviceContext is VarRef ? "ptr" : "ptr"
        configurationValuesMarshal := configurationValues is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, deviceContextMarshal, deviceContext, UInt32, configurationValueCount, configurationValuesMarshal, configurationValues, "HRESULT")
        return result
    }

    /**
     * A HDV_PCI_DEVICE_SET_CONFIGURATION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends HDV_PCI_DEVICE_SET_CONFIGURATION {
        /**
         * Creates a HDV_PCI_DEVICE_SET_CONFIGURATION pointer that invokes the given AHK function when called.
         * @param {Func("ptr", UInt32, PWSTR) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", UInt32, PWSTR.Ptr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
