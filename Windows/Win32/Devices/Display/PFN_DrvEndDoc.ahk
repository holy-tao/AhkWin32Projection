#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SURFOBJ.ahk" { SURFOBJ }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct PFN_DrvEndDoc {
    value : IntPtr

    __value {
        set {
            if (value is PFN_DrvEndDoc) {
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
     * @param {Integer} fl 
     * @returns {BOOL} 
     */
    Call(pso, fl) {
        result := DllCall(this.value, SURFOBJ.Ptr, pso, UInt32, fl, BOOL)
        return result
    }

    /**
     * A PFN_DrvEndDoc that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_DrvEndDoc {
        /**
         * Creates a PFN_DrvEndDoc pointer that invokes the given AHK function when called.
         * @param {Func(SURFOBJ, UInt32) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SURFOBJ.Ptr, UInt32, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
