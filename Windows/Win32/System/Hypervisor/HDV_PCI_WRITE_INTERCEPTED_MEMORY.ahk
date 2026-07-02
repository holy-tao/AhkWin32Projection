#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HDV_PCI_BAR_SELECTOR.ahk" { HDV_PCI_BAR_SELECTOR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * HDV_PCI_WRITE_INTERCEPTED_MEMORY
 * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/hdv/HdvPciWriteInterceptedMemory
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct HDV_PCI_WRITE_INTERCEPTED_MEMORY {
    value : IntPtr

    __value {
        set {
            if (value is HDV_PCI_WRITE_INTERCEPTED_MEMORY) {
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
     * @param {Pointer<Integer>} value 
     * @returns {HRESULT} |Parameter|Description|
     * |---|---|---|---|---|---|---|---|
     * |`DeviceContext` |Context pointer that was supplied to HdvCreateDeviceInstance.|
     * |`BarIndex` |Index to the BAR the write operation pertains to.|
     * |`Offset` |Offset in bytes from the base of the BAR to write.|
     * |`Length` |Length in bytes to write (1 / 2 / 4 / 8 bytes).|
     * |`Value` |Value to write.|
     * |    |    |
     * 
     * 
     * |Return Value     |Description|
     * |---|---|
     * |`S_OK` | Returned if function succeeds.|
     * |`HRESULT` | An error code is returned if the function fails.
     * |     |     |
     */
    Call(deviceContext, barIndex, offset, length, value) {
        deviceContextMarshal := deviceContext is VarRef ? "ptr" : "ptr"
        valueMarshal := value is VarRef ? "char*" : "ptr"

        result := DllCall(this.value, deviceContextMarshal, deviceContext, HDV_PCI_BAR_SELECTOR, barIndex, Int64, offset, Int64, length, valueMarshal, value, "HRESULT")
        return result
    }

    /**
     * A HDV_PCI_WRITE_INTERCEPTED_MEMORY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends HDV_PCI_WRITE_INTERCEPTED_MEMORY {
        /**
         * Creates a HDV_PCI_WRITE_INTERCEPTED_MEMORY pointer that invokes the given AHK function when called.
         * @param {Func("ptr", HDV_PCI_BAR_SELECTOR, Int64, Int64, "char*") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", HDV_PCI_BAR_SELECTOR, Int64, Int64, "char*", "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
