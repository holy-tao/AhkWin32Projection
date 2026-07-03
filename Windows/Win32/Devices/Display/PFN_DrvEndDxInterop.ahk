#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SURFOBJ.ahk" { SURFOBJ }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct PFN_DrvEndDxInterop {
    value : IntPtr

    __value {
        set {
            if (value is PFN_DrvEndDxInterop) {
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
     * @param {Pointer<BOOL>} param2 
     * @param {Pointer<Void>} KernelModeDeviceHandle 
     * @returns {BOOL} 
     */
    Call(param0, param1, param2, KernelModeDeviceHandle) {
        param2Marshal := param2 is VarRef ? "int*" : "ptr"
        KernelModeDeviceHandleMarshal := KernelModeDeviceHandle is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, SURFOBJ.Ptr, param0, BOOL, param1, param2Marshal, param2, KernelModeDeviceHandleMarshal, KernelModeDeviceHandle, BOOL)
        return result
    }

    /**
     * A PFN_DrvEndDxInterop that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_DrvEndDxInterop {
        /**
         * Creates a PFN_DrvEndDxInterop pointer that invokes the given AHK function when called.
         * @param {Func(SURFOBJ, BOOL, BOOL, "ptr") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SURFOBJ.Ptr, BOOL, BOOL.Ptr, "ptr", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
