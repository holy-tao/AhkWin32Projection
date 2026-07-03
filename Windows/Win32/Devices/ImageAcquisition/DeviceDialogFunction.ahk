#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DEVICEDIALOGDATA.ahk" { DEVICEDIALOGDATA }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Devices.ImageAcquisition
 */
export default struct DeviceDialogFunction {
    value : IntPtr

    __value {
        set {
            if (value is DeviceDialogFunction) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DEVICEDIALOGDATA>} param0 
     * @returns {HRESULT} 
     */
    Call(param0) {
        result := DllCall(this.value, DEVICEDIALOGDATA.Ptr, param0, "HRESULT")
        return result
    }

    /**
     * A DeviceDialogFunction that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends DeviceDialogFunction {
        /**
         * Creates a DeviceDialogFunction pointer that invokes the given AHK function when called.
         * @param {Func(DEVICEDIALOGDATA) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DEVICEDIALOGDATA.Ptr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
