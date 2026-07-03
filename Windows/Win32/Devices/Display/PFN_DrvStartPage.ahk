#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SURFOBJ.ahk" { SURFOBJ }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct PFN_DrvStartPage {
    value : IntPtr

    __value {
        set {
            if (value is PFN_DrvStartPage) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<SURFOBJ>} pso 
     * @returns {BOOL} 
     */
    Call(pso) {
        result := DllCall(this.value, SURFOBJ.Ptr, pso, BOOL)
        return result
    }

    /**
     * A PFN_DrvStartPage that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_DrvStartPage {
        /**
         * Creates a PFN_DrvStartPage pointer that invokes the given AHK function when called.
         * @param {Func(SURFOBJ) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SURFOBJ.Ptr, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
