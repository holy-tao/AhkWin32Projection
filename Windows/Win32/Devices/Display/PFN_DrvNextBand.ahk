#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\SURFOBJ.ahk" { SURFOBJ }
#Import "..\..\Foundation\POINTL.ahk" { POINTL }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct PFN_DrvNextBand {
    value : IntPtr

    __value {
        set {
            if (value is PFN_DrvNextBand) {
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
     * @param {Pointer<POINTL>} ppointl 
     * @returns {BOOL} 
     */
    Call(param0, ppointl) {
        result := DllCall(this.value, SURFOBJ.Ptr, param0, POINTL.Ptr, ppointl, BOOL)
        return result
    }

    /**
     * A PFN_DrvNextBand that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_DrvNextBand {
        /**
         * Creates a PFN_DrvNextBand pointer that invokes the given AHK function when called.
         * @param {Func(SURFOBJ, POINTL) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SURFOBJ.Ptr, POINTL.Ptr, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
