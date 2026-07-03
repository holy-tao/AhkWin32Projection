#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SURFOBJ.ahk" { SURFOBJ }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct PFN_DrvStartDxInterop {
    value : IntPtr

    __value {
        set {
            if (value is PFN_DrvStartDxInterop) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<SURFOBJ>} param0 
     * @param {BOOL} param1 
     * @param {Pointer<Void>} KernelModeDeviceHandle 
     * @returns {BOOL} 
     */
    Call(param0, param1, KernelModeDeviceHandle) {
        KernelModeDeviceHandleMarshal := KernelModeDeviceHandle is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, SURFOBJ.Ptr, param0, BOOL, param1, KernelModeDeviceHandleMarshal, KernelModeDeviceHandle, BOOL)
        return result
    }

    /**
     * A PFN_DrvStartDxInterop that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_DrvStartDxInterop {
        /**
         * Creates a PFN_DrvStartDxInterop pointer that invokes the given AHK function when called.
         * @param {Func(SURFOBJ, BOOL, "ptr") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SURFOBJ.Ptr, BOOL, "ptr", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
