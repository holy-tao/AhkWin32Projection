#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SURFOBJ.ahk" { SURFOBJ }
#Import "..\..\Foundation\RECTL.ahk" { RECTL }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct PFN_DrvSynchronizeSurface {
    value : IntPtr

    __value {
        set {
            if (value is PFN_DrvSynchronizeSurface) {
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
     * @param {Pointer<RECTL>} param1 
     * @param {Integer} param2 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(param0, param1, param2) {
        DllCall(this.value, SURFOBJ.Ptr, param0, RECTL.Ptr, param1, UInt32, param2)
    }

    /**
     * A PFN_DrvSynchronizeSurface that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_DrvSynchronizeSurface {
        /**
         * Creates a PFN_DrvSynchronizeSurface pointer that invokes the given AHK function when called.
         * @param {Func(SURFOBJ, RECTL, UInt32) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SURFOBJ.Ptr, RECTL.Ptr, UInt32, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
