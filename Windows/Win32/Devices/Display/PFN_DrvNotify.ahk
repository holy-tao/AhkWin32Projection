#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SURFOBJ.ahk" { SURFOBJ }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct PFN_DrvNotify {
    value : IntPtr

    __value {
        set {
            if (value is PFN_DrvNotify) {
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
     * @param {Pointer<Void>} param2 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(param0, param1, param2) {
        param2Marshal := param2 is VarRef ? "ptr" : "ptr"

        DllCall(this.value, SURFOBJ.Ptr, param0, UInt32, param1, param2Marshal, param2)
    }

    /**
     * A PFN_DrvNotify that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_DrvNotify {
        /**
         * Creates a PFN_DrvNotify pointer that invokes the given AHK function when called.
         * @param {Func(SURFOBJ, UInt32, "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SURFOBJ.Ptr, UInt32, "ptr", IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
