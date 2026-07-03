#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SURFOBJ.ahk" { SURFOBJ }
#Import "..\..\Foundation\RECTL.ahk" { RECTL }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct PFN_DrvMovePointer {
    value : IntPtr

    __value {
        set {
            if (value is PFN_DrvMovePointer) {
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
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Pointer<RECTL>} prcl 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(pso, x, y, prcl) {
        DllCall(this.value, SURFOBJ.Ptr, pso, Int32, x, Int32, y, RECTL.Ptr, prcl)
    }

    /**
     * A PFN_DrvMovePointer that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_DrvMovePointer {
        /**
         * Creates a PFN_DrvMovePointer pointer that invokes the given AHK function when called.
         * @param {Func(SURFOBJ, Int32, Int32, RECTL) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SURFOBJ.Ptr, Int32, Int32, RECTL.Ptr, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
