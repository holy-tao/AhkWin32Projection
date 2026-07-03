#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SURFOBJ.ahk" { SURFOBJ }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct PFN_DrvEscape {
    value : IntPtr

    __value {
        set {
            if (value is PFN_DrvEscape) {
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
     * @param {Integer} param1 
     * @param {Integer} param2 
     * @param {Pointer<Void>} param3 
     * @param {Integer} param4 
     * @param {Pointer<Void>} param5 
     * @returns {Integer} 
     */
    Call(param0, param1, param2, param3, param4, param5) {
        param3Marshal := param3 is VarRef ? "ptr" : "ptr"
        param5Marshal := param5 is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, SURFOBJ.Ptr, param0, UInt32, param1, UInt32, param2, param3Marshal, param3, UInt32, param4, param5Marshal, param5, UInt32)
        return result
    }

    /**
     * A PFN_DrvEscape that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_DrvEscape {
        /**
         * Creates a PFN_DrvEscape pointer that invokes the given AHK function when called.
         * @param {Func(SURFOBJ, UInt32, UInt32, "ptr", UInt32, "ptr") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SURFOBJ.Ptr, UInt32, UInt32, "ptr", UInt32, "ptr", UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
